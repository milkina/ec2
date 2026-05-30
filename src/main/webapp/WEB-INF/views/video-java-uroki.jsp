<%@ page trimDirectiveWhitespaces="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<t:wrapper2>
    <jsp:attribute name="language">lang="ru"</jsp:attribute>
    <jsp:attribute name="header">
        <meta name="description" content="Изучайте Java с нашими видео уроками для начинающих! Пошаговые руководства, практические примеры и советы от экспертов помогут вам быстро освоить основы программирования на Java. Начните свой путь к успешной карьере разработчика уже сегодня!">
        <title>Видео уроки по Java для начинающих | Видеокурс и обучение программированию</title>
        <link rel="canonical" href="https://www.examclouds.com/ru/video-java-uroki">
        <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/video-java-uroki">
        <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/video-lessons">
        <link rel="alternate" hreflang="en" href="https://www.examclouds.com/video-lessons">
        <meta property="og:title" content="Видео уроки по Java для начинающих | Видеокурс и обучение программированию">
        <meta property="og:type" content="article">
        <meta property="og:description" content="Изучайте Java с нашими видео уроками для начинающих! Пошаговые руководства, практические примеры и советы от экспертов помогут вам быстро освоить основы программирования на Java. Начните свой путь к успешной карьере разработчика уже сегодня!">
        <meta property="og:site_name" content="ExamClouds">
        <meta property="og:url" content="https://www.examclouds.com/ru/video-java-uroki">
        <meta property="twitter:title" content="Видео уроки по Java для начинающих | Видеокурс и обучение программированию">
        <meta property="twitter:card" content="summary">
        <meta property="twitter:description" content="Изучайте Java с нашими видео уроками для начинающих! Пошаговые руководства, практические примеры и советы от экспертов помогут вам быстро освоить основы программирования на Java. Начните свой путь к успешной карьере разработчика уже сегодня!">
        <meta property="twitter:site" content="@ExamClouds">
        <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
        <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
        <meta property="twitter:image:alt" content="Видео уроки по Java | Видеокурс и обучение программированию">
    </jsp:attribute>
    <jsp:body>
        <main style="padding: 1.5rem 0 3rem;">
            <div class="container">
                <nav class="crumbs" aria-label="Breadcrumb">
                    <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>"><spring:message code="home"/></a>
                    <span class="sep">›</span>
                    <span class="here">Видеоуроки Java</span>
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
                           "name": "Видеоуроки Java",
                           "item": "https://www.examclouds.com/ru/video-java-uroki"
                         }
                       ]
                     }</script>
                </nav>

                <!-- Hero -->
                <section class="panel tasks-hero">
                    <div class="tasks-hero-icon vid-hero-icon" aria-hidden="true">▶</div>
                    <div>
                        <h1 style="font-size:clamp(1.5rem,2.4vw,2rem);margin:0 0 .5rem;">Видео уроки по Java</h1>
                        <p style="color:var(--muted-fg);margin:0 0 .75rem;max-width:60ch;">
                        Бесплатные видеоуроки по Java на русском языке. Изучите основы Java с нуля: синтаксис, ООП, массивы, коллекции, лямбда и Stream API.
                        </p>
                        <div class="vid-hero-meta">
                            <span class="vid-chip">📹 ${VIDEO_SUBCATEGORY_COUNTS}&nbsp;<spring:message code="videos"/></span>
                            <span class="vid-chip">☰ ${VIDEO_CATEGORIES.size()}&nbsp;<spring:message code="of.module"/></span>
                            <span class="vid-chip">✓&nbsp;<spring:message code="free"/></span>
                        </div>
                    </div>
                </section>

                <!-- Where to start -->
                <h2 class="vid-section-label">С чего начать?</h2>
                <div class="vid-featured-grid">
                    <a class="vid-feature" href="https://youtu.be/Ir6KjeOhbGk" target="_blank" rel="noopener noreferrer">
                        <div class="vid-thumb vid-thumb-1">
                            <span class="vid-thumb-badge">Введение</span>
                            <span class="vid-thumb-title">Обзор курса</span>
                            <span class="vid-play">▶</span>
                        </div>
                        <div class="vid-feature-body">
                            <h3>Обзор курса</h3>
                            <span class="vid-source">▶ YouTube</span>
                        </div>
                    </a>

                    <a class="vid-feature" href="https://youtu.be/nQsriEscrm0" target="_blank" rel="noopener noreferrer">
                        <div class="vid-thumb vid-thumb-2">
                            <span class="vid-thumb-badge">Setup</span>
                            <span class="vid-thumb-title">Установка JDK</span>
                            <span class="vid-play">▶</span>
                        </div>
                        <div class="vid-feature-body">
                            <h3>Установка Java — JDK</h3>
                            <span class="vid-source">▶ YouTube</span>
                        </div>
                    </a>

                    <a class="vid-feature" href="https://youtu.be/KOFWqjyWrEI" target="_blank" rel="noopener noreferrer">
                        <div class="vid-thumb vid-thumb-3">
                            <span class="vid-thumb-badge">Collections</span>
                            <span class="vid-thumb-title">Принцип PECS</span>
                            <span class="vid-play">▶</span>
                        </div>
                        <div class="vid-feature-body">
                            <h3>Что такое принцип PECS в Java?</h3>
                            <span class="vid-source">▶ YouTube</span>
                        </div>
                    </a>
                </div>

                <!-- Two column: sections list + sidebar -->
                <div class="course-ux-grid" style="margin-top:1.5rem;">
                    <!-- ============ MAIN: section accordions ============ -->
                    <div style="display:grid;gap:1rem;min-width:0;">
                    <c:set var="categoryNumber" value="${1}"/>
                        <c:forEach var="category" items="${VIDEO_CATEGORIES}">
                                <details class="vid-section panel"${categoryNumber==1?"open":""}>
                                <c:set var="subCategoryCount" value="${0}"/>
                                                                <c:forEach var="subCategory" items="${category.subCategories}">
                                                                    <c:if test="${subCategory.videoPath!=null && not empty subCategory.videoPath}">
                                                                        <c:set var="subCategoryCount" value="${subCategoryCount+1}"/>
                                                                    </c:if>
                                                                </c:forEach>
                                    <summary>
                                        <span class="vid-sec-num">${categoryNumber}</span>
                                        <span class="vid-sec-title">${category.roadMapName!=null && not empty category.roadMapName?category.roadMapName:category.name}</span>
                                        <span class="vid-sec-count">${subCategoryCount}&nbsp;<spring:message code="videos"/></span>
                                        <span class="vid-sec-chev">▾</span>
                                    </summary>
                                    <c:set var="categoryNumber" value="${categoryNumber+1}"/>
                                    <ul class="vid-list">
                                     <c:set var="subCategoryNumber" value="${1}"/>
                                        <c:forEach var="subCategory" items="${category.subCategories}">
                                        <c:if test="${subCategory.videoPath!=null && not empty subCategory.videoPath}">
                                                <li>
                                                    <span class="vid-li-thumb"></span>
                                                    <span class="vid-li-num">${subCategoryNumber}</span>
                                                      <c:set var="subCategoryNumber" value="${subCategoryNumber+1}"/>
                                                    <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/${subCategory.pathName}" class="vid-li-title">${subCategory.roadMapName!=null && not empty subCategory.roadMapName?subCategory.roadMapName:subCategory.name}</a>
                                                    <a href="${subCategory.videoPath}" target="_blank" rel="noopener noreferrer" class="vid-li-open" aria-label="Смотреть на Youtube" title="Смотреть на Youtube">↗</a>
                                                </li>
                                        </c:if>
                                        </c:forEach>
                                    </ul>
                                </details>
                        </c:forEach>
                      </div>

                    <!-- ============ RIGHT PANEL ============ -->
                    <aside class="course-ux-side">
                        <div class="panel">
                            <h2 class="side-h"><spring:message code="modules"/></h2>
                            <ul class="topic-list">
                              <c:forEach var="category" items="${VIDEO_CATEGORIES}">
                                <li><a href="${pageContext.request.contextPath}/ru/java/java-core-russian/${category.subCategories[0].pathName}"><span class="t-name">${category.roadMapName!=null && not empty category.roadMapName?category.roadMapName:category.name}</span><span class="t-count">${category.subCategories.size()}</span></a></li>
                               </c:forEach>
                            </ul>
                        </div>

                        <div class="panel vid-channel">
                            <span class="vid-channel-ic">▶</span>
                            <p>Все видео на YouTube канале автора</p>
                            <a class="vid-channel-btn" href="https://www.youtube.com/c/tatyanamilkina" target="_blank" rel="noopener nofollow sponsored"><spring:message code="open.channel"/></a>
                        </div>
                    </aside>
                </div>
            </div>
        </main>
    </jsp:body>
</t:wrapper2>
