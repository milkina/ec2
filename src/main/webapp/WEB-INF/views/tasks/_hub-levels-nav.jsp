<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- Быстрая навигация по группам уровней под вводным абзацем хаба. --%>
<c:if test="${not empty HUB_GROUPS}">
<nav class="hub-levels" aria-label="<spring:message code='hub.levels.label'/>">
  <c:forEach var="group" items="${HUB_GROUPS}">
    <a class="hub-level hub-level-${group.key}" href="#level-${group.key}"><spring:message code="hub.group.${group.key}.short"/> <span>${group.stats.count}</span></a>
  </c:forEach>
</nav>
</c:if>
