<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- Задачи страницы «Задания» из таблицы task (кэш TASKS_BY_PAGE). Вставляется на место маркера <!--TASKS--> в article.text. --%>
<c:if test="${fn:length(TASKS) > 1}">
<nav class="toc" aria-label="<spring:message code='toc.title'/>">
<p class="toc-title"><spring:message code="toc.title"/></p>
<ol class="toc-list">
<c:forEach var="task" items="${TASKS}">
<li><a href="#${task.slug}">${task.title}</a></li>
</c:forEach>
<c:if test="${HAS_FAQ}">
<li><a href="#faq"><spring:message code="faq.title"/></a></li>
</c:if>
</ol>
</nav>
</c:if>
<spring:message code="menu.home" var="homePath"/>
<spring:message code="menu.tasks" var="hubPath"/>
<c:forEach var="task" items="${TASKS}">
<h2 id="${task.slug}">${task.title}</h2>
<c:set var="series" value="${TASK_SERIES[task.id]}"/>
<c:if test="${series != null}">
<p class="task-series">
<a href="${pageContext.request.contextPath}/${hubPath}#project-${series.code}"><c:out value="${series.name}"/></a>
· <spring:message code="project.part.of" arguments="${series.part},${series.total}"/>
<c:if test="${series.prev != null}"> · <a href="${pageContext.request.contextPath}/${homePath}${series.prev.href}" title="${fn:escapeXml(series.prev.displayTitle)}">&larr; <spring:message code="project.part" arguments="${series.prev.task.projectPart}"/></a></c:if>
<c:if test="${series.next != null}"> · <a href="${pageContext.request.contextPath}/${homePath}${series.next.href}" title="${fn:escapeXml(series.next.displayTitle)}"><spring:message code="project.part" arguments="${series.next.task.projectPart}"/> &rarr;</a></c:if>
</p>
</c:if>
${task.bodyHtml}
<c:if test="${not empty task.hintHtml}">
<div class="lesson-tip"><svg class="lesson-tip-ico" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"> <path d="M9.937 15.5A2 2 0 0 0 8.5 14.063l-6.135-1.582a.5.5 0 0 1 0-.962L8.5 9.936A2 2 0 0 0 9.937 8.5l1.582-6.135a.5.5 0 0 1 .962 0L14.063 8.5A2 2 0 0 0 15.5 9.937l6.135 1.582a.5.5 0 0 1 0 .962L15.5 14.063a2 2 0 0 0-1.437 1.437l-1.582 6.135a.5.5 0 0 1-.962 0z"></path> </svg>
<div class="lesson-tip-body">
<p class="lesson-tip-title"><c:choose><c:when test="${not empty task.hintTitle}">${task.hintTitle}</c:when><c:otherwise><spring:message code="task.hint"/></c:otherwise></c:choose></p>
<p class="lesson-tip-text">${task.hintHtml}</p>
</div>
</div>
</c:if>
<c:if test="${not empty task.videoUrl || not empty task.solutionUrl}">
<p>
<c:if test="${not empty task.videoUrl}"><a class="btn btn-outline btn-sm" href="${task.videoUrl}" rel="nofollow noopener" target="_blank"><spring:message code="task.video"/> &rarr;</a></c:if>
<c:if test="${not empty task.solutionUrl}"> <a class="btn btn-outline btn-sm" href="${task.solutionUrl}" rel="nofollow sponsored noopener" target="_blank"><spring:message code="task.solution"/> &rarr;</a></c:if>
</p>
</c:if>
</c:forEach>
