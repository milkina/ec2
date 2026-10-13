<%@ page trimDirectiveWhitespaces="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- Объединённая страница: тест по Java онлайн (результат в %) + вопросы для собеседования с ответами.
     Числа — TestHubUtility.addTestHubToModel (курс java-core-russian), склонение — подписи th.questions.* / th.modules.dat.*. --%>
<spring:message code="th.questions.${TEST_QUESTIONS_FORM}" arguments="${TEST_QUESTIONS_TOTAL}" var="testQuestionsText"/>
<spring:message code="th.questions.${QUIZ_QUESTIONS_FORM}" arguments="${QUIZ_QUESTIONS_TOTAL}" var="quizQuestionsText"/>
<spring:message code="th.modules.dat.${COVER_MODULES_FORM}" arguments="${fn:length(COVER_MODULES)}" var="modulesDatText"/>
<c:set var="pageTitle" value="Тест по Java онлайн и вопросы для собеседования | ExamClouds"/>
<c:set var="pageDescription" value="Бесплатный тест по Java с результатом и ${quizQuestionsText} для собеседования с ответами по ${modulesDatText} Java Core — от синтаксиса до многопоточности. Без регистрации."/>
<t:wrapper2>
    <jsp:attribute name="header">
        <meta name="description" content="${fn:escapeXml(pageDescription)}">
        <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
        <title>${pageTitle}</title>
        <link href="${pageContext.request.contextPath}/css/tom-select.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sh-test.css?v=7" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/tom-select.complete.min.js" defer></script>
        <script src="${pageContext.request.contextPath}/js/selectCategoriesTS.js?v=4" defer></script>
        <link rel="canonical" href="https://www.examclouds.com/ru/tests">
        <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/tests">
        <link rel="alternate" hreflang="en" href="https://www.examclouds.com/tests">
        <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/tests">

        <!-- Open Graph -->
        <meta property="og:title" content="${pageTitle}">
        <meta property="og:type" content="website">
        <meta property="og:description" content="${fn:escapeXml(pageDescription)}">
        <meta property="og:site_name" content="ExamClouds">
        <meta property="og:url" content="https://www.examclouds.com/ru/tests">
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
            {"@type": "ListItem", "position": 1, "name": "Главная", "item": "https://www.examclouds.com/ru/"},
            {"@type": "ListItem", "position": 2, "name": "Тесты и вопросы для собеседования", "item": "https://www.examclouds.com/ru/tests"}
          ]
        }</script>

        <!-- LearningResource Schema -->
        <script type="application/ld+json">{
          "@context": "https://schema.org",
          "@type": "LearningResource",
          "learningResourceType": ["Assessment", "Quiz"],
          "name": "Тест по Java онлайн и вопросы для собеседования",
          "description": "<spring:escapeBody javaScriptEscape="true">${pageDescription}</spring:escapeBody>",
          "url": "https://www.examclouds.com/ru/tests",
          "inLanguage": "ru",
          "isAccessibleForFree": true,
          "educationalLevel": "Начальный и средний",
          "teaches": "Java Core",
          "author": {"@type": "Person", "name": "Tatyana Milkina", "url": "https://www.examclouds.com/ru/tatyana-milkina"},
          "provider": {"@type": "Organization", "name": "ExamClouds", "url": "https://www.examclouds.com"}
        }</script>
    </jsp:attribute>
     <jsp:body>
        <main aria-label="Тест по Java онлайн и вопросы для собеседования">
          <section class="container articles-page" aria-labelledby="tests-main-title">
            <nav class="crumbs" aria-label="Breadcrumb">
              <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>"><spring:message code="home"/></a>
              <span class="sep">›</span>
              <span class="here">Тесты и вопросы для собеседования</span>
            </nav>
            <h1 class="articles-title" id="tests-main-title">Тест по Java онлайн и вопросы для собеседования</h1>
            <p class="articles-lede">Проверьте знание Java Core двумя способами: пройдите тест и получите результат в процентах или повторите вопросы для собеседования с ответами в своём темпе. Выберите темы и число вопросов — от 5 до 100, регистрация не нужна.</p>
            <nav class="th-modes" aria-label="Выберите режим">
              <a class="th-mode" href="#test"><b>Тест по Java</b><span>${testQuestionsText} · результат и разбор ответов</span></a>
              <a class="th-mode" href="#interview-questions"><b>Вопросы для собеседования</b><span>${quizQuestionsText} с ответами</span></a>
            </nav>

            <section class="th-section" id="test" aria-labelledby="test-title">
              <h2 class="articles-title test-title" id="test-title">Тест по Java онлайн</h2>
              <p class="articles-lede">Вопросы с вариантами ответа по выбранным темам. В конце — результат в процентах, все вопросы, ваши ответы и правильные.</p>
              <%@include file="/WEB-INF/views/test/start-exam.jsp"%>
            </section>

            <section class="th-section" id="interview-questions" aria-labelledby="questions-title">
              <h2 class="articles-title test-title" id="questions-title">Вопросы для собеседования по Java с ответами</h2>
              <p class="articles-lede">Типичные вопросы собеседований по темам курса. Прочитайте вопрос, ответьте про себя и откройте ответ — быстрый способ повторить модуль перед собеседованием или экзаменом.</p>
              <%@include file="/WEB-INF/views/test/start-course-quiz.jsp"%>
            </section>

            <section class="th-section" aria-labelledby="how-title">
              <h2 class="articles-title test-title" id="how-title">Как это работает</h2>
              <ul class="th-list">
                <li><b>Выберите темы.</b> Один урок, целый модуль или несколько модулей курса Java Core.</li>
                <li><b>Задайте длину.</b> От 5 до 100 вопросов; обычный тест занимает 10–30 минут.</li>
                <li><b>Вопросы теста практические.</b> Во многих — фрагмент кода: скомпилируется ли он, что выведет, где ошибка, что пропущено.</li>
                <li><b>Разберите результат.</b> После теста — результат и полный разбор с правильными ответами. В вопросах для собеседования ответ открывается сразу.</li>
              </ul>
            </section>

            <c:if test="${not empty COVER_MODULES}">
            <section class="th-section" aria-labelledby="covers-title">
              <h2 class="articles-title test-title" id="covers-title">Какие темы охватывают тесты и вопросы</h2>
              <p class="articles-lede">${testQuestionsText} теста и ${quizQuestionsText} для собеседования по ${modulesDatText}. Раскройте модуль, чтобы увидеть уроки; ссылка урока открывает его вопросы.</p>
              <div class="th-covers">
                <c:forEach var="cover" items="${COVER_MODULES}">
                  <details class="th-module">
                    <summary><span class="th-module-name">${cover.module.name}</span>
                      <span class="th-module-meta">тест: ${cover.testQuestions} · вопросы: ${cover.quizQuestions}</span></summary>
                    <ul>
                      <c:forEach var="lesson" items="${cover.lessons}">
                        <li>
                          <c:choose>
                            <c:when test="${lesson.questionsCount > 0}"><a href="${pageContext.request.contextPath}/ru/${HUB_COURSE_PATH}/${lesson.pathName}/quiz">${lesson.name}</a></c:when>
                            <c:otherwise><a href="${pageContext.request.contextPath}/ru/java/${HUB_COURSE_PATH}/${lesson.pathName}">${lesson.name}</a></c:otherwise>
                          </c:choose>
                          <span class="th-lesson-meta">тест: ${lesson.testsCount} · вопросы: ${lesson.questionsCount}</span>
                        </li>
                      </c:forEach>
                    </ul>
                  </details>
                </c:forEach>
              </div>
            </section>
            </c:if>

            <aside class="th-note">
              <p><b>Хотите писать код?</b> Здесь — проверка знаний. Для практики программирования есть <a href="${pageContext.request.contextPath}/ru/practicheskie-zadachi">практические задачи по Java</a> — по модулям курса, с подсказками и решениями.</p>
            </aside>

            <jsp:include page="/WEB-INF/views/test/_tests-faq-ru.jsp"/>
          </section>
         </main>
 </jsp:body>
</t:wrapper2>
