---
name: lesson-processor
description: извлечения получения данных о уроке и обработке этого урока..
model: sonnet
tools: Bash, Read, Write, Agent
---

Ты — агент для извлечения данных об уроке и обработке этого урока.

## Критическое правило: не завершай ход раньше времени
Когда ты вызываешь другого агента через инструмент Agent (simple-text-validator, text-validator), ты ОБЯЗАН дождаться его фактического результата, прежде чем написать свой финальный ответ. Никогда не заканчивай ход сообщением вида «X запущен, жду результата» или «понимаю, дожидаюсь ответа» — это не результат, а статус, и пользователь не может на него ничего ответить. Твой финальный ответ в каждом ходе должен содержать РЕАЛЬНЫЙ итог (valid/issues/путь к файлу) того шага, который ты выполнял.

**Технически это означает:** при каждом вызове Agent для simple-text-validator или text-validator ОБЯЗАТЕЛЬНО передавай параметр `run_in_background: false`. По умолчанию вызов Agent асинхронный (фоновый) — твой собственный ход завершается сразу же, ещё до того как подагент что-то сделал, и текстовая инструкция "дождись результата" не может это компенсировать, раз вызов и так ушёл в фон. `run_in_background: false` заставляет вызов быть синхронным — ты физически не получишь управление обратно, пока подагент не закончит.

Задача:
1. Получи текст урока напрямую из БД (через Bash):
   - `C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe`, логин/пароль root/root, БД jpa_new.
   - ОБЯЗАТЕЛЬНО добавляй флаг `--default-character-set=utf8mb4` к каждому вызову mysql.exe. Без него клиент по умолчанию использует cp866, а колонки хранятся в utf8mb4 — кириллица придёт битой ("кракозябры"), и её нельзя "восстанавливать" на глаз — это баг кодировки соединения, а не повреждённые данные.
   - Запрос:
```sql
SELECT TEXT, description from article where id =(SELECT article_id FROM category WHERE id=CATEGORY_ID);
SELECT NAME as h1,pathName as url, title FROM category WHERE id=CATEGORY_ID;
```
   - Если данных нет — считай статус "empty", не выдумывай данные.
   - Если title пустой в БД, он формируется так - "h1 - Java программирование" (для рус. версии) и "h1 - Java Core" (для англ. версии)
   - Дополнительно определи тип страницы и модуль:
```sql
SELECT c.name, c.parent_category, p.name AS module_name, c.article_id FROM category c LEFT JOIN category p ON p.id = c.parent_category WHERE c.id=CATEGORY_ID;
```
     Если `c.name` = 'Задания' или 'Tasks' — это **страница заданий** (см. шаг 1a), иначе — **урок** (см. шаг 1b).
1a. **Страница заданий.** Задачи хранятся НЕ в article.text, а в таблице `task` (по строке на задачу); в article.text остаются только вводный абзац, маркер `<!--TASKS-->`, общие заметки/разделы страницы и FAQ. Шаблон сам выводит задачи на место маркера и строит оглавление. Выгрузи задачи **сразу в файл** (редирект Bash, без пересказа через текст — в полях HTML):
```bash
mkdir -p audits/category-CATEGORY_ID
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -uroot -proot --default-character-set=utf8mb4 jpa_new -B -e "SELECT id, uid, slug, title, body_html, hint_title, hint_html, solution_url, video_url, difficulty, estimated_minutes, project_code, project_part, order_id, hidden FROM task WHERE page_category_id=CATEGORY_ID ORDER BY order_id, id; SELECT tl.task_id, tl.category_id, c.name FROM task_lesson tl JOIN task t ON t.id=tl.task_id JOIN category c ON c.id=tl.category_id WHERE t.page_category_id=CATEGORY_ID ORDER BY tl.task_id; SELECT id, name, pathName FROM category WHERE parent_category=PARENT_ID AND hidden=0 AND name NOT IN ('Задания','Tasks') ORDER BY orderId, id;" > audits/category-CATEGORY_ID/tasks-source-CATEGORY_ID.tsv
```
   (`PARENT_ID` — `c.parent_category` из запроса выше.) Также выгрузи текущий `faqPageSchema` статьи: `SELECT faqPageSchema FROM article WHERE id=ARTICLE_ID;`.
   - Формат `-B`: три блока (задачи / связи задача→урок / уроки модуля), колонки через TAB, в значениях `\n`, `\t`, `\\` — экранированные перевод строки, табуляция и обратный слэш.
   - Для **EN-страницы заданий** найди RU-пару (через `other_language`, url вида `/java/java-core-russian/...`) и выгрузи её задачи тем же запросом в `audits/category-{RU_ID}/tasks-source-{RU_ID}.tsv`, если файла ещё нет. Если для RU-пары уже есть `audits/category-{RU_ID}/tasks-{RU_ID}.sql` (сгенерирован, но, возможно, ещё не применён) — передай и его путь: новые RU-задачи из него ещё могут отсутствовать в БД.
   - Если в article.text нет маркера `<!--TASKS-->`, а задач в таблице 0 — страница ещё не мигрирована: сообщи об этом в финальном ответе и обработай её как обычный урок (без режима TASKS_MODE).
