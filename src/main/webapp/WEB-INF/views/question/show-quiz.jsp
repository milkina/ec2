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
        <c:set var="currentLang" value="${TESTS[param.TEST_PATH].language.code}"/>
        <c:set var="ruHref" value="${currentLang=='ru' ? canonicalUrl : null}"/>
        <c:set var="enHref" value="${currentLang=='en' ? canonicalUrl : null}"/>
        <link rel="alternate" hreflang="${currentLang}" href="${canonicalUrl}">
        <c:forEach var="alt" items="${CATEGORY_ATTRIBUTE.canonicalUrls}">
            <c:if test="${alt.value != null && alt.value.url != null}">
                <c:set var="altPathLanguage" value="${alt.value.language.code=='ru' ? '/ru' : ''}"/>
                <c:set var="altHref" value="https://www.examclouds.com${altPathLanguage}${alt.value.url}/quiz"/>
                <link rel="alternate" hreflang="${alt.value.language.code}" href="${altHref}">
                <c:if test="${alt.value.language.code=='ru'}"><c:set var="ruHref" value="${altHref}"/></c:if>
                <c:if test="${alt.value.language.code=='en'}"><c:set var="enHref" value="${altHref}"/></c:if>
            </c:if>
        </c:forEach>
        <c:set var="xDefaultHref" value="${enHref != null ? enHref : ruHref}"/>
        <c:if test="${xDefaultHref != null}">
            <link rel="alternate" hreflang="x-default" href="${xDefaultHref}">
        </c:if>
        <meta property="og:url" content="${canonicalUrl}">
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
          <p class="iq-sub"><spring:message code="total"/>: ${CATEGORY_ATTRIBUTE.questionsCount} <spring:message code="total.questions"/></p>
          <div class="iq-toolbar">
            <form action="${pageContext.request.contextPath}/clear-history" class="iq-toolbar-form">
              <input type="hidden" name="CATEGORY_PATH" value="${CATEGORY_ATTRIBUTE.pathName}">
              <input type="hidden" name="TEST_PATH" value="${param.TEST_PATH}">
              <c:if test="${person!=null && ('QUESTION'.equals(param.TYPE) || param.TYPE.equals('TEST'))}">
                   <input type="submit" value="<spring:message code="clear.history"/>" name="clearHistory" class="btn btn-outline btn-sm">
                   <%@ include file="/WEB-INF/showQuestions/selectOptionsPanel.jsp" %>
              </c:if>
            </form>
          </div>
          <div id="iq-groups" class="iq-groups">
          <qe:qeList>
            <qe:qe>
              <details class="iq-item <qe:type/>" id="li<qe:id/>" data-id="<qe:id/>">
                <summary class="iq-summary">
                  <input type="checkbox" id="isAnswered<qe:id/>"
                         title="<spring:message code="mark.question"/>" <qe:checkbox/>
                         onchange="markAnswered('${pageContext.request.contextPath}',<qe:id/>);"
                         class="iq-check iq-check-input">
                  <div class="iq-q"><qe:number/>.&nbsp;<qe:question/></div>
                  <span class="iq-plus" aria-hidden="true">+</span>
                </summary>
                <div class="iq-a">
                  <qe:answers>
                    <div><qe:answer><qe:answertext/></qe:answer></div>
                  </qe:answers>
                </div>
              </details>
            </qe:qe>
          </qe:qeList>
          </div>

          <div class="iq-pagination">
            <button id="iq-prev" class="btn btn-outline btn-sm" disabled><spring:message code="previous"/></button>
            <span id="iq-page-info" class="iq-page-info" data-page-text="<spring:message code="page"/>" data-of-text="<spring:message code="of"/>"><spring:message code="page"/> 1 <spring:message code="of"/> 1</span>
            <button id="iq-next" class="btn btn-outline btn-sm" disabled><spring:message code="next"/></button>
          </div>
        </div>
         <script async src="${pageContext.request.contextPath}/js/prism.min.js?ver=1"></script>
 </jsp:body>
</t:wrapper2>