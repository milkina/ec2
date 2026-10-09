<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:wrapper>
 <jsp:attribute name="header">
    <title>Задачи — админка | ExamClouds</title>
    <meta name="robots" content="noindex, nofollow">
    <style>
      .ta-wrap{display:grid;grid-template-columns:280px minmax(0,1fr);gap:24px;align-items:start}
      .ta-pages{font-size:14px}
      .ta-pages h3{font-size:14px;margin:16px 0 6px;text-transform:uppercase;color:#666}
      .ta-pages a{display:flex;justify-content:space-between;gap:8px;padding:4px 8px;border-radius:6px;text-decoration:none;color:inherit}
      .ta-pages a:hover{background:#f2f4f7}
      .ta-pages a.is-active{background:#e8f1fd;font-weight:600}
      .ta-count{color:#888}
      .ta-table{width:100%;border-collapse:collapse;font-size:14px}
      .ta-table th,.ta-table td{border-bottom:1px solid #e5e7eb;padding:6px 8px;text-align:left;vertical-align:top}
      .ta-table tr.is-hidden td{opacity:.5}
      .ta-table tr.is-saved td{background:#effaf1}
      .ta-badge{display:inline-block;font-size:12px;padding:1px 6px;border-radius:4px;background:#f2f4f7;margin-right:4px}
      .ta-msg{padding:8px 12px;border-radius:6px;margin:8px 0;background:#effaf1}
      .ta-warn{padding:8px 12px;border-radius:6px;margin:8px 0;background:#fff7e6}
      @media (max-width:800px){.ta-wrap{grid-template-columns:1fr}}
    </style>
 </jsp:attribute>
 <jsp:body>
  <div class="mainArea">
    <h1>Практические задачи</h1>
    <p><a href="${pageContext.request.contextPath}/show-administration">← Администрирование</a></p>
    <div class="ta-wrap">
      <nav class="ta-pages">
        <h3>RU — Задания</h3>
        <c:forEach var="p" items="${TASK_PAGES_RU}">
          <a href="?page=${p.id}" class="${PAGE.id == p.id ? 'is-active' : ''}">
            <span>${p.parentCategory.name}</span><span class="ta-count">${TASK_COUNTS[p.id] != null ? TASK_COUNTS[p.id] : 0}</span>
          </a>
        </c:forEach>
        <h3>EN — Tasks</h3>
        <c:forEach var="p" items="${TASK_PAGES_EN}">
          <a href="?page=${p.id}" class="${PAGE.id == p.id ? 'is-active' : ''}">
            <span>${p.parentCategory.name}</span><span class="ta-count">${TASK_COUNTS[p.id] != null ? TASK_COUNTS[p.id] : 0}</span>
          </a>
        </c:forEach>
      </nav>

      <section>
        <c:choose>
          <c:when test="${PAGE == null}">
            <p>Выберите страницу слева.</p>
          </c:when>
          <c:otherwise>
            <c:set var="pathLang" value="${PAGE_COURSE == 'java-core-russian' ? 'ru/' : ''}"/>
            <h2>${PAGE.parentCategory.name} <small>(category ${PAGE.id})</small></h2>
            <p>
              <a href="${pageContext.request.contextPath}/${pathLang}java/${PAGE_COURSE}/${PAGE.pathName}" target="_blank">Открыть страницу ↗</a>
              &nbsp;·&nbsp;
              <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin-edit-task?page=${PAGE.id}">+ Добавить задачу</a>
            </p>
            <c:if test="${param.saved != null}"><div class="ta-msg">Задача сохранена, кэш обновлён.</div></c:if>
            <c:if test="${param.deleted != null}"><div class="ta-msg">Задача удалена, кэш обновлён.</div></c:if>
            <c:if test="${!HAS_MARKER}">
              <div class="ta-warn">В статье этой страницы нет маркера <code>&lt;!--TASKS--&gt;</code> — задачи из таблицы на сайте пока не выводятся (страница показывает article.text целиком).</div>
            </c:if>
            <table class="ta-table">
              <thead><tr><th>#</th><th>Задача</th><th>Уровень</th><th>Мин</th><th>Материалы</th><th>uid</th><th></th></tr></thead>
              <tbody>
              <c:forEach var="task" items="${PAGE_TASKS}" varStatus="st">
                <tr id="task-${task.id}" class="${task.hidden ? 'is-hidden' : ''} ${param.saved == task.id ? 'is-saved' : ''}">
                  <td>${task.orderId}</td>
                  <td><strong>${task.title}</strong><br><code>#${task.slug}</code>
                      <c:if test="${task.hidden}"> <span class="ta-badge">скрыта</span></c:if>
                      <c:if test="${not empty task.projectCode}"> <span class="ta-badge">${task.projectCode} · ч.${task.projectPart}</span></c:if>
                  </td>
                  <td>${task.difficulty}</td>
                  <td>${task.estimatedMinutes}</td>
                  <td>
                    <c:if test="${not empty task.hintHtml}"><span class="ta-badge">подсказка</span></c:if>
                    <c:if test="${not empty task.solutionUrl}"><span class="ta-badge">решение</span></c:if>
                    <c:if test="${not empty task.videoUrl}"><span class="ta-badge">видео</span></c:if>
                  </td>
                  <td><code>${task.uid}</code></td>
                  <td><a href="${pageContext.request.contextPath}/admin-edit-task?id=${task.id}">Редактировать</a></td>
                </tr>
              </c:forEach>
              <c:if test="${empty PAGE_TASKS}"><tr><td colspan="7">Задач пока нет.</td></tr></c:if>
              </tbody>
            </table>
          </c:otherwise>
        </c:choose>
      </section>
    </div>
  </div>
 </jsp:body>
</t:wrapper>
