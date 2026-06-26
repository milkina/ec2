<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/categoryjsp-taglib.tld" prefix="category"%>
<%@ taglib uri="/WEB-INF/tld/question-entryjsp-taglib.tld" prefix="qe"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<t:wrapper2>
    <jsp:attribute name="header">
        <c:set var="categoryName" value="${CATEGORY_ATTRIBUTE.roadMapName!=null && not empty CATEGORY_ATTRIBUTE.roadMapName ? CATEGORY_ATTRIBUTE.roadMapName : CATEGORY_ATTRIBUTE.name}"/>
        <c:set var="pathLanguage" value="${TESTS[param.TEST_PATH].language.code=='ru'?'ru/':''}"/>
        <title>${categoryName} - ${TESTS[param.TEST_PATH].name} <spring:message code="quiz"/> - ${CATEGORY_ATTRIBUTE.questionsCount}&nbsp; <spring:message code="total.questions"/> | ExamClouds</title>
        <meta name="description" content="<spring:message code="quiz.meta.description" arguments="${CATEGORY_ATTRIBUTE.name},${TESTS[param.TEST_PATH].name},${CATEGORY_ATTRIBUTE.questionsCount}" argumentSeparator=","/>">
        <c:set var="origUri" value="${requestScope['javax.servlet.forward.request_uri'] != null ? requestScope['javax.servlet.forward.request_uri'] : pageContext.request.requestURI}"/>
        <c:choose>
                <c:when test="${TESTS[param.TEST_PATH].language.code=='ru' && !fn:contains(origUri, '/ru/')}">
                    <meta name="robots" content="noindex, follow">
                </c:when>
                <c:otherwise>
                    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
                </c:otherwise>
            </c:choose>
        <c:set var="canonicalUrl" value="https://www.examclouds.com/${pathLanguage}${param.TEST_PATH}/${CATEGORY_ATTRIBUTE.pathName}/quiz"/>
        <link rel="canonical" href="${canonicalUrl}">
        <meta property="og:url" content="${canonicalUrl}">
        <meta property="og:title" content="${categoryName} - ${TESTS[param.TEST_PATH].name} <spring:message code="quiz"/> - ${CATEGORY_ATTRIBUTE.questionsCount}&nbsp; <spring:message code="total.questions"/> | ExamClouds">
        <meta property="og:type" content="website">
        <meta property="og:description" content = "<spring:message code="quiz.meta.description" arguments="${CATEGORY_ATTRIBUTE.name},${TESTS[param.TEST_PATH].name},${CATEGORY_ATTRIBUTE.questionsCount}" argumentSeparator=","/>">
        <meta property="og:site_name" content="ExamClouds">
        <meta property="twitter:title" content="${categoryName} - ${TESTS[param.TEST_PATH].name} <spring:message code="quiz"/> - ${CATEGORY_ATTRIBUTE.questionsCount}&nbsp; <spring:message code="total.questions"/> | ExamClouds">
        <meta property="twitter:card" content="summary">
        <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
        <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
        <meta property="twitter:image:alt" content="${categoryName} - ${TESTS[param.TEST_PATH].name} <spring:message code="quiz"/> - ${CATEGORY_ATTRIBUTE.questionsCount}&nbsp; <spring:message code="total.questions"/> | ExamClouds">
        <meta property="twitter:description" content="<spring:message code="quiz.meta.description" arguments="${CATEGORY_ATTRIBUTE.name},${TESTS[param.TEST_PATH].name},${CATEGORY_ATTRIBUTE.questionsCount}" argumentSeparator=","/>">
        <meta property="twitter:site" content="@ExamClouds">
        <script async src="${pageContext.request.contextPath}/js/show_questions.js?v=2"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/quiz.css?v=2">
        <!-- LearningResource Schema -->
                <script type="application/ld+json">{
                  "@context": "https://schema.org",
                  "@type": "LearningResource",
                  "learningResourceType": "Quiz",
                  "name": "${TESTS[param.TEST_PATH].name} ${categoryName} - <spring:message code="quiz"/>",
                  "description": "<spring:message code="quiz.meta.description" arguments="${CATEGORY_ATTRIBUTE.name},${TESTS[param.TEST_PATH].name},${CATEGORY_ATTRIBUTE.questionsCount}" argumentSeparator=","/>",
                  "url": "${canonicalUrl}",
                  "mainEntityOfPage": {
                      "@type": "WebPage",
                      "@id": "${canonicalUrl}"
                    },
                  "inLanguage": "${TESTS[param.TEST_PATH].language.code}",
                  "educationalLevel": "Beginner",
                  "isAccessibleForFree": true,
                   "about": {
                      "@type": "Thing",
                      "name": "${CATEGORY_ATTRIBUTE.name}"
                    },
                    "educationalAlignment": {
                      "@type": "AlignmentObject",
                      "alignmentType": "educationalSubject",
                      "targetName": "${TESTS[param.TEST_PATH].name}"
                    },
                  "author": {
                    "@type": "Person",
                    "name": "Tatyana Milkina",
                    "url": "https://www.examclouds.com/${pathLanguage}tatyana-milkina"
                  },
                  "provider": {
                    "@type": "Organization",
                    "name": "ExamClouds",
                    "url": "https://www.examclouds.com"
                  },
                  "hasPart": [
                    <qe:qeList><qe:qe>
                        {
                        "@type": "Question",
                        "eduQuestionType": "Flashcard",
                        "name": "<qe:questionplain/>",
                        "acceptedAnswer": {
                          "@type": "Answer",
                          "text": <qe:answers><qe:answer>"<qe:answertextplain/>"</qe:answer></qe:answers>
                        }
                      }<qe:comma/>
                     </qe:qe></qe:qeList>
                  ]
                }</script>
   </jsp:attribute>
   <jsp:body>
    <main>
        <div class="container articles-page">
          <nav class="crumbs">
                  <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>">
                       <span><spring:message code="home"/></span></a>
                  <span class="sep">›</span>
                   <c:choose>
                          <c:when test="${param.TEST_PATH.equals('java-core-russian')}">
                              <c:set var="courseUrl" value="${pageContext.request.contextPath}/ru/java-core-russian"></c:set>
                          </c:when>
                          <c:otherwise>
                              <c:set var="courseUrl" value="${pageContext.request.contextPath}/${TESTS[param.TEST_PATH].fullPathName}"></c:set>
                          </c:otherwise>
                      </c:choose>
                  <a href="${courseUrl}">
                  <span>${TESTS[param.TEST_PATH].name}</span></a>
                  <span class="sep">›</span>
                  <a href="${pageContext.request.contextPath}/${pathLanguage}java/${param.TEST_PATH}/${param.CATEGORY_PATH}">
                  <span>${categoryName}</span></a>
                  <span class="sep">›</span>
                  <span class="here"><spring:message code="quiz"/></span>
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
                        "item": <c:choose><c:when test="${param.TEST_PATH.equals('java-core-russian')}">"https://www.examclouds.com/ru/java-core-russian"</c:when><c:otherwise>"https://www.examclouds.com/${TESTS[param.TEST_PATH].fullPathName}"</c:otherwise></c:choose>
                    },
                    {
                        "@type": "ListItem",
                        "position": 3,
                        "name": "${categoryName}",
                        "item": "https://www.examclouds.com/${pathLanguage}java/${param.TEST_PATH}/${param.CATEGORY_PATH}"
                    },
                    {
                        "@type": "ListItem",
                        "position": 4,
                        "name": "<spring:message code="quiz"/>"
                    }
                ]
            }</script>
          </nav>
          <h1 class="iq-title">
                ${categoryName} - <spring:message code="quiz"/>
          </h1>
           <%@ include file="general-quiz.jsp" %>
        </div>
         <script async src="${pageContext.request.contextPath}/js/prism.min.js?ver=1"></script>
 </jsp:body>
</t:wrapper2>