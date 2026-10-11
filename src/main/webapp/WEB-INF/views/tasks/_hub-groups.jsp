<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- Карточки модулей хаба задач, сгруппированные по уровню. Данные — HUB_GROUPS, PAGE_STATS, PROJECT_BADGES, PROJECTS, PROJECT_ANCHORS (TaskUtility). --%>
<spring:message code="menu.home" var="homePath"/>


<c:forEach var="group" items="${HUB_GROUPS}">
  <c:set var="BLOCK_PROJECTS" value="${PROJECT_ANCHORS[group.pages[0].id]}" scope="request"/>
  <c:if test="${not empty BLOCK_PROJECTS}">
    <jsp:include page="/WEB-INF/views/tasks/_project-block.jsp"/>
  </c:if>
  <section class="hub-group" id="level-${group.key}" aria-labelledby="level-${group.key}-title">
    <div class="hub-group-head">
      <h2 id="level-${group.key}-title"><spring:message code="hub.group.${group.key}"/></h2>
      <p class="hub-group-sub">
        <spring:message code="hub.modules.${group.pagesForm}" arguments="${fn:length(group.pages)}"/>
        <c:if test="${group.stats.count > 0}">
          · <spring:message code="hub.tasks.${group.stats.countForm}" arguments="${group.stats.count}"/>
          <c:if test="${group.stats.minutes > 0}">
            · <c:choose><c:when test="${group.stats.minutes lt 60}"><spring:message code="hub.minutes" arguments="${group.stats.minutes}"/></c:when><c:otherwise><spring:message code="${group.stats.plusHalfHour ? 'hub.hours.half' : 'hub.hours'}" arguments="${group.stats.wholeHours}"/></c:otherwise></c:choose>
          </c:if>
        </c:if>
      </p>
    </div>
    <c:forEach var="modulePage" items="${group.pages}" varStatus="pageStatus">
      <c:set var="BLOCK_PROJECTS" value="${pageStatus.first ? null : PROJECT_ANCHORS[modulePage.id]}" scope="request"/>
      <c:if test="${not empty BLOCK_PROJECTS}">
        <jsp:include page="/WEB-INF/views/tasks/_project-block.jsp"/>
      </c:if>
      <c:set var="stats" value="${PAGE_STATS[modulePage.id]}"/>
      <article class="task-card panel">
        <div class="task-card-head">
          <h3>${modulePage.parentCategory.name}</h3>
          <div class="task-tags">
            <c:if test="${stats != null}"><span class="tag tag-${fn:toLowerCase(stats.difficulty)}"><spring:message code="difficulty.${stats.difficulty}"/></span></c:if>
            <c:forEach var="badge" items="${PROJECT_BADGES[modulePage.id]}"><span class="tag tag-accent" title="${fn:escapeXml(badge.displayTitle)}"><c:out value="${PROJECTS[badge.task.projectCode].name}"/> · <spring:message code="project.part" arguments="${badge.task.projectPart}"/></span></c:forEach>
          </div>
        </div>
        <p class="task-desc">${modulePage.article.description}</p>
        <div class="task-foot">
          <c:if test="${stats != null}">
            <span class="task-meta">☰ <spring:message code="hub.tasks.${stats.countForm}" arguments="${stats.count}"/></span>
            <c:if test="${stats.minutes > 0}"><span class="task-meta">⏱ <c:choose><c:when test="${stats.minutes lt 60}"><spring:message code="hub.minutes" arguments="${stats.minutes}"/></c:when><c:otherwise><spring:message code="${stats.plusHalfHour ? 'hub.hours.half' : 'hub.hours'}" arguments="${stats.wholeHours}"/></c:otherwise></c:choose></span></c:if>
          </c:if>
          <a class="task-open" href="${pageContext.request.contextPath}/${homePath}java/${HUB_COURSE}/${modulePage.pathName}"><spring:message code="open"/> &rarr;</a>
        </div>
      </article>
    </c:forEach>
  </section>
</c:forEach>
