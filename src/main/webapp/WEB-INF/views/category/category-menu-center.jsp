<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<ul id="categories">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <c:set var="pathLanguage" value="${TESTS[param.TEST_PATH].language.code=='ru'?'ru/':''}"/>
  <c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
    <c:if test="${category.value.hidden==false && category.value.parentCategory==null}">
      <li class="category-li"
          onclick="window.location.href='${pageContext.request.contextPath}/${pageLanguage=='ru'?'ru/':''}java/${param.TEST_PATH}/${category.value.pathName}'">
        <span class="lesson-badge">${TESTS[param.TEST_PATH].name}</span>
        <div class="category-name">${category.value.name}</div>
        <div class="category-desc">${category.value.article.description}</div>
      </li>
    </c:if>
  </c:forEach>
</ul>