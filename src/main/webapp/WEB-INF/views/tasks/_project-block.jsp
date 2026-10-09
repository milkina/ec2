<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- Блок сквозных проектов на хабе задач. Данные — PROJECTS из TaskUtility.addProjectsToModel (таблица task). --%>
<spring:message code="menu.home" var="homePath"/>
<c:set var="shop" value="${PROJECTS['online-shop']}"/>
<c:set var="report" value="${PROJECTS['employee-report']}"/>
<c:if test="${shop != null && fn:length(shop.parts) >= 3}">
<section class="panel project-block" id="project" aria-labelledby="project-title">
  <div class="project-tags">
    <span class="tag tag-topic"><spring:message code="project.label"/></span>
    <span class="tag tag-intermediate"><spring:message code="project.parts.count" arguments="${fn:length(shop.parts)}"/></span>
  </div>
  <h2 id="project-title"><spring:message code="project.online-shop.title"/></h2>
  <p class="project-lead"><spring:message code="project.online-shop.lead" arguments="${fn:length(shop.parts)}"/></p>
  <ol class="project-parts">
    <c:forEach var="part" items="${shop.parts}">
      <li>
        <a href="${pageContext.request.contextPath}/${homePath}${part.href}">
          <span class="project-num">${part.task.projectPart}</span>
          <span class="project-what"><spring:message code="project.online-shop.part.${part.task.projectPart}" text="${part.displayTitle}"/></span>
          <span class="project-module">${part.page.parentCategory.name}</span>
        </a>
      </li>
    </c:forEach>
  </ol>
  <div class="project-foot">
    <span class="project-labs"><spring:message code="project.online-shop.labs"/></span>
    <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/${homePath}${shop.first.href}"><spring:message code="project.start"/> &rarr;</a>
  </div>
  <script type="application/ld+json">{
    "@context": "https://schema.org",
    "@type": "ItemList",
    "name": "<spring:message code="project.online-shop.title" javaScriptEscape="true"/>",
    "itemListOrder": "https://schema.org/ItemListOrderAscending",
    "numberOfItems": ${fn:length(shop.parts)},
    "itemListElement": [<c:forEach var="part" items="${shop.parts}" varStatus="st">
      {"@type": "ListItem", "position": ${part.task.projectPart}, "name": "<spring:message code="project.online-shop.part.${part.task.projectPart}" text="${part.page.parentCategory.name}" javaScriptEscape="true"/>", "url": "https://www.examclouds.com/${homePath}${part.href}"}${st.last ? '' : ','}</c:forEach>
    ]
  }</script>
</section>
</c:if>
<c:if test="${report != null && fn:length(report.parts) >= 2}">
<section class="panel project-mini" aria-labelledby="project-report-title">
  <div>
    <h3 id="project-report-title"><spring:message code="project.employee-report.title"/></h3>
    <p class="project-lead">
      <c:forEach var="part" items="${report.parts}" varStatus="st">
        <a href="${pageContext.request.contextPath}/${homePath}${part.href}">${part.page.parentCategory.name}</a><c:if test="${!st.last}"> &rarr; </c:if>
      </c:forEach>
    </p>
  </div>
  <span class="tag tag-intermediate"><spring:message code="project.parts.count" arguments="${fn:length(report.parts)}"/></span>
</section>
</c:if>
