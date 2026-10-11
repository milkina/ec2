<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:wrapper>
 <jsp:attribute name="header">
    <title>Серии задач — админка | ExamClouds</title>
    <meta name="robots" content="noindex, nofollow">
    <style>
      .sp-table{width:100%;border-collapse:collapse;font-size:14px;margin-bottom:24px}
      .sp-table th,.sp-table td{border-bottom:1px solid #e5e7eb;padding:6px 8px;text-align:left;vertical-align:top}
      .sp-badge{display:inline-block;font-size:12px;padding:1px 6px;border-radius:4px;background:#f2f4f7;margin-right:4px}
      .sp-msg{padding:8px 12px;border-radius:6px;margin:8px 0;background:#effaf1}
      .sp-warn{padding:8px 12px;border-radius:6px;margin:8px 0;background:#fff7e6}
    </style>
 </jsp:attribute>
 <jsp:body>
  <div class="mainArea">
    <h1>Серии задач</h1>
    <p><a href="${pageContext.request.contextPath}/admin-tasks">← Практические задачи</a></p>
    <p>Серия — сквозной проект из нескольких задач разных модулей (у задач одинаковый «Код серии» и номер части).
       Название выводится в бейджах на хабе и под заголовком задачи, заголовок и описание — в блоке серии на хабе.</p>
    <c:if test="${param.saved != null}"><div class="sp-msg">Серия сохранена, кэш обновлён.</div></c:if>
    <c:if test="${param.deleted != null}"><div class="sp-msg">Серия удалена, кэш обновлён. Задачи с этим кодом остались — на сайте вместо названия будет код.</div></c:if>
    <c:if test="${not empty ORPHAN_CODES}">
      <div class="sp-warn"><strong>Коды серий в задачах без строки серии</strong> (опечатка или серию не создали) —
        на сайте вместо названия выводится код:
        <ul><c:forEach var="o" items="${ORPHAN_CODES}"><li><c:out value="${o}"/></li></c:forEach></ul>
      </div>
    </c:if>
    <p>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin-edit-task-project?course=java-core-russian">+ Серия для RU</a>
      <a class="btn btn-outline btn-sm" href="${pageContext.request.contextPath}/admin-edit-task-project?course=java-core">+ Серия для EN</a>
    </p>
    <table class="sp-table">
      <thead><tr><th>Курс</th><th>Код</th><th>Название / заголовок</th><th>Частей</th><th>Вид</th><th>Порядок</th><th></th></tr></thead>
      <tbody>
      <c:forEach var="s" items="${SERIES_LIST}">
        <tr>
          <td>${s.course}</td>
          <td><code>${s.code}</code></td>
          <td><strong><c:out value="${s.name}"/></strong><br><c:out value="${s.title}"/></td>
          <td>${SERIES_USAGE[s.course][s.code] != null ? SERIES_USAGE[s.course][s.code] : 0}</td>
          <td>
            <c:if test="${s.featured}"><span class="sp-badge">большой блок</span></c:if>
          </td>
          <td>${s.orderId}</td>
          <td><a href="${pageContext.request.contextPath}/admin-edit-task-project?id=${s.id}">Редактировать</a></td>
        </tr>
      </c:forEach>
      <c:if test="${empty SERIES_LIST}"><tr><td colspan="7">Серий пока нет.</td></tr></c:if>
      </tbody>
    </table>
    <p style="font-size:13px;color:#666">На хабе серия выводится, если в ней не меньше 2 частей. «Большой блок» (с тизером в шапке хаба и списком частей во всю ширину) — для серии с отметкой и не меньше 3 частями; остальные — компактной карточкой.</p>
  </div>
 </jsp:body>
</t:wrapper>
