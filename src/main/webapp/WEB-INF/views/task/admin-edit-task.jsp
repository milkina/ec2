<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:wrapper>
 <jsp:attribute name="header">
    <title>${TASK.id == null ? 'Новая задача' : 'Редактирование задачи'} — админка | ExamClouds</title>
    <meta name="robots" content="noindex, nofollow">
    <style>
      .tf{display:grid;grid-template-columns:200px minmax(0,1fr);gap:10px 16px;align-items:start;max-width:1100px}
      .tf label{font-weight:600;padding-top:6px}
      .tf input[type=text],.tf input[type=number],.tf select,.tf textarea{width:100%;box-sizing:border-box;font:inherit;padding:6px 8px}
      .tf textarea.code{font-family:monospace;font-size:13px}
      .tf .help{grid-column:2;font-size:13px;color:#666;margin-top:-6px}
      .tf .row-inline{display:flex;gap:12px;align-items:center;flex-wrap:wrap}
      .tf .row-inline input,.tf .row-inline select{width:auto}
      .tf-errors{background:#fdecec;color:#8a1f1f;padding:10px 16px;border-radius:6px;margin:12px 0}
      .tf-warn{background:#fff7e6;padding:8px 12px;border-radius:6px;margin:8px 0}
      .tf-actions{display:flex;gap:12px;align-items:center;margin:20px 0}
      @media (max-width:800px){.tf{grid-template-columns:1fr}.tf .help{grid-column:1}}
    </style>
 </jsp:attribute>
 <jsp:body>
  <div class="mainArea">
    <p><a href="${pageContext.request.contextPath}/admin-tasks?page=${PAGE.id}">← Задачи страницы «${PAGE.parentCategory.name}»</a></p>
    <h1>${TASK.id == null ? 'Новая задача' : 'Редактирование задачи'}</h1>

    <c:if test="${not empty ERRORS}">
      <div class="tf-errors"><strong>Не сохранено:</strong>
        <ul><c:forEach var="e" items="${ERRORS}"><li><c:out value="${e}"/></li></c:forEach></ul>
      </div>
    </c:if>
    <c:if test="${!HAS_MARKER}">
      <div class="tf-warn">В статье страницы нет маркера <code>&lt;!--TASKS--&gt;</code> — задача сохранится в БД, но на сайте появится только после обновления статьи.</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/admin-save-task" method="post" accept-charset="UTF-8" id="taskForm">
      <input type="hidden" name="id" value="${TASK.id}">
      <input type="hidden" name="page" value="${PAGE.id}">
      <div class="tf">
        <label>Страница</label>
        <div>${PAGE.parentCategory.name} · <code>${PAGE_COURSE}/${PAGE.pathName}</code> (category ${PAGE.id})</div>

        <label for="title">Заголовок *</label>
        <input type="text" id="title" name="title" maxlength="255" required value="${fn:escapeXml(TASK.title)}">
        <div class="help">Текст H2. Можно с HTML, например <code>&lt;code&gt;this&lt;/code&gt;</code>.</div>

        <label for="slug">Slug (якорь) *</label>
        <input type="text" id="slug" name="slug" maxlength="100" required pattern="[a-z0-9][a-z0-9-]*" value="${fn:escapeXml(TASK.slug)}">
        <div class="help">id заголовка: ссылка вида <code>…/${PAGE.pathName}#slug</code>. Меняйте осторожно — сломаются внешние ссылки на якорь.</div>

        <label for="uid">uid *</label>
        <input type="text" id="uid" name="uid" maxlength="80" required list="pairUids" value="${fn:escapeXml(TASK.uid)}">
        <c:choose>
          <c:when test="${PAGE_COURSE == 'java-core'}">
            <div class="help">Общий ключ пары RU/EN — выберите uid той же задачи на RU-странице<c:if test="${PAIR_PAGE != null}"> (${PAIR_PAGE.parentCategory.name})</c:if>.</div>
          </c:when>
          <c:otherwise><div class="help">Для RU-задачи — <code>t{id страницы}-{номер}</code>; EN-перевод получит тот же uid.</div></c:otherwise>
        </c:choose>
        <datalist id="pairUids">
          <c:forEach var="pt" items="${PAIR_TASKS}"><option value="${pt.uid}">${fn:escapeXml(pt.title)}</option></c:forEach>
        </datalist>

        <label for="TASK_BODY">Условие *</label>
        <textarea id="TASK_BODY" name="bodyHtml" rows="18"><c:out value="${TASK.bodyHtml}"/></textarea>

        <label for="hintTitle">Заголовок подсказки</label>
        <input type="text" id="hintTitle" name="hintTitle" maxlength="100" value="${fn:escapeXml(TASK.hintTitle)}" placeholder="Подсказка">
        <div class="help">Пусто — «Подсказка» / «Hint». Варьируйте: «Нюанс», «Частая ошибка», «Обратите внимание»…</div>

        <label for="hintHtml">Текст подсказки</label>
        <textarea id="hintHtml" name="hintHtml" rows="4" class="code"><c:out value="${TASK.hintHtml}"/></textarea>
        <div class="help">HTML внутри <code>&lt;p class="lesson-tip-text"&gt;</code>: без внешнего &lt;p&gt;, можно &lt;code&gt;, &lt;strong&gt;, &lt;a&gt;.</div>

        <label for="solutionUrl">Решение (Patreon)</label>
        <input type="text" id="solutionUrl" name="solutionUrl" maxlength="500" value="${fn:escapeXml(TASK.solutionUrl)}" placeholder="https://www.patreon.com/posts/...">

        <label for="videoUrl">Видеоразбор</label>
        <input type="text" id="videoUrl" name="videoUrl" maxlength="500" value="${fn:escapeXml(TASK.videoUrl)}" placeholder="https://youtu.be/...">

        <label>Уровень и время</label>
        <div class="row-inline">
          <select name="difficulty">
            <c:forEach var="d" items="${DIFFICULTIES}">
              <option value="${d}" ${TASK.difficulty == d ? 'selected' : ''}>${d}</option>
            </c:forEach>
          </select>
          <input type="number" name="estimatedMinutes" min="1" max="600" step="1" value="${TASK.estimatedMinutes}" placeholder="мин"> мин
          &nbsp; Порядок <input type="number" name="orderId" step="1" required value="${TASK.orderId}">
        </div>

        <label>Серия (сквозной проект)</label>
        <div class="row-inline">
          <select name="projectCode">
            <option value="">— не входит в серию —</option>
            <c:set var="codeKnown" value="false"/>
            <c:forEach var="sr" items="${SERIES}">
              <c:if test="${sr.code == TASK.projectCode}"><c:set var="codeKnown" value="true"/></c:if>
              <option value="${sr.code}" ${sr.code == TASK.projectCode ? 'selected' : ''}><c:out value="${sr.name}"/> (${sr.code})</option>
            </c:forEach>
            <c:if test="${not empty TASK.projectCode && !codeKnown}"><option value="${fn:escapeXml(TASK.projectCode)}" selected>${fn:escapeXml(TASK.projectCode)} — серии нет!</option></c:if>
          </select>
          
          часть <input type="number" name="projectPart" min="1" value="${TASK.projectPart}">
        </div>

        <label for="lessons">Уроки</label>
        <select id="lessons" name="lessons" multiple size="12">
          <c:forEach var="lesson" items="${LESSONS}">
            <c:set var="selected" value="false"/>
            <c:forEach var="sid" items="${SELECTED_LESSONS}"><c:if test="${sid == lesson.id}"><c:set var="selected" value="true"/></c:if></c:forEach>
            <option value="${lesson.id}" ${selected ? 'selected' : ''}>${lesson.parentCategory.name} › ${lesson.name}</option>
          </c:forEach>
        </select>
        <div class="help">Какие уроки закрепляет задача (Ctrl/Cmd + клик — несколько). Используется для блока «Практика по теме» в уроках.</div>

        <label for="hidden">Скрыта</label>
        <div><input type="checkbox" id="hidden" name="hidden" ${TASK.hidden ? 'checked' : ''}> не выводить на сайте</div>
      </div>

      <div class="tf-actions">
        <input type="submit" class="btn btn-primary" value="Сохранить">
        <a href="${pageContext.request.contextPath}/admin-tasks?page=${PAGE.id}">Отмена</a>
      </div>
    </form>

    <c:if test="${TASK.id != null}">
      <form action="${pageContext.request.contextPath}/admin-delete-task" method="post"
            onsubmit="return confirm('Удалить задачу «' + document.getElementById('title').value + '»? Это необратимо.');">
        <input type="hidden" name="id" value="${TASK.id}">
        <input type="submit" class="btn btn-outline btn-sm" value="Удалить задачу">
      </form>
    </c:if>
  </div>

  <script src="${pageContext.request.contextPath}/tinymce/js/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
  <script>
    tinymce.init({
      selector: 'textarea#TASK_BODY',
      plugins: 'code codesample link lists table',
      toolbar: 'undo redo | bold italic | bullist numlist | codesample | link | table | code',
      menubar: false,
      height: 460,
      remove_script_host: false,
      convert_urls: false,
      verify_html: false,
      valid_elements: '*[*]',
      browser_spellcheck: true,
      codesample_languages: [
        {text: 'Java', value: 'java'}, {text: 'Bash', value: 'bash'}, {text: 'SQL', value: 'sql'},
        {text: 'XML', value: 'markup'}, {text: 'Text', value: 'none'}
      ]
    });
    // TinyMCE пишет содержимое в textarea при submit; required на скрытой textarea мешал бы отправке — проверяем сами
    document.getElementById('taskForm').addEventListener('submit', function (e) {
      tinymce.triggerSave();
      if (!document.getElementById('TASK_BODY').value.trim()) {
        e.preventDefault();
        alert('Заполните условие задачи.');
      }
    });
  </script>
 </jsp:body>
</t:wrapper>
