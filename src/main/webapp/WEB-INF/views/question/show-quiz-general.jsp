<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/question-entryjsp-taglib.tld" prefix="qe"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<t:wrapper2>
    <jsp:attribute name="header">
        <title>${TESTS[param.TEST_PATH].name} <spring:message code="questions.interviews"/> - ${TOTAL_QUESTIONS_COUNT}&nbsp; <spring:message code="total.questions"/> | ExamClouds</title>
        <meta name="description" content="<spring:message code="quiz.meta.description" arguments="${''},${TESTS[param.TEST_PATH].name},${TOTAL_QUESTIONS_COUNT}" argumentSeparator=","/>">
        <meta name="robots" content="noindex, follow">
        <script async src="${pageContext.request.contextPath}/js/show_questions.js?v=2"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/quiz.css?v=2">
   </jsp:attribute>
   <jsp:body>
    <main>
        <div class="container articles-page">
          <c:choose>
              <c:when test="${param.TEST_PATH.equals('java-core-russian')}">
                  <c:set var="courseUrl" value="https://www.examclouds.com/ru/java-core-russian"/>
              </c:when>
              <c:otherwise>
                  <c:set var="courseUrl" value="https://www.examclouds.com/${TESTS[param.TEST_PATH].fullPathName}"/>
              </c:otherwise>
          </c:choose>
          <nav class="crumbs">
                  <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>">
                       <span><spring:message code="home"/></span></a>
                  <span class="sep">›</span>
                  <a href="<menu:questionsTag/>">
                  <span><spring:message code="questions.interviews"/></span></a>
                  <span class="sep">›</span>
                  <span class="here">${TESTS[param.TEST_PATH].name}</span>
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
                        "name": "<spring:message code="questions.interviews"/>",
                        "item": "https://www.examclouds.com/questions"
                    },
                    {
                        "@type": "ListItem",
                        "position": 3,
                        "name": "${TESTS[param.TEST_PATH].name}",
                        "item": "${courseUrl}"
                    }
                ]
            }</script>
          </nav>
          <h1 class="iq-title">
                ${TESTS[param.TEST_PATH].name} - <spring:message code="questions.interviews"/>
          </h1>
           <%@ include file="general-quiz.jsp" %>
        </div>
         <script async src="${pageContext.request.contextPath}/js/prism.min.js?ver=1"></script>
 </jsp:body>
</t:wrapper2>