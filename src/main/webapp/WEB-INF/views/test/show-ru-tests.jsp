<%@ page trimDirectiveWhitespaces="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:wrapper2>
    <jsp:attribute name="header">
        <meta name="description" content="Пройдите бесплатные тесты по Java программированию на ExamClouds. Узнайте свой уровень знаний, подготовьтесь к интервью и улучшите навыки программирования.">
        <title>Бесплатные тесты по Java: уровень знаний и подготовка к интервью</title>
        <link href="${pageContext.request.contextPath}/css/multi-select.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sh-test.css?v=1" rel="stylesheet">
        <link rel="canonical" href="https://www.examclouds.com/ru/tests">
        <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/tests">
        <link rel="alternate" hreflang="en" href="https://www.examclouds.com/tests">
        <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/tests">
     <meta property="og:title" content="Бесплатные тесты по Java: уровень знаний и подготовка к интервью">
     <meta property="og:type" content="article">
     <meta property="og:description" content="Пройдите бесплатные тесты по Java программированию на ExamClouds. Узнайте свой уровень знаний, подготовьтесь к интервью и улучшите навыки программирования.">
     <meta property="og:site_name" content="ExamClouds">
     <meta property="og:url" content="https://www.examclouds.com/ru/tests">
     <meta property="twitter:title" content="Бесплатные тесты по Java: уровень знаний и подготовка к интервью">
     <meta property="twitter:card" content="summary_large_image">
     <meta property="twitter:description" content="Пройдите бесплатные тесты по Java программированию на ExamClouds. Узнайте свой уровень знаний, подготовьтесь к интервью и улучшите навыки программирования.">
     <meta property="twitter:site" content="@ExamClouds">
     <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
     <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
     <meta property="twitter:image:alt" content="Бесплатные тесты по Java: уровень знаний и подготовка к интервью">
    </jsp:attribute>
    <jsp:body>
        <main>
          <!-- Hero -->
          <section class="container articles-page">
            <span class="article-tag">Тесты</span>
            <h1 class="articles-title">Бесплатные тесты по Java</h1>
            <p class="articles-lede">Оцените свои знания и подготовьтесь к интервью. Выбирайте темы, задавайте количество вопросов — и проверьте себя онлайн.</p>

            <!-- How-to steps -->
            <div class="how-grid">
              <div class="how-step">
                <div class="ic">1</div>
                <div><b>Выберите категорию</b><p>Выберите одну или несколько категорий.</p></div>
              </div>
              <div class="how-step">
                <div class="ic">2</div>
                <div><b>Задайте количество</b><p>Укажите количество вопросов для теста.</p></div>
              </div>
              <div class="how-step">
                <div class="ic">3</div>
                <div><b>Пройдите тест</b><p>Нажмите «Пройти тест» и проверьте свои знания.</p></div>
              </div>
            </div>

            <!-- Test card -->
            <c:forEach var="test" items="${TESTS_WITH_TESTS}">
              <c:if test="${test.language.code==pageLanguage}">
                <div id="test-card" class="article-card article-card--c1" style="margin-top:2.5rem">
                  <div class="article-card-cover">
                    <span class="article-card-cat">${test.categories.size()} модуля</span>
                  </div>
                  <div class="article-card-body">
                    <h2>${test.name}</h2>
                    <p>${test.article.description}</p>
                    <div class="article-card-meta">
                      <span>⏱ 10–30 мин</span>
                    </div>
                  </div>
                  <div class="article-card-body test-form-body" style="padding-top:0">
                    <%@include file="/WEB-INF/views/test/start-exam.jsp"%>
                  </div>
                </div>
              </c:if>
            </c:forEach>

            <!-- About tests -->
            <div style="margin-top:3rem">
              <h2 class="articles-title" style="font-size:1.5rem">О наших тестах</h2>
              <p class="articles-lede">Изучаете Java программирование? ExamClouds подготовил для вас <strong>бесплатные тесты по Java программированию</strong>. Пройдя тестирование,
              вы узнаете свой уровень подготовки и выявите темы, которые необходимо повторить.</p>
              <p class="articles-lede">После завершения теста вы увидите свой результат в процентном и количественном выражении. Вам будут представлены
              все заданные вопросы, ваши и правильные ответы. При неудовлетворительном результате рекомендуем пройти бесплатный
              <a href="${pageContext.request.contextPath}/ru/java-core-russian">курс обучения</a> на нашем сайте полностью или изучить отдельные уроки по Java Core.</p>
              <p class="articles-lede">Большинство тестов включают практические задания. В некоторых из них вам нужно будет найти ошибку, в других — подставить
              пропущенные части или ответить на вопрос: «Откомпилируется ли код?». Если вы успешно проходите наши тесты, вы готовы к
              стажировке или работе на позиции Junior.</p>
            </div>

            <!-- Benefits -->
            <div style="margin-top:2.5rem">
              <h2 class="articles-title" style="font-size:1.5rem">Преимущества</h2>
              <div class="stat-grid stat-grid--bench" style="margin-top:1.25rem">
                <div class="stat-card"><div class="ic">🌐</div><div><b>Онлайн</b><span>В любое время и в любом месте</span></div></div>
                <div class="stat-card"><div class="ic">📚</div><div><b>Фундаментальные</b><span>Основные концепции Java</span></div></div>
                <div class="stat-card"><div class="ic">💼</div><div><b>Подготовка к интервью</b><span>Junior и выше</span></div></div>
                <div class="stat-card"><div class="ic">📊</div><div><b>Оценка уровня</b><span>Определите области для улучшения</span></div></div>
                <div class="stat-card"><div class="ic">🔄</div><div><b>Актуальные вопросы</b><span>Регулярно обновляемая база</span></div></div>
                <div class="stat-card"><div class="ic">🎯</div><div><b>Разнообразие тем</b><span>От базовых до продвинутых</span></div></div>
              </div>
            </div>

            <div class="test-cta">
              <p class="test-cta-text">Пройдите тесты прямо сейчас и проверьте, насколько хорошо вы знаете Java!</p>
              <a href="#test-card" class="test-cta-btn">Начать тест <span class="test-cta-btn-arrow">&#8594;</span></a>
            </div>
          </section>
        </main>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.multi-select.js"></script>
        <script src="${pageContext.request.contextPath}/js/selectCategoriesRu.js"></script>
        <script src="${pageContext.request.contextPath}/js/general.js"></script>
    </jsp:body>
</t:wrapper2>