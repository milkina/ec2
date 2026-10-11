<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- Блоки сквозных проектов (серий) на хабе задач. Данные — BLOCK_PROJECTS: серии, которые начинаются на этой карточке модуля (PROJECT_ANCHORS из TaskUtility.addProjectsToModel);
     части — задачи с task.project_code, тексты серии — таблица task_project.
     featured-серия с ≥3 частями — большой блок; остальные серии с ≥2 частями — компактная карточка. --%>
<spring:message code="menu.home" var="homePath"/>
<c:forEach var="series" items="${BLOCK_PROJECTS}">
<c:if test="${series.shown}">
<section class="panel ${series.big ? 'project-block' : 'project-mini'}" id="project-${series.code}" aria-labelledby="project-${series.code}-title">
  <c:choose>
    <c:when test="${series.big}">
      <div class="project-tags">
        <span class="tag tag-topic"><spring:message code="project.label"/></span>
        <span class="tag tag-intermediate"><spring:message code="project.parts.count" arguments="${fn:length(series.parts)}"/></span>
      </div>
      <h2 id="project-${series.code}-title"><c:out value="${series.title}"/></h2>
    </c:when>
    <c:otherwise>
      <div class="project-mini-head">
        <h3 id="project-${series.code}-title"><c:out value="${series.title}"/></h3>
        <span class="tag tag-intermediate"><spring:message code="project.parts.count" arguments="${fn:length(series.parts)}"/></span>
      </div>
    </c:otherwise>
  </c:choose>
  <c:if test="${not empty series.description}"><p class="project-lead"><c:out value="${series.description}"/></p></c:if>
  <ol class="project-parts">
    <c:forEach var="part" items="${series.parts}">
      <li>
        <a href="${pageContext.request.contextPath}/${homePath}${part.href}">
          <span class="project-num">${part.task.projectPart}</span>
          <span class="project-what">${part.displayTitle}</span>
          <span class="project-module">${part.page.parentCategory.name}</span>
        </a>
      </li>
    </c:forEach>
  </ol>
  <c:if test="${series.big}">
    <div class="project-foot">
      <span class="project-labs"><c:out value="${series.note}"/></span>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/${homePath}${series.first.href}"><spring:message code="project.start"/> &rarr;</a>
    </div>
    <script type="application/ld+json">{
      "@context": "https://schema.org",
      "@type": "ItemList",
      "name": "<spring:escapeBody javaScriptEscape="true">${series.title}</spring:escapeBody>",
      "itemListOrder": "https://schema.org/ItemListOrderAscending",
      "numberOfItems": ${fn:length(series.parts)},
      "itemListElement": [<c:forEach var="part" items="${series.parts}" varStatus="st">
        {"@type": "ListItem", "position": ${part.task.projectPart}, "name": "<spring:escapeBody javaScriptEscape="true">${part.displayTitle}</spring:escapeBody>", "url": "https://www.examclouds.com/${homePath}${part.href}"}${st.last ? '' : ','}</c:forEach>
      ]
    }</script>
  </c:if>
</section>
</c:if>
</c:forEach>
