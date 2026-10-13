<%@ page trimDirectiveWhitespaces="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- Объединённая страница: Java online test (результат в %) + interview questions (вопросы с ответами), бывшая /questions.
     Числа — TestHubUtility.addTestHubToModel (курс java-core). --%>
<c:set var="pageTitle" value="Free Java Online Test and Interview Questions | ExamClouds"/>
<c:set var="pageDescription" value="Free Java online test with a score and ${QUIZ_QUESTIONS_TOTAL} interview questions with answers across ${fn:length(COVER_MODULES)} Java Core modules, from syntax to the Stream API. No registration."/>
<t:wrapper2>
    <jsp:attribute name="header">
        <meta name="description" content="${fn:escapeXml(pageDescription)}">
        <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
        <title>${pageTitle}</title>
        <link href="${pageContext.request.contextPath}/css/tom-select.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sh-test.css?v=7" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/tom-select.complete.min.js" defer></script>
        <script src="${pageContext.request.contextPath}/js/selectCategoriesTS.js?v=4" defer></script>
        <link rel="canonical" href="https://www.examclouds.com/tests">
        <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/tests">
        <link rel="alternate" hreflang="en" href="https://www.examclouds.com/tests">
        <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/tests">

        <!-- Open Graph -->
        <meta property="og:title" content="${pageTitle}">
        <meta property="og:type" content="website">
        <meta property="og:description" content="${fn:escapeXml(pageDescription)}">
        <meta property="og:site_name" content="ExamClouds">
        <meta property="og:url" content="https://www.examclouds.com/tests">
        <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">

        <!-- Twitter -->
        <meta property="twitter:title" content="${pageTitle}">
        <meta property="twitter:card" content="summary_large_image">
        <meta property="twitter:description" content="${fn:escapeXml(pageDescription)}">
        <meta property="twitter:site" content="@ExamClouds">
        <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
        <meta property="twitter:image:alt" content="${pageTitle}">
        <!-- BreadcrumbList Schema -->
        <script type="application/ld+json">{
          "@context": "https://schema.org",
          "@type": "BreadcrumbList",
          "itemListElement": [
            {"@type": "ListItem", "position": 1, "name": "Home", "item": "https://www.examclouds.com/"},
            {"@type": "ListItem", "position": 2, "name": "Tests and Interview Questions", "item": "https://www.examclouds.com/tests"}
          ]
        }</script>

        <!-- LearningResource Schema -->
        <script type="application/ld+json">{
          "@context": "https://schema.org",
          "@type": "LearningResource",
          "learningResourceType": ["Assessment", "Quiz"],
          "name": "Free Java Online Test and Interview Questions",
          "description": "<spring:escapeBody javaScriptEscape="true">${pageDescription}</spring:escapeBody>",
          "url": "https://www.examclouds.com/tests",
          "inLanguage": "en",
          "isAccessibleForFree": true,
          "educationalLevel": "Beginner to intermediate",
          "teaches": "Java Core",
          "author": {"@type": "Person", "name": "Tatyana Milkina", "url": "https://www.examclouds.com/tatyana-milkina"},
          "provider": {"@type": "Organization", "name": "ExamClouds", "url": "https://www.examclouds.com"}
        }</script>
    </jsp:attribute>
     <jsp:body>
        <main aria-label="Java online test and interview questions">
          <section class="container articles-page" aria-labelledby="tests-main-title">
            <nav class="crumbs" aria-label="Breadcrumb">
              <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>"><spring:message code="home"/></a>
              <span class="sep">›</span>
              <span class="here">Tests and Interview Questions</span>
            </nav>
            <h1 class="articles-title" id="tests-main-title">Free Java Online Test and Interview Questions</h1>
            <p class="articles-lede">Check your Java Core knowledge in two ways: take a timed test and get a score, or work through interview questions with answers at your own pace. Pick the topics, choose 5 to 100 questions — no registration needed.</p>
            <nav class="th-modes" aria-label="Choose a mode">
              <a class="th-mode" href="#test"><b>Java online test</b><span>${TEST_QUESTIONS_TOTAL} questions · score and answer review</span></a>
              <a class="th-mode" href="#interview-questions"><b>Interview questions</b><span>${QUIZ_QUESTIONS_TOTAL} questions with answers</span></a>
            </nav>

            <section class="th-section" id="test" aria-labelledby="test-title">
              <h2 class="articles-title test-title" id="test-title">Java online test</h2>
              <p class="articles-lede">Multiple-choice questions on the topics you select. At the end you see your result as a percentage, every question, your answer and the correct one.</p>
              <%@include file="/WEB-INF/views/test/start-exam.jsp"%>
            </section>

            <section class="th-section" id="interview-questions" aria-labelledby="questions-title">
              <h2 class="articles-title test-title" id="questions-title">Java interview questions with answers</h2>
              <p class="articles-lede">Typical interview questions by topic. Read a question, answer it in your head, then reveal the answer — a fast way to revise a module before an interview or an exam.</p>
              <%@include file="/WEB-INF/views/test/start-course-quiz.jsp"%>
            </section>

            <section class="th-section" aria-labelledby="how-title">
              <h2 class="articles-title test-title" id="how-title">How it works</h2>
              <ul class="th-list">
                <li><b>Choose topics.</b> Select one lesson, a whole module or several modules of the Java Core course.</li>
                <li><b>Set the length.</b> From 5 to 100 questions; a typical test takes 10–30 minutes.</li>
                <li><b>Test questions are practical.</b> Many show a code fragment: decide whether it compiles, what it prints, find the error or fill in the missing part.</li>
                <li><b>Review the result.</b> After the test you get a score and a full review with the correct answers. Interview questions show the answer right away.</li>
              </ul>
            </section>

            <c:if test="${not empty COVER_MODULES}">
            <section class="th-section" aria-labelledby="covers-title">
              <h2 class="articles-title test-title" id="covers-title">What the tests and questions cover</h2>
              <p class="articles-lede">${TEST_QUESTIONS_TOTAL} test questions and ${QUIZ_QUESTIONS_TOTAL} interview questions across ${fn:length(COVER_MODULES)} modules. Open a module to see its lessons; a lesson link opens its interview questions.</p>
              <div class="th-covers">
                <c:forEach var="cover" items="${COVER_MODULES}">
                  <details class="th-module">
                    <summary><span class="th-module-name">${cover.module.name}</span>
                      <span class="th-module-meta">${cover.testQuestions} test · ${cover.quizQuestions} interview</span></summary>
                    <ul>
                      <c:forEach var="lesson" items="${cover.lessons}">
                        <li>
                          <c:choose>
                            <c:when test="${lesson.questionsCount > 0}"><a href="${pageContext.request.contextPath}/${HUB_COURSE_PATH}/${lesson.pathName}/quiz">${lesson.name}</a></c:when>
                            <c:otherwise><a href="${pageContext.request.contextPath}/java/${HUB_COURSE_PATH}/${lesson.pathName}">${lesson.name}</a></c:otherwise>
                          </c:choose>
                          <span class="th-lesson-meta">${lesson.testsCount} test · ${lesson.questionsCount} interview</span>
                        </li>
                      </c:forEach>
                    </ul>
                  </details>
                </c:forEach>
              </div>
            </section>
            </c:if>

            <aside class="th-note">
              <p><b>Need to write code instead?</b> These are knowledge checks. For hands-on coding practice, try our <a href="${pageContext.request.contextPath}/practical-java-tasks">Java practice exercises</a> — tasks by module with hints and solutions.</p>
            </aside>

            <jsp:include page="/WEB-INF/views/test/_tests-faq-en.jsp"/>
          </section>
         </main>
 </jsp:body>
</t:wrapper2>
