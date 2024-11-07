<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/WEB-INF/tld/categoryjsp-taglib.tld" prefix="category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="/WEB-INF/tld/testjsp-taglib.tld" prefix="test"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<div class="breadCrumbs">
<ol>
    <li>
       <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>">
           <span><spring:message code="home"/></span>
       </a>
    </li>
    <li>
       <c:choose>
              <c:when test="${param.TEST_PATH.equals('java-core-russian')}">
                  <c:set var="courseUrl" value="${pageContext.request.contextPath}/ru/#start-course"></c:set>
              </c:when>
              <c:otherwise>
                   <c:set var="courseUrl" value="${pageContext.request.contextPath}/${TESTS[param.TEST_PATH].fullPathName}"></c:set>
              </c:otherwise>
       </c:choose>
       <a href="${courseUrl}">
          <span>${TESTS[param.TEST_PATH].name}</span></a>
    </li>
    <c:if test="${CATEGORY_ATTRIBUTE.parentCategory!=null}">
     <li>
          <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>java/${param.TEST_PATH}/${CATEGORY_ATTRIBUTE.parentCategory.pathName}">
               <span>${CATEGORY_ATTRIBUTE.parentCategory.name}</span>
          </a>
     </li>
    </c:if>
  <li>${CATEGORY_ATTRIBUTE.name}</li>
 </ol>
 <script type="application/ld+json">{
   "@context": "https://schema.org",
   "@type": "BreadcrumbList",
   "itemListElement": [
     {
       "@type": "ListItem",
       "position": 1,
       "name": "<spring:message code="home"/>",
       "item": "https://www.examclouds.com/<spring:message code="menu.home"/>"
     },
     {
       "@type": "ListItem",
       "position": 2,
       "name": "${TESTS[param.TEST_PATH].name}",
       "item": "https://www.examclouds.com${courseUrl}"
     }
      <c:if test="${CATEGORY_ATTRIBUTE.parentCategory!=null}">
     ,
     {
       "@type": "ListItem",
       "position": 3,
       "name": "${CATEGORY_ATTRIBUTE.parentCategory.name}",
       "item": "https://www.examclouds.com/<spring:message code="menu.home"/>java/${param.TEST_PATH}/${CATEGORY_ATTRIBUTE.parentCategory.pathName}"
     }
     </c:if>
   ]
 }</script>
 </div>