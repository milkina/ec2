<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:wrapper>
 <jsp:attribute name="header">
    <title>${SERIES.id == null ? 'Новая серия' : 'Редактирование серии'} — админка | ExamClouds</title>
    <meta name="robots" content="noindex, nofollow">
    <style>
      .tf{display:grid;grid-template-columns:200px minmax(0,1fr);gap:10px 16px;align-items:start;max-width:1000px}
      .tf label{font-weight:600;padding-top:6px}
      .tf input[type=text],.tf input[type=number],.tf select,.tf textarea{width:100%;box-sizing:border-box;font:inherit;padding:6px 8px}
      .tf .help{grid-column:2;font-size:13px;color:#666;margin-top:-6px}
      .tf-errors{background:#fdecec;color:#8a1f1f;padding:10px 16px;border-radius:6px;margin:12px 0}
      .tf-actions{display:flex;gap:12px;align-items:center;margin:20px 0}
      @media (max-width:800px){.tf{grid-template-columns:1fr}.tf .help{grid-column:1}}
    </style>
 </jsp:attribute>
 <jsp:body>
  <div class="mainArea">
    <p><a href="${pageContext.request.contextPath}/admin-task-projects">← Серии задач</a></p>
    <h1>${SERIES.id == null ? 'Новая серия' : 'Редактирование серии'}</h1>
    <c:if test="${not empty ERRORS}">
      <div class="tf-errors"><strong>Не сохранено:</strong>
        <ul><c:forEach var="e" items="${ERRORS}"><li><c:out value="${e}"/></li></c:forEach></ul>
      </div>
    </c:if>
    <form action="${pageContext.request.contextPath}/admin-save-task-project" method="post" accept-charset="UTF-8">
      <input type="hidden" name="id" value="${SERIES.id}">
      <div class="tf">
        <label for="course">Курс *</label>
        <select id="course" name="course">
          <option value="java-core-russian" ${SERIES.course == 'java-core-russian' ? 'selected' : ''}>java-core-russian (RU)</option>
          <option value="java-core" ${SERIES.course == 'java-core' ? 'selected' : ''}>java-core (EN)</option>
        </select>

        <label for="code">Код серии *</label>
        <input type="text" id="code" name="code" maxlength="40" required pattern="[a-z0-9-]+" value="${fn:escapeXml(SERIES.code)}" placeholder="online-shop">
        <div class="help">Этот же код ставится задачам серии (поле «Сквозной проект» в форме задачи). Один код для RU и EN — так серии языков связаны. Меняйте код, только если поменяли его и у задач.</div>

        <label for="name">Название *</label>
        <input type="text" id="name" name="name" maxlength="100" required value="${fn:escapeXml(SERIES.name)}" placeholder="Интернет-магазин">
        <div class="help">Коротко: в бейдже на карточке модуля («Интернет-магазин · часть 6») и под заголовком задачи.</div>

        <label for="title">Заголовок блока *</label>
        <input type="text" id="title" name="title" maxlength="255" required value="${fn:escapeXml(SERIES.title)}" placeholder="Учебный проект «Интернет-магазин»: от ООП до JDBC">
        <div class="help">H2 блока серии на хабе и текст тизера в шапке хаба.</div>

        <label for="description">Описание</label>
        <textarea id="description" name="description" rows="4" maxlength="2000"><c:out value="${SERIES.description}"/></textarea>
        <div class="help">Абзац под заголовком: что получится в итоге. Обычный текст, без HTML. Не пишите число частей — оно считается автоматически.</div>

        <label for="note">Примечание</label>
        <input type="text" id="note" name="note" maxlength="255" value="${fn:escapeXml(SERIES.note)}" placeholder="Подходит как сквозная лабораторная работа…">
        <div class="help">Строка внизу большого блока, рядом с кнопкой «Начать с части 1».</div>

        <label for="orderId">Порядок</label>
        <input type="number" id="orderId" name="orderId" step="1" required value="${SERIES.orderId}">

        <label for="featured">Большой блок</label>
        <div><input type="checkbox" id="featured" name="featured" ${SERIES.featured ? 'checked' : ''}> показывать большим блоком и в тизере хаба (если частей ≥ 3)</div>
      </div>
      <div class="tf-actions">
        <input type="submit" class="btn btn-primary" value="Сохранить">
        <a href="${pageContext.request.contextPath}/admin-task-projects">Отмена</a>
      </div>
    </form>
    <c:if test="${SERIES.id != null}">
      <form action="${pageContext.request.contextPath}/admin-delete-task-project" method="post"
            onsubmit="return confirm('Удалить серию? Задачи останутся, но на сайте вместо названия серии будет код.');">
        <input type="hidden" name="id" value="${SERIES.id}">
        <input type="submit" class="btn btn-outline btn-sm" value="Удалить серию">
      </form>
    </c:if>
  </div>
 </jsp:body>
</t:wrapper>
