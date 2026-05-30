<%@ page trimDirectiveWhitespaces="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<t:wrapper2>
    <jsp:attribute name="language">lang="en"</jsp:attribute>
    <jsp:attribute name="header">
        <meta name="description" content="Learn Java with free video lessons for beginners! Step-by-step tutorials covering Java Core from your first program to Collections, Lambda, and Stream API. Start your path to becoming a Java developer today.">
        <title>Java Video Lessons for Beginners | Free Java Core Video Course</title>
        <link rel="canonical" href="https://www.examclouds.com/video-lessons">
        <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/video-java-uroki">
        <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/video-lessons">
        <link rel="alternate" hreflang="en" href="https://www.examclouds.com/video-lessons">
        <meta property="og:title" content="Java Video Lessons for Beginners | Free Java Core Video Course">
        <meta property="og:type" content="article">
        <meta property="og:description" content="Learn Java with free video lessons for beginners! Step-by-step tutorials covering Java Core from your first program to Collections, Lambda, and Stream API. Start your path to becoming a Java developer today.">
        <meta property="og:site_name" content="ExamClouds">
        <meta property="og:url" content="https://www.examclouds.com/video-lessons">
        <meta property="twitter:title" content="Java Video Lessons for Beginners | Free Java Core Video Course">
        <meta property="twitter:card" content="summary">
        <meta property="twitter:description" content="Learn Java with free video lessons for beginners! Step-by-step tutorials covering Java Core from your first program to Collections, Lambda, and Stream API. Start your path to becoming a Java developer today.">
        <meta property="twitter:site" content="@ExamClouds">
        <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
        <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
        <meta property="twitter:image:alt" content="Java Video Lessons | Free Java Core Video Course">
    </jsp:attribute>
    <jsp:body>
        <main style="padding: 1.5rem 0 3rem;">
            <div class="container">
                <nav class="crumbs" aria-label="Breadcrumb">
                    <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>"><spring:message code="home"/></a>
                    <span class="sep">›</span>
                    <span class="here">Java Video Lessons</span>
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
                           "name": "Java video lessons",
                           "item": "https://www.examclouds.com/video-lessons"
                         }
                       ]
                     }</script>
                </nav>

                <!-- Hero -->
                <section class="panel tasks-hero">
                    <div class="tasks-hero-icon vid-hero-icon" aria-hidden="true">▶</div>
                    <div>
                        <h1 style="font-size:clamp(1.5rem,2.4vw,2rem);margin:0 0 .5rem;">Java video lessons</h1>
                        <p style="color:var(--muted-fg);margin:0 0 .75rem;max-width:60ch;">
                         A video library for the Java Core course.
                        </p>
                        <div class="vid-hero-meta">
                            <span class="vid-chip">📹 ${VIDEO_SUBCATEGORY_COUNTS}&nbsp;<spring:message code="videos"/></span>
                            <span class="vid-chip">☰ ${VIDEO_CATEGORIES.size()}&nbsp;<spring:message code="of.module"/></span>
                            <span class="vid-chip">✓&nbsp;<spring:message code="free"/></span>
                        </div>
                    </div>
                </section>

                <!-- Where to start -->
                <h2 class="vid-section-label">Where to start</h2>
                <div class="vid-featured-grid">
                    <a class="vid-feature" href="https://youtu.be/Ihw_mCj5oiU" target="_blank" rel="noopener noreferrer">
                        <div class="vid-thumb vid-thumb-1">
                            <span class="vid-thumb-badge">Intro</span>
                            <span class="vid-thumb-title">Features of Java Language</span>
                            <span class="vid-play">▶</span>
                        </div>
                        <div class="vid-feature-body">
                            <h3>Features of Java Language</h3>
                            <span class="vid-source">▶ YouTube</span>
                        </div>
                    </a>

                    <a class="vid-feature" href="https://youtu.be/AEFVgbkomes" target="_blank" rel="noopener noreferrer">
                                            <div class="vid-thumb vid-thumb-3">
                                                <span class="vid-thumb-badge">Key Concepts</span>
                                                <span class="vid-thumb-title">Translators, Compilers, Interpreters, Bytecode</span>
                                                <span class="vid-play">▶</span>
                                            </div>
                                            <div class="vid-feature-body">
                                                <h3>Java Translators, Compilers, Interpreters, and Bytecode</h3>
                                                <span class="vid-source">▶ YouTube</span>
                                            </div>
                                        </a>

                    <a class="vid-feature" href="https://youtu.be/jvhL10Fvj4s" target="_blank" rel="noopener noreferrer">
                        <div class="vid-thumb vid-thumb-2">
                            <span class="vid-thumb-badge">Setup</span>
                            <span class="vid-thumb-title">Installing the JDK</span>
                            <span class="vid-play">▶</span>
                        </div>
                        <div class="vid-feature-body">
                            <h3>Installing Java — JDK</h3>
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
                                    <summary>
                                        <span class="vid-sec-num">${categoryNumber}</span>
                                        <span class="vid-sec-title">${category.roadMapName!=null && not empty category.roadMapName?category.roadMapName:category.name}</span>
                                        <span class="vid-sec-count">${category.subCategories.size()}&nbsp;<spring:message code="videos"/></span>
                                        <span class="vid-sec-chev">▾</span>
                                    </summary>
                                    <c:set var="categoryNumber" value="${categoryNumber+1}"/>
                                    <ul class="vid-list">
                                     <c:set var="subCategoryNumber" value="${1}"/>
                                        <c:forEach var="subCategory" items="${category.subCategories}">
                                                <li>
                                                    <span class="vid-li-thumb"></span>
                                                    <span class="vid-li-num">${subCategoryNumber}</span>
                                                      <c:set var="subCategoryNumber" value="${subCategoryNumber+1}"/>
                                                    <a href="${pageContext.request.contextPath}/java/java-core/${subCategory.pathName}" class="vid-li-title">${subCategory.roadMapName!=null && not empty subCategory.roadMapName?subCategory.roadMapName:subCategory.name}</a>
                                                    <a href="${subCategory.videoPath}" target="_blank" rel="noopener noreferrer" class="vid-li-open" aria-label="See on Youtube" title="See on Youtube">↗</a>
                                                </li>
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
                                <li><a href="${pageContext.request.contextPath}/java/java-core/${category.subCategories[0].pathName}"><span class="t-name">${category.roadMapName!=null && not empty category.roadMapName?category.roadMapName:category.name}</span><span class="t-count">${category.subCategories.size()}</span></a></li>
                               </c:forEach>
                            </ul>
                        </div>

                        <div class="panel vid-channel">
                            <span class="vid-channel-ic">▶</span>
                            <p>All videos on the author's YouTube channel</p>
                            <a class="vid-channel-btn" href="https://www.youtube.com/c/tatyanamilkina" target="_blank" rel="noopener nofollow sponsored"><spring:message code="open.channel"/></a>
                        </div>
                    </aside>
                </div>
            </div>
        </main>
    </jsp:body>
</t:wrapper2>
