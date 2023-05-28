<%@ page trimDirectiveWhitespaces="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<t:wrapper>
    <jsp:attribute name="language">lang="ru"</jsp:attribute>
    <jsp:attribute name="header">
        <meta name="Keywords" content="Java видео уроки">
        <meta name="Description" content="【Видео Java】  - ☜ⒿⒶⓋⒶ☞ 💥Бесплатно, ‼Видео/уроки, ✅Java">
        <title>Видео уроки по Java для начинающих</title>
        <link href="${pageContext.request.contextPath}/css/multi-select.css" rel="stylesheet">

      <meta property="og:title" content="Видео уроки по Java для начинающих"/>
      <meta property="og:type" content="article"/>
      <meta property="og:description" content="【Видео Java】  - ☜ⒿⒶⓋⒶ☞ 💥Бесплатно, ‼Видео/уроки, ✅Java"/>
      <meta property="og:site_name" content="ExamClouds">
      <meta property="og:url" content="https://www.examclouds.com/video-java-uroki">

      <meta property="twitter:title" content="Видео уроки по Java для начинающих"/>
      <meta property="twitter:card" content="summary"/>
      <meta property="twitter:description" content="【Видео Java】  - ☜ⒿⒶⓋⒶ☞ 💥Бесплатно, ‼Видео/уроки, ✅Java"/>
      <meta property="twitter:site" content="@ExamClouds">
      <meta property="og:image" content="/images/general/logo.webp"/>
      <meta property="twitter:image" content="https://www.examclouds.com/images/general/logo.webp"/>

     </jsp:attribute>
    <jsp:body>
        <%@ taglib uri="/WEB-INF/tld/cache-tagjsp-taglib.tld" prefix="cache" %>
        <cache:cacheTag/>
        <div class="breadCrumbs">
            <ol itemscope itemtype="http://schema.org/BreadcrumbList">
                <%@ include file="/WEB-INF/breadCrumbs/homeBreadCrumb.jsp" %>
                <li>Видео Java Уроки</li>
            </ol>
        </div>
        <main>
            <div class="category-article">
                <h1 class="all-questions-header">Видео Java Уроки</h1>
                <ol>
                    <LI>Введение в Java
                        <ol>
                            <li><a href="https://www.youtube.com/embed/PSArrvnl_Ak" target="_self">Особенности языка Java</a></li>
                            <li><a href="https://www.youtube.com/embed/61T3kISDoGU" target="_self">История развития языка</a></li>
                            <li><a href="https://www.youtube.com/embed/XTyt3iaIDuw" target="_self">Java SE/EE/ME</a></li>
                            <li><a href="https://youtu.be/O2h6SU53Lq4" target="_self">Что такое транслятор, компилятор, интерпретатор и байт-код</a></li>
                         </ol>
                    </LI>
                    <LI>Создание и запуск первого Java-приложения
                        <ol>
                            <li><a href="https://youtu.be/DOmcxcYqM44" target="_self">Создание первого приложения</a></li>
                            <li><a href="https://youtu.be/vxGvpGi3FCs" target="_self">Установка JDK</a></li>
                            <li><a href="https://youtu.be/OM70L2O0I-A" target="_self">Компиляция и запуск приложения из командной строки</a></li>
                            <li><a href="https://youtu.be/ij1tndVoLbw" target="_self">Пакеты</a></li>
                            <li><a href="https://youtu.be/Qg6MPtD10tM" target="_self">Компиляция с помощью -sourcepath</a></li>
                            <li><a href="https://youtu.be/ukXdou9_acw" target="_self">Classpath</a></li>
                            <li><a href="https://youtu.be/THTjy3HefEo" target="_self">JAR-Файлы</a></li>
                            <li><a href="https://youtu.be/Ur2oXDhX5Nk" target="_self">Аргументы командной строки</a></li>
                            <li><a href="https://youtu.be/mg5o7d8PSbY" target="_self">Создание проекта в IntelliJ IDEA</a></li>
                         </ol>
                    </LI>
                    <LI>Лексика языка
                        <ol>
                            <li><a href="https://youtu.be/sLDJmOTSMNY" target="_self">Пробелы</a></li>
                            <li><a href="https://youtu.be/iEYi2R_cik8" target="_self">Идентификаторы</a></li>
                            <li><a href="https://youtu.be/S_Y5nyGeXcU" target="_self">Правила именования переменных</a></li>
                            <li><a href="https://youtu.be/3iVJUwksTIg" target="_self">Комментарии</a></li>
                            <li><a href="https://youtu.be/MTLa9Lwk8n4" target="_self">Ключевые слова</a></li>
                            <li><a href="https://youtu.be/bsovM4AmXZY" target="_self">Примитивные типы данных</a></li>
                            <li><a href="https://youtu.be/JiZ9buiGUCQ" target="_self">Тип данных char</a></li>
                            <li><a href="https://youtu.be/UEBYGNi4WLM" target="_self">Типы byte, short, int, long</a></li>
                            <li><a href="https://youtu.be/KCisyDiwpdM" target="_self">Числа с плавающей точкой</a></li>
                            <li><a href="https://youtu.be/gfaZoUyG61s" target="_self">Литералы</a></li>
                            <li><a href="https://youtu.be/R0SblwFGeLU" target="_self">Методы</a></li>
                            <li><a href="https://youtu.be/Ah0e8Z-MbqU" target="_self">Переменные</a></li>
                            <li><a href="https://youtu.be/kHn24KETXg0" target="_self">Прямой код и дополнительный код</a></li>
                            <li><a href="https://youtu.be/pwQ8465nR0w" target="_self">Преобразование и приведение примитивных типов</a></li>
                            <li><a href="https://youtu.be/OvgtsmlpNHA" target="_self">Ввод с клавиатуры</a></li>
                        </ol>
                    </LI>
                    <LI>Операции Java
                        <ol>
                            <li><a href="https://youtu.be/eBk336zj09I" target="_self">Арифметические операторы</a></li>
                            <li><a href="https://youtu.be/PcDNuLr1-yA" target="_self">Инкремент и декремент</a></li>
                            <li><a href="https://youtu.be/MBWsgwdz4tU" target="_self">Операторы сравнения</a></li>
                            <li><a href="https://youtu.be/4bJRKT3EdDI" target="_self">Логические операторы</a></li>
                            <li><a href="https://youtu.be/83wPiNkGZjM" target="_self">Тернарный оператор</a></li>
                            <li><a href="https://youtu.be/9jEbhd89b4w" target="_self">Оператор присваивания</a></li>
                            <li><a href="https://youtu.be/h5akjWSQ158" target="_self">Приоритет операций</a></li>
                            <li><a href="https://youtu.be/zGBQ2xxyXBg" target="_self">Конкатенация строк</a></li>
                            <li><a href="https://youtu.be/fA7Mnn7uIJE" target="_self">Побитовые операции</a></li>
                        </ol>
                    </LI>
                    <LI>Операторы
                        <ol>
                            <li><a href="https://youtu.be/knx3SPj8QRQ" target="_self">Условный оператор If</a></li>
                            <li><a href="https://youtu.be/MjIUVposZdQ" target="_self">Оператор switch</a></li>
                            <li><a href="https://youtu.be/toqty18pb7w" target="_self">Циклы Java</a></li>
                            <li><a href="https://youtu.be/9kIrpoSJTcY" target="_self">Цикл while</a></li>
                            <li><a href="https://youtu.be/yt9pHkkUJks" target="_self">Цикл do-while</a></li>
                            <li><a href="https://youtu.be/sTd1xDsw0r8" target="_self">Цикл for</a></li>
                            <li><a href="https://youtu.be/jTv9J4VFZsE" target="_self">Цикл foreach</a></li>
                            <li><a href="https://youtu.be/9jGb-pwD3jE" target="_self">Оператор break</a></li>
                            <li><a href="https://youtu.be/NWeDKAEFJLE" target="_self">Оператор continue</a></li>
                            <li><a href="https://youtu.be/HWxxQI43vm4" target="_self">Оператор return</a></li>
                            <li><a href="https://youtu.be/xDntxVJAH5s" target="_self">System.exit()</a></li>
                        </ol>
                    </LI>
                    <LI>Массивы
                        <ol>
                            <li><a href="https://youtu.be/xlA9Lr_zaOc" target="_self">Введение в массивы</a></li>
                            <li><a href="https://youtu.be/WORWWAJ9-oI" target="_self">Одномерные массивы</a></li>
                            <li><a href="https://youtu.be/Y44Kcc2VhfE" target="_self">Многомерные массивы</a></li>
                            <li><a href="https://youtu.be/ab3KYq9_dGQ" target="_self">Длина массива</a></li>
                            <li><a href="https://youtu.be/v31HjcKe7ig" target="_self">Метод Arrays.toString()</a></li>
                            <li><a href="https://youtu.be/21pnBZ65ZD4" target="_self">Метод Arrays.deepToString()</a></li>
                            <li><a href="https://youtu.be/5bJxCaSxjmo" target="_self">Метод Arrays.sort()</a></li>
                            <li><a href="https://youtu.be/-D489f3Z3cg" target="_self">Метод Arrays.binarySearch()</a></li>
                            <li><a href="https://youtu.be/-MqL45BlUDU" target="_self">Метод System.arraycopy()</a></li>
                        </ol>
                    </LI>
                    <LI>Алгоритмы
                        <ol>
                            <li><a href="https://youtu.be/uEfOXX_vv6I" target="_self">Среднее арифметическое</a></li>
                            <li><a href="https://youtu.be/HyUR1kWVc7c" target="_self">Числа Фибоначчи</a></li>
                            <li><a href="https://youtu.be/8FPMd0Uono4" target="_self">Вычисление сложности алгоритма</a></li>
                            <li><a href="https://youtu.be/yPbCEDnp9t4" target="_self">Метод swap</a></li>
                            <li><a href="https://youtu.be/bwcOfkHEnKA" target="_self">Реверс массива</a></li>
                            <li><a href="https://youtu.be/11LLmDnyekQ" target="_self">Алгоритм сортировки пузырьком</a></li>
                            <li><a href="https://youtu.be/GBWJZiI0K-s" target="_self">Сортировка выбором</a></li>
                            <li><a href="https://youtu.be/Ohi8-XvOuv4" target="_self">Поиск элемента в массиве</a></li>
                        </ol>
                    </LI>
                    <LI>Контроль версий
                        <ol>
                            <li><a href="https://youtu.be/l0cA9kfJC8I" target="_self">Система контроля версий</a></li>
                            <li><a href="https://youtu.be/PJlwD45FkvI" target="_self">GitHub и Git</a></li>
                            <li><a href="https://youtu.be/ByUv_kgCiEI" target="_self">Клонирование репозитория с GitHub</a></li>
                            <li><a href="https://youtu.be/xbWNwXsm6Xw" target="_self">Создание локального репозитория git</a></li>
                        </ol>
                    </LI>
                    <LI>ООП
                        <ol>
                            <li><a href="https://youtu.be/gcDqVjju4kc" target="_self">Процедурное и объектно-ориентированное программирование</a></li>
                            <li><a href="https://youtu.be/8_qhKy_IFMc" target="_self">Принципы ООП</a></li>
                            <li><a href="https://youtu.be/JXnS0_0ng_k" target="_self">Классы и объекты</a></li>
                            <li><a href="https://youtu.be/8c8uCLsNMAU" target="_self">Конструктор</a></li>
                            <li><a href="https://youtu.be/jOijvi2EE7o" target="_self">Ключевое слово this</a></li>
                            <li><a href="https://youtu.be/0hmC1KWm5wg" target="_self">Перегрузка</a></li>
                            <li><a href="https://youtu.be/mqpMjw6cqe0" target="_self">Стек и куча</a></li>
                            <li><a href="https://youtu.be/fypaeLozPyI" target="_self">Передача объектов в методы</a></li>
                            <li><a href="https://youtu.be/-XHQclYxXJg" target="_self">Java varargs</a></li>
                            <li><a href="https://youtu.be/BMKlEH0PjP8" target="_self">Рекурсия</a></li>
                            <li><a href="https://youtu.be/ZxIP2tA5kq4" target="_self">Сборщик мусора и метод finalize</a></li>
                            <li><a href="https://youtu.be/9eaw9ylG5uo" target="_self">Наследование</a></li>
                            <li><a href="https://youtu.be/NCMzCQ1PGEk" target="_self">Ключевое слово super</a></li>
                            <li><a href="https://youtu.be/LSPghXPDIaU" target="_self">Модификаторы доступа</a></li>
                            <li><a href="https://youtu.be/d76FCObYi6U" target="_self">Геттеры и сеттеры</a></li>
                            <li><a href="https://youtu.be/kox_L8I0BQI" target="_self">Переопределение методов</a></li>
                            <li><a href="https://youtu.be/ZyDIaHRREn0" target="_self">Абстрактные классы и методы</a></li>
                            <li><a href="https://youtu.be/C4rvlLPHdk4" target="_self">Ключевое слово final</a></li>
                        </ol>
                    </LI>
                    <LI>Ключевое слово static
                        <ol>
                            <li><a href="https://youtu.be/3XU2foMby5U" target="_self">Ключевое слово static</a></li>
                            <li><a href="https://youtu.be/of0e4lehtl4" target="_self">Статические переменные</a></li>
                            <li><a href="https://youtu.be/qw9m9q9IF58" target="_self">Статические методы</a></li>
                            <li><a href="https://youtu.be/RGXcQ5x9pPw" target="_self">Статический блок</a></li>
                            <li><a href="https://youtu.be/mLkgbZoB7Iw" target="_self">Java static import</a></li>
                        </ol>
                    </LI>
                    <LI>Класс Object и его методы
                        <ol>
                            <li><a href="https://youtu.be/bL7c2YRxpOk" target="_self">Класс Object и его методы</a></li>
                            <li><a href="https://youtu.be/v3D5iIhC2Yg" target="_self">Метод equals()</a></li>
                            <li><a href="https://youtu.be/I1k9gl66xJY" target="_self">Метод toString()</a></li>
                            <li><a href="https://youtu.be/3WkuW74mWVM" target="_self">Модификатор native</a></li>
                        </ol>
                    </LI>
                    <LI>Интерфейсы и перечисления
                        <ol>
                            <li><a href="https://youtu.be/YQAY9HDdezs" target="_self">Интерфейс</a></li>
                            <li><a href="https://youtu.be/HyJtdT5X03E" target="_self">Отношения между классами</a></li>
                            <li><a href="https://youtu.be/D_P6iHPHL_0" target="_self">Приведение ссылочных типов</a></li>
                            <li><a href="https://youtu.be/A2srF9Ivcvg" target="_self">Перечисления</a></li>
                        </ol>
                    </LI>
                    <LI>Классы обертки
                        <ol>
                            <li><a href="https://youtu.be/m4J9hV4PjU0" target="_self">Классы оболочки</a></li>
                            <li><a href="https://youtu.be/NiwF6Gr3pWI" target="_self">Автоупаковка</a></li>
                            <li><a href="https://youtu.be/ApLlT7LCnIs" target="_self">Перегрузка с дополнительными факторами</a></li>
                        </ol>
                    </LI>
                    <LI>Строки
                        <ol>
                            <li><a href="https://youtu.be/OPooEJad_Hw" target="_self">Работа со строками</a></li>
                            <li><a href="https://youtu.be/bKc6zvWF-nw" target="_self">StringBuffer и StringBuilder</a></li>
                            <li><a href="https://youtu.be/gDPfNJw2VQ8" target="_self">Форматирование строк</a></li>
                            <li><a href="https://youtu.be/IW1Y9X5RUd8" target="_self">Регулярные выражения</a></li>
                        </ol>
                    </LI>
                    <LI>Локализация и интернационализация
                        <ol>
                            <li><a href="https://youtu.be/RsES0vPpZUA" target="_self">Локализация и интернационализация</a></li>
                            <li><a href="https://youtu.be/ImvwJsp6LBg" target="_self">Класс Locale</a></li>
                            <li><a href="https://youtu.be/p10dpjLwRBs" target="_self">Класс ResourceBundle</a></li>
                            <li><a href="https://youtu.be/HcwJwJXAAgo" target="_self">Класс NumberFormat</a></li>
                        </ol>
                    </LI>
                    <LI>Дата и время в Java 8
                        <ol>
                            <li><a href="https://youtu.be/KF6SCjrHhHc" target="_self">Дата и время в Java 8</a></li>
                            <li><a href="https://youtu.be/nzqMiSNruC0" target="_self">Класс LocalDate</a></li>
                            <li><a href="https://youtu.be/nTPG_MZNTdI" target="_self">Класс LocalTime</a></li>
                            <li><a href="https://youtu.be/_LyWueHkIxY" target="_self">Класс LocalDateTime</a></li>
                            <li><a href="https://youtu.be/SmjmGfu8UaU" target="_self">Класс Instant</a></li>
                            <li><a href="https://youtu.be/R2oK-g11C0k" target="_self">Класс Period</a></li>
                            <li><a href="https://youtu.be/xCa2HqbSCcs" target="_self">Класс Duration</a></li>
                            <li><a href="https://youtu.be/9LTnrcTqkmc" target="_self">Класс DateTimeFormatter</a></li>
                        </ol>
                    </LI>
                    <LI>Внутренние классы и дженерики
                        <ol>
                            <li><a href="https://youtu.be/gO-_r3dCyzY" target="_self">Дженерики Java</a></li>
                            <li><a href="https://youtu.be/CRN6lCfAkVE" target="_self">Вложенные классы</a></li>
                        </ol>
                    </LI>
                    <LI>Лямбда
                        <ol>
                            <li><a href="https://youtu.be/Y_Ifri215IA" target="_self">Лямбда выражения</a></li>
                            <li><a href="https://youtu.be/rFdl3_hTZwM" target="_self">Функциональный интерфейс</a></li>
                            <li><a href="https://youtu.be/kPwgwXaw42s" target="_self">Интерфейс Predicate</a></li>
                            <li><a href="https://youtu.be/-HhwEMtl5vI" target="_self">Интерфейс Consumer</a></li>
                            <li><a href="https://youtu.be/yiF9tFGtPug" target="_self">Интерфейс Function</a></li>
                            <li><a href="https://youtu.be/W-khoQcvZ0o" target="_self">Интерфейс Supplier</a></li>
                            <li><a href="https://youtu.be/w3avYlcHJpw" target="_self">Интерфейс UnaryOperator</a></li>
                            <li><a href="https://youtu.be/Rj0sMsXJQz8" target="_self">Специализации функциональных интерфейсов</a></li>
                            <li><a href="https://youtu.be/6JMKA3WkfPQ" target="_self">Ссылки на методы</a></li>
                        </ol>
                    </LI>
                    <LI>Коллекции в Java
                        <ol>
                            <li><a href="https://youtu.be/e484kUv3ncs" target="_self">Коллекции в Java</a></li>
                            <li><a href="https://youtu.be/7t-OqmaZ8Hg" target="_self">Интерфейс Collection</a></li>
                            <li><a href="https://youtu.be/2XRgjpewiWg" target="_self">Структуры данных</a></li>
                            <li><a href="https://youtu.be/hWQxH9j9q8Y" target="_self">Интерфейс List и класс ArrayList</a></li>
                            <li><a href="https://youtu.be/lTZCrSwEDbY" target="_self">Интерфейс Set и классы HashSet, LinkedHashSet</a></li>
                            <li><a href="https://youtu.be/1rebVKpNiyc" target="_self">Интерфейс SortedSet и класс TreeSet</a></li>
                            <li><a href="https://youtu.be/in_B6nMGfj0" target="_self">Интерфейсы Comparable и Comparator</a></li>
                            <li><a href="https://youtu.be/sMqyUSeEtIo" target="_self">Интерфейс NavigableSet</a></li>
                        </ol>
                    </LI>
                </ol>
            </div>
        </main>
        <%@ include file="/WEB-INF/socialButtons.jsp" %>
    </jsp:body>
</t:wrapper>