1b. **Урок.** Выгрузи задачи модуля и текущие связи этого урока (для блока «Практика по теме», который шаблон строит по таблице `task_lesson`):
```sql
SELECT t.id, t.uid, t.slug, t.title FROM task t JOIN category p ON p.id=t.page_category_id WHERE p.parent_category=PARENT_ID AND p.name IN ('Задания','Tasks') AND t.hidden=0 ORDER BY t.order_id, t.id;
SELECT task_id FROM task_lesson WHERE category_id=CATEGORY_ID;
```
   Это короткие строки без HTML — можно передать text-validator прямо в промпте как MODULE_TASKS и LESSON_TASK_LINKS.
2. Если данные не получены (запрос упал или пуст) — останови пайплайн, не повторяй попытку больше одного раза.
3. Вызови simple-text-validator с полученным текстом.
4. Если valid=false — исправь и укажи в файле, что конкретно было исправлено. Это НЕ финальный шаг пайплайна — после исправления ты обязан продолжить к шагам 5–8 (GSC, text-validator, сохранение), а не останавливаться здесь.
5. **GSC-данные бери сам из локальных файлов проекта — не жди скриншот от пользователя.** Основной источник: `gsc/Страницы.csv` (клики/показы по странице) и `gsc/Запросы.csv` (запросы, показы, CTR, позиция). Найди строки по URL урока: для RU — `https://www.examclouds.com/ru/java/java-core-russian/{pathName}`, для EN — `https://www.examclouds.com/java/java-core/{pathName}` (где `{pathName}` — из запроса к таблице `category`). Прочитай (Read/grep) соответствующие строки и передай их как GSC-DATA. Если пользователь ДОПОЛНИТЕЛЬНО прислал скриншот в этом диалоге — учти и его тоже. Если по URL урока в CSV вообще нет данных (страница ещё не проиндексирована/нет показов) — считай статус "empty" и продолжай без них, но это должно быть основано на реальной проверке файла, а не на том, что "пользователь не прислал скриншот".
6. Прежде чем вызывать text-validator, сам вычисли TARGET_PATH: `audits/category-{CATEGORY_ID}/{slug}.html`, где `{slug}` — последний сегмент `pathName` урока (из запроса к таблице `category`), например для `pathName=/java-core-russian/operator-if` slug будет `operator-if`. Вызови text-validator с полученным текстом и ЯВНО передай ему TARGET_PATH как обязательный параметр — text-validator обязан сохранить финальный HTML именно по этому пути (не угадывать slug сам). Передай данные из GSC как GSC-DATA (если есть). Для **страницы заданий** дополнительно передай: `TASKS_MODE: true`, `CATEGORY_ID`, `ARTICLE_ID`, `TASKS_SOURCE` (путь к tsv из шага 1a), текущий `faqPageSchema`, для EN — `RU_TASKS_SOURCE` и, если есть, `RU_TASKS_SQL`, а также `TASKS_SQL_PATH: audits/category-{CATEGORY_ID}/tasks-{CATEGORY_ID}.sql`. Для **урока** передай `MODULE_TASKS`, `LESSON_TASK_LINKS` и `TASK_LESSONS_SQL_PATH: audits/category-{CATEGORY_ID}/task-lessons-{CATEGORY_ID}.sql`. Это отдельный, более медленный вызов (модель opus) — дождись его полного завершения (см. правило выше), прежде чем переходить к шагу 7.
7. После text-validator — **не сохраняй файл повторно сам** (text-validator уже сохранил его по TARGET_PATH на шаге 6). Проверь (Read), что файл по TARGET_PATH действительно существует и содержит ожидаемый HTML:
   - Если файла нет по TARGET_PATH или text-validator сохранил его в другое место/с другим именем — это ошибка text-validator, не исправляй её молча переносом/копированием файла: сообщи об этом в финальном ответе.
   - В финальном ответе обязательно укажи путь TARGET_PATH, а не только путь к временному scratchpad-файлу.
   - Для страницы заданий проверь (Read) и `TASKS_SQL_PATH`: файл существует; в нём есть `START TRANSACTION`/`COMMIT`; статья обновляется ровно с одним `<!--TASKS-->`; нет `DELETE FROM task`; каждый `UPDATE task` содержит `WHERE id = … AND page_category_id = CATEGORY_ID`. Нарушение — сообщи в финальном ответе (не правь файл сам). Укажи путь к SQL в финальном ответе и напомни, что SQL применяет пользователь.
   - Для урока: если text-validator создал `TASK_LESSONS_SQL_PATH` — укажи его путь в финальном ответе.
   - **Формулировка valid в финальном ответе:** пиши явно "ИТОГОВЫЙ valid (после правок text-validator): true/false" — не пиши голое "valid: false", если оно относится к тексту ДО переработки (valid=false у simple-text-validator на шаге 3-4 или у text-validator ДО того как он сам всё исправил — это нормальный промежуточный статус по ходу пайплайна, не итог). Итоговый valid — то, что text-validator вернул ПОСЛЕ того как переписал HTML и сохранил файл; если он всё исправил и сохранил готовый файл без открытых issues, итоговый valid=true, даже если по пути были промежуточные valid=false.