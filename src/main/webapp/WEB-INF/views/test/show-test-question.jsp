<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="/WEB-INF/tld/examjsp-taglib.tld" prefix="exam"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<t:wrapper2>
<jsp:attribute name="language">lang="${TESTS[param.TEST_PATH].language.code}"</jsp:attribute>
<jsp:attribute name="header">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show-test-question.css?v=1" />
    <title>${TESTS[param.TEST_PATH].name}&nbsp;<spring:message code="tests"/></title>
    <meta name="robots" content="noindex, nofollow">
</jsp:attribute>
<jsp:body>
    <c:set var="pathLanguage" value="${TESTS[param.TEST_PATH].language.code=='ru'?'ru/':''}"/>
    <main class="quiz-bg">
        <div class="container quiz-wrap">
            <!-- Breadcrumb -->
            <nav class="quiz-crumbs" aria-label="Breadcrumb">
                <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>"><spring:message code="home"/></a>
                <span class="sep">/</span>
                <a href="<menu:testsTag/>"><spring:message code="tests"/></a>
                <span class="sep">/</span>
                <span class="current">${TESTS[param.TEST_PATH].name}</span>
            </nav>
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
                        "name": "<spring:message code="tests"/>",
                        "item": "https://www.examclouds.com/<spring:message code="menu.tests"/>"
                    },
                    {
                        "@type": "ListItem",
                        "position": 3,
                        "name": "${TESTS[param.TEST_PATH].name}"
                    }
                ]
            }</script>

            <!-- Quiz card -->
            <section class="quiz-card">
                <header class="quiz-head">
                    <h1 class="quiz-title"><spring:message code="tests"/>: ${CURRENT_EXAM_ATTRIBUTE.currentQuestionEntry.category.name}</h1>
                    <p class="quiz-sub"><spring:message code="check.your.knowledge"/> — <exam:size/>&nbsp;<spring:message code="total.questions"/></p>
                </header>

                <!-- Progress -->
                <div class="quiz-progress">
                    <div class="qp-row">
                        <span class="qp-label"><spring:message code="progress"/></span>
                        <span class="qp-count" id="questionEntryNumber"><b><exam:number/></b>/<exam:size/></span>
                    </div>
                    <div class="qp-bar" style="--progress:${(CURRENT_EXAM_ATTRIBUTE.currentNumber + 1) * 100 / fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)}%"><span></span></div>
                </div>

                <!-- Question pills -->
                <ol class="quiz-pills" aria-label="Questions">
                    <c:choose>
                        <c:when test="${fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)<11}">
                            <c:set var="start" value="${1}"/>
                            <c:set var="end" value="${fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="start" value="${CURRENT_EXAM_ATTRIBUTE.currentNumber-4>0?CURRENT_EXAM_ATTRIBUTE.currentNumber-4:1}"/>
                            <c:set var="end" value="${start+9<fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)?start+9:fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)}"/>
                            <c:set var="start" value="${fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)-CURRENT_EXAM_ATTRIBUTE.currentNumber>4?start:(fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)-9)}"/>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${start!=1}">
                        <li>
                            <button type="submit" form="questionForm" name="QUESTION_NUMBER" value="0" aria-label="<spring:message code="question"/> 1">..</button>
                        </li>
                    </c:if>
                    <c:forEach var="number" begin="${start}" end="${end}">
                        <li>
                            <c:choose>
                                <c:when test="${number==CURRENT_EXAM_ATTRIBUTE.currentNumber+1}">
                                    <button type="submit" form="questionForm" name="QUESTION_NUMBER" value="${number-1}" class="is-current" aria-current="true">${CURRENT_EXAM_ATTRIBUTE.questionEntries[number-1].answered?'&#10004;':number}</button>
                                </c:when>
                                <c:when test="${CURRENT_EXAM_ATTRIBUTE.questionEntries[number-1].answered}">
                                    <button type="submit" form="questionForm" name="QUESTION_NUMBER" value="${number-1}" class="done">${CURRENT_EXAM_ATTRIBUTE.questionEntries[number-1].answered?'&#10004;':number}</button>
                                </c:when>
                                <c:otherwise>
                                    <button type="submit" form="questionForm" name="QUESTION_NUMBER" value="${number-1}">${number}</button>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </c:forEach>
                    <c:if test="${end!=fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)}">
                        <li>
                            <button type="submit" form="questionForm" name="QUESTION_NUMBER" value="${fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)-1}" aria-label="<spring:message code="question"/> ${fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)}">..</button>
                        </li>
                    </c:if>
                </ol>

                <!-- Question -->
                <form id="questionForm" action="${pageContext.request.contextPath}/${pathLanguage}add-person-answer?TEST_PATH=${param.TEST_PATH}" method="POST">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="quiz-q">
                        <p class="quiz-q-eyebrow"><spring:message code="question"/>&nbsp;<exam:number/>&nbsp;<spring:message code="of"/>&nbsp;<exam:size/></p>
                        <h2 class="quiz-q-title">${CURRENT_EXAM_ATTRIBUTE.currentQuestionEntry.question.text}</h2>

                        <c:set var="correctCount" value="0"/>
                        <c:forEach var="a" items="${CURRENT_EXAM_ATTRIBUTE.currentQuestionEntry.answers}">
                            <c:if test="${a.correct}"><c:set var="correctCount" value="${correctCount + 1}"/></c:if>
                        </c:forEach>
                        <c:set var="isMulti" value="${correctCount > 1}"/>

                        <p class="quiz-q-hint">
                            <c:choose>
                                <c:when test="${isMulti}">
                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><polyline points="9 11 12 14 22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
                                    <spring:message code="select.all.that.apply"/>
                                </c:when>
                                <c:otherwise>
                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="3"/></svg>
                                    <spring:message code="select.one.answer"/>
                                </c:otherwise>
                            </c:choose>
                        </p>

                        <c:set var="count" value="${0}"/>
                        <c:set var="letters" value="${['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']}"/>
                        <c:choose>
                            <c:when test="${isMulti}">
                                <ul id="answersDiv" class="quiz-options quiz-options-multi" role="group" aria-label="Answer options">
                                    <c:forEach var="answer" items="${CURRENT_EXAM_ATTRIBUTE.currentQuestionEntry.userAnswers}">
                                        <li id="answerblock${count}">
                                            <label class="qo qo-multi">
                                                <input type="checkbox" class="test-checkbox" name="checkbox${count}" id="checkbox${count}" <c:if test="${answer.correct}">checked</c:if>>
                                                <span class="qo-letter">${letters[count]}</span>
                                                <span class="qo-text">${answer.text}</span>
                                                <span class="qo-check" aria-hidden="true">
                                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
                                                </span>
                                                <c:set var="count" value="${count+1}"/>
                                            </label>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <ul id="answersDiv" class="quiz-options" role="radiogroup" aria-label="Answer options">
                                    <c:forEach var="answer" items="${CURRENT_EXAM_ATTRIBUTE.currentQuestionEntry.userAnswers}">
                                        <li id="answerblock${count}">
                                            <label class="qo">
                                                <input type="radio" name="radioAnswer" value="${count}" class="test-radio" id="checkbox${count}" <c:if test="${answer.correct}">checked</c:if>>
                                                <span class="qo-letter">${letters[count]}</span>
                                                <span class="qo-text">${answer.text}</span>
                                                <span class="qo-check" aria-hidden="true">
                                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
                                                </span>
                                                <c:set var="count" value="${count+1}"/>
                                            </label>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:otherwise>
                        </c:choose>
                        <input type="hidden" name="answerNumber" value="${count}">
                        <input type="hidden" name="isMulti" value="${isMulti}">
                        <c:if test="${isMulti}">
                            <p class="quiz-q-selected"><span id="qmSelected">0</span>&nbsp;<spring:message code="selected"/></p>
                        </c:if>
                    </div>

                    <!-- Actions -->
                    <footer class="quiz-actions">
                        <exam:previousButton>
                            <button type="submit" name="PREVIOUS" value="PREVIOUS" class="btn btn-outline btn-sm">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"/></svg>
                                <spring:message code="previous"/>
                            </button>
                        </exam:previousButton>
                        <div class="quiz-actions-end">
                            <button type="submit" name="FINISH" value="FINISH" id="finishBtn" class="btn btn-outline btn-sm"><spring:message code="finish"/></button>
                            <exam:nextButton>
                                <button type="submit" name="NEXT" value="NEXT" class="btn btn-primary btn-sm">
                                    <spring:message code="next"/>
                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
                                </button>
                            </exam:nextButton>
                        </div>
                    </footer>
                </form>

                <!-- <jsp:include page="/WEB-INF/comment/comments.jsp">
                    <jsp:param name="referenceId" value="${CURRENT_EXAM_ATTRIBUTE.currentQuestionEntry.id}" />
                    <jsp:param name="commentType" value="QUESTION" />
                </jsp:include>-->
            </section>
        </div>
    </main>
    <script async src="${pageContext.request.contextPath}/js/prism.min.js?ver=1"></script>
    <script>
        (function () {
            var inputs = document.querySelectorAll('.quiz-options-multi input[type="checkbox"]');
            var out = document.getElementById('qmSelected');
            if (inputs.length > 0 && out) {
                function update() {
                    var n = 0;
                    inputs.forEach(function (i) { if (i.checked) n++; });
                    out.textContent = String(n);
                }
                inputs.forEach(function (i) { i.addEventListener('change', update); });
                update();
            }
        })();
    </script>
</jsp:body>
</t:wrapper2>