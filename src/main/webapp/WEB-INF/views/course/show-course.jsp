<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- Числа (модули, уроки, задачи, тестовые вопросы, видео, часы) и программа по модулям — HomeUtility.addHomeToModel (CourseController.showCourse).
     В текстах курса из БД (description, iconText, article.text) можно писать {modules}, {lessons}, {tasks}, {tests}, {videos}, {hours} — подставляются числа с правильной формой слова. --%>
<spring:message code="home.lessons.${HOME_LESSONS_FORM}" arguments="${HOME_LESSONS}" var="lessonsText"/>
<spring:message code="home.tasks.${HOME_TASKS_FORM}" arguments="${HOME_TASKS}" var="tasksText"/>
<spring:message code="home.tests.${TEST_QUESTIONS_FORM}" arguments="${TEST_QUESTIONS_TOTAL}" var="testsText"/>
<spring:message code="home.videos.${HOME_VIDEOS_FORM}" arguments="${HOME_VIDEOS}" var="videosText"/>
<spring:message code="hub.modules.${HOME_MODULES_FORM}" arguments="${fn:length(HOME_MODULES)}" var="modulesText"/>
<spring:message code="course.hours.${HOME_STUDY_HOURS_FORM}" arguments="${HOME_STUDY_HOURS}" var="hoursText"/>
<c:set var="courseArticle" value="${TESTS[param.TEST_PATH].article}"/>
<c:set var="courseDescription" value="${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(courseArticle.description, '{lessons}', lessonsText), '{tasks}', tasksText), '{tests}', testsText), '{videos}', videosText), '{modules}', modulesText), '{hours}', hoursText)}"/>
<c:set var="courseLede" value="${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(TESTS[param.TEST_PATH].iconText, '{lessons}', lessonsText), '{tasks}', tasksText), '{tests}', testsText), '{videos}', videosText), '{modules}', modulesText), '{hours}', hoursText)}"/>
<c:set var="courseText" value="${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(courseArticle.text, '{lessons}', lessonsText), '{tasks}', tasksText), '{tests}', testsText), '{videos}', videosText), '{modules}', modulesText), '{hours}', hoursText)}"/>
<c:choose>
    <c:when test="${param.TEST_PATH=='java-core-russian'}"><c:set var="ogImage" value="https://img.examclouds.com/general/og-home-ru.png"/></c:when>
    <c:when test="${param.TEST_PATH=='java-core'}"><c:set var="ogImage" value="https://img.examclouds.com/general/og-home-en.png"/></c:when>
    <c:otherwise><c:set var="ogImage" value="https://img.examclouds.com/general/logo-f.png"/></c:otherwise>
</c:choose>
<t:wrapper2>
    <jsp:attribute name="header">
        <meta name="description" content="${fn:escapeXml(courseDescription)}">
        <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
        <title>${courseArticle.title}</title>
        <c:set var="canonicalUrl" value="https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}${TESTS[param.TEST_PATH].fullPathName}"/>
        <link rel="canonical" href="${canonicalUrl}">
        <c:set var="currentLang" value="${TESTS[param.TEST_PATH].language.code}"/>
        <c:set var="ruHref" value="${currentLang=='ru' ? canonicalUrl : null}"/>
        <c:set var="enHref" value="${currentLang=='en' ? canonicalUrl : null}"/>
        <link rel="alternate" hreflang="${currentLang}" href="${canonicalUrl}">
        <c:forEach var="alt" items="${TESTS[param.TEST_PATH].canonicalUrls}">
            <c:if test="${alt.value != null && alt.value.url != null}">
                <c:set var="altPathLanguage" value="${alt.value.language.code=='ru' ? '/ru' : ''}"/>
                <c:set var="altHref" value="https://www.examclouds.com${altPathLanguage}${alt.value.url}"/>
                <link rel="alternate" hreflang="${alt.value.language.code}" href="${altHref}">
                <c:if test="${alt.value.language.code=='ru'}"><c:set var="ruHref" value="${altHref}"/></c:if>
                <c:if test="${alt.value.language.code=='en'}"><c:set var="enHref" value="${altHref}"/></c:if>
            </c:if>
        </c:forEach>
        <c:set var="xDefaultHref" value="${enHref != null ? enHref : ruHref}"/>
        <c:if test="${xDefaultHref != null}">
            <link rel="alternate" hreflang="x-default" href="${xDefaultHref}">
        </c:if>
        <meta property="og:title" content="${courseArticle.title}">
        <meta property="og:type" content="website">
        <meta property="og:description" content="${fn:escapeXml(courseDescription)}">
        <meta property="og:site_name" content="ExamClouds">
        <meta property="og:url" content="${canonicalUrl}">
        <meta property="og:image" content="${ogImage}">
        <meta property="og:image:alt" content="${courseArticle.title}">
        <meta name="twitter:image" content="${ogImage}">
        <meta name="twitter:image:alt" content="${courseArticle.title}">
        <meta name="twitter:title" content="${courseArticle.title}">
        <meta name="twitter:card" content="summary_large_image">
        <meta name="twitter:description" content="${fn:escapeXml(courseDescription)}">
        <meta name="twitter:site" content="@ExamClouds">
        <script type="application/ld+json">{
            "@context": "https://schema.org",
            "@type": "Course",
            "@id": "${canonicalUrl}#course",
            "name": "${courseArticle.title}",
            "description": "${courseDescription}",
            "url": "${canonicalUrl}",
            "inLanguage": "${TESTS[param.TEST_PATH].language.code}",
            "isAccessibleForFree": true,
            "educationalLevel": "Beginner",
            "provider": {
                "@type": "Organization",
                "name": "ExamClouds",
                "url": "https://www.examclouds.com"
            },
            <c:if test="${HOME_STUDY_HOURS > 0}">
            "hasCourseInstance": {"@type": "CourseInstance", "courseMode": "Online", "courseWorkload": "PT${HOME_STUDY_HOURS}H"},
            </c:if>
                  "learningResourceType": "Course",
                  "teaches": [
                      <c:set var="visibleCount" value="0"/>
                      <c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
                        <c:if test="${category.value.hidden==false && category.value.parentCategory==null}">
                          <c:set var="visibleCount" value="${visibleCount + 1}"/>
                        </c:if>
                      </c:forEach>
                      <c:set var="currentIndex" value="0"/>
                      <c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
                        <c:if test="${category.value.hidden==false && category.value.parentCategory==null}">
                          <c:set var="currentIndex" value="${currentIndex + 1}"/>
                          "<c:out value='${category.value.roadMapName!=null && not empty category.value.roadMapName?category.value.roadMapName:category.value.name}'/>"<c:if test="${currentIndex < visibleCount}">,</c:if>
                        </c:if>
                      </c:forEach>
                    ],
            "author": {
                "@type": "Person",
                "name": "Tatyana Milkina",
                "url": "https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}tatyana-milkina"
            },
            "offers": {
                "@type": "Offer",
                "price": "0",
                "priceCurrency": "EUR",
                "category": "Free"
            }
        }</script>
    </jsp:attribute>
    <jsp:body>
    <main class="course-bg" style="padding:0 0 3rem;">
        <c:set var="firstCategoryPath" value="${not empty HOME_MODULES ? HOME_MODULES[0].firstLesson.pathName : ''}"/>
        <!-- ===== Blue hero ===== -->
        <section class="course-hero">
            <div class="container">
                <nav class="crumbs crumbs-on-dark" aria-label="Breadcrumb">
                    <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>">
                        <span><spring:message code="home"/></span>
                    </a>
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
                                "name": "${TESTS[param.TEST_PATH].name}",
                                "item": "${canonicalUrl}"
                            }
                        ]
                    }</script>
                </nav>
                <h1 class="course-hero-title">${courseArticle.title}</h1>
                <p class="course-hero-lede">
                    ${courseLede}
                </p>
                <c:if test="${not empty firstCategoryPath}">
                    <a class="btn btn-onPrimary" href="${pageContext.request.contextPath}/${pageLanguage=='ru'?'ru/':''}java/${param.TEST_PATH}/${firstCategoryPath}"><spring:message code="start.course"/></a>
                </c:if>
                <p class="course-hero-note" style="margin:.6rem 0 0;font-size:.85rem;opacity:.85;"><spring:message code="free"/> · <spring:message code="without.registration"/></p>
            </div>
        </section>
        <c:set var="lessonBase" value="${pageContext.request.contextPath}/${pageLanguage=='ru'?'ru/':''}java/${param.TEST_PATH}/"/>
        <div class="container" style="margin-top:1.5rem;">
            <div class="course-ux-grid">
                <!-- ============ MAIN ============ -->
                <div style="display:grid;gap:1.25rem;min-width:0;">

                    <!-- Description + Details -->
                    <section class="panel">
                        <div class="course-detail-grid">
                            <div>
                                <h2><spring:message code="course.description"/></h2>
                                <div class="course-desc-text">
                                    ${courseText}
                                </div>
                                <c:if test="${sessionScope.person != null}">
                                <div class="overall-progress" id="course-overall-progress" style="display:none;">
                                    <div class="progress-row" style="margin-top:0;">
                                        <span style="color:var(--muted-fg);"><spring:message code="overall.progress"/></span>
                                        <span class="pct" id="overall-pct">0%</span>
                                    </div>
                                    <div class="bar"><span id="overall-bar" style="width:0%"></span></div>
                                    <p class="lesson-side-progress" id="overall-stats"></p>
                                </div>
                                </c:if>
                            </div>

                            <div class="details-col">
                                <h2><spring:message code="course.details"/></h2>
                                <ul class="detail-list">
                                    <li><span class="ic">👥</span><span><spring:message code="course.students"/></span></li>
                                    <li><span class="ic">🌐</span><span>${TESTS[param.TEST_PATH].language.description}</span></li>
                                    <c:if test="${not empty HOME_MODULES}">
                                        <li><span class="ic">🗂</span><span>${modulesText}</span></li>
                                    </c:if>
                                    <c:if test="${HOME_LESSONS > 0}">
                                        <li><span class="ic">📚</span><span>${lessonsText}</span></li>
                                    </c:if>
                                    <c:if test="${HOME_TASKS > 0}">
                                        <li><span class="ic">✅</span><span>${tasksText}</span></li>
                                    </c:if>
                                    <c:if test="${TEST_QUESTIONS_TOTAL > 0}">
                                        <li><span class="ic">📝</span><span>${testsText}</span></li>
                                    </c:if>
                                    <c:if test="${HOME_VIDEOS >= 20}"><%-- меньше 20 видео на курс — строку не показываем --%>
                                        <li><span class="ic">🎥</span><span>${videosText}</span></li>
                                    </c:if>
                                    <c:if test="${HOME_STUDY_HOURS > 0}">
                                        <li><span class="ic">⏱</span><span>${hoursText}</span></li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </section>

                    <!-- Modules: все уроки ссылками (данные — HomeUtility.ProgramModule) -->
                    <section id="modules" class="panel" aria-labelledby="modules-title">
                        <h2 id="modules-title" style="margin-bottom:1.25rem;"><spring:message code="course.program.title"/></h2>
                        <div class="modules-grid">
                            <c:forEach var="pm" items="${HOME_MODULES}">
                                <c:set var="moduleCat" value="${pm.module}"/>
                                <article class="module-card" id="module-${pm.number}">
                                    <div class="module-card-head">
                                        <div>
                                            <h3>${pm.number}. ${not empty moduleCat.roadMapName ? moduleCat.roadMapName : moduleCat.name}</h3>
                                            <spring:message code="home.lessons.${pm.lessonsForm}" arguments="${pm.lessons}" var="moduleLessonsText"/>
                                            <p class="module-meta">${moduleLessonsText}<c:if test="${pm.tasks > 0}"><spring:message code="home.tasks.${pm.tasksForm}" arguments="${pm.tasks}" var="moduleTasksText"/> · ${moduleTasksText}</c:if></p>
                                        </div>
                                        <c:set var="subIds" value=""/>
                                        <c:set var="visibleSubCount" value="0"/>
                                        <c:forEach var="subCategory" items="${moduleCat.subCategories}">
                                            <c:if test="${subCategory.hidden==false}">
                                                <c:set var="subIds" value="${empty subIds ? '' : subIds.concat(',')}"/>
                                                <c:set var="subIds" value="${subIds}${subCategory.id}"/>
                                                <c:set var="visibleSubCount" value="${visibleSubCount + 1}"/>
                                            </c:if>
                                        </c:forEach>
                                        <div class="progress-ring module-progress-ring" data-sub-ids="${subIds}" data-sub-total="${visibleSubCount}" style="--p:0;--c:oklch(0.55 0.18 255);display:none;">
                                            <span>0%</span>
                                        </div>
                                    </div>
                                    <%-- Первые 4 урока видны сразу, остальные — в раскрывающемся списке (ссылки в <details> индексируются). --%>
                                    <ol class="module-topics">
                                        <c:set var="k" value="0"/>
                                        <c:forEach var="subCategory" items="${moduleCat.subCategories}">
                                            <c:if test="${subCategory.hidden==false && subCategory.id != pm.tasksPage.id && empty subCategory.subCategories}">
                                                <c:if test="${k < 4}">
                                                    <li><a href="${lessonBase}${subCategory.pathName}">${subCategory.name}</a><span class="arrow">›</span></li>
                                                </c:if>
                                                <c:set var="k" value="${k + 1}"/>
                                            </c:if>
                                        </c:forEach>
                                    </ol>
                                    <c:if test="${pm.lessons > 4}">
                                        <details class="module-all">
                                            <summary><spring:message code="course.all.lessons" arguments="${pm.lessons}"/></summary>
                                            <ol class="module-topics" start="5">
                                                <c:set var="k" value="0"/>
                                                <c:forEach var="subCategory" items="${moduleCat.subCategories}">
                                                    <c:if test="${subCategory.hidden==false && subCategory.id != pm.tasksPage.id && empty subCategory.subCategories}">
                                                        <c:if test="${k >= 4}">
                                                            <li><a href="${lessonBase}${subCategory.pathName}">${subCategory.name}</a><span class="arrow">›</span></li>
                                                        </c:if>
                                                        <c:set var="k" value="${k + 1}"/>
                                                    </c:if>
                                                </c:forEach>
                                            </ol>
                                        </details>
                                    </c:if>
                                    <c:if test="${pm.tasksPage != null && pm.tasks > 0}">
                                        <a class="module-more" href="${lessonBase}${pm.tasksPage.pathName}"><spring:message code="course.module.tasks"/> ›</a>
                                    </c:if>
                                </article>
                            </c:forEach>
                        </div>
                    </section>
              </div>

                <!-- ============ RIGHT PANEL ============ -->
                <aside class="course-ux-side">
                    <div class="panel course-ux-side-first">
                        <h2><spring:message code="more.resources"/></h2>
                        <ul class="res-list">
                            <li>
                                <a href="https://www.youtube.com/c/tatyanamilkina" target="_blank" rel="noopener nofollow">
                                    <span class="ic" style="background:oklch(0.6 0.22 27)">▶</span>
                                    <div>
                                        <b><spring:message code="youtube.channel"/></b>
                                        <span><spring:message code="youtube.channel.subtitle"/></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.udemy.com/course/java-bup/" target="_blank" rel="nofollow sponsored noopener">
                                    <span class="ic" style="background:oklch(0.55 0.18 285)">🎓</span>
                                    <div>
                                        <b><spring:message code="udemy.course"/></b>
                                        <span><spring:message code="udemy.course.subtitle"/></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.patreon.com/bePatron?u=71601793" target="_blank" rel="noopener nofollow sponsored">
                                    <span class="ic" style="background:oklch(0.6 0.2 25)">♥</span>
                                    <div>
                                        <b><spring:message code="patreon.support"/></b>
                                        <span><spring:message code="patreon.support.subtitle"/></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="https://t.me/examclouds/" target="_blank" rel="nofollow noopener">
                                    <span class="ic" style="background:oklch(0.65 0.15 235)">✈</span>
                                    <div>
                                        <b><spring:message code="telegram.community"/></b>
                                        <span><spring:message code="telegram.community.subtitle"/></span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="course-ux-side-rest">
                        <jsp:include page="/WEB-INF/author/author-mini-card.jsp"/>
                        <c:if test="${pageLanguage=='ru'}">
                          <jsp:include page="/WEB-INF/promo/udemy-promo.jsp"/>
                        </c:if>
                    </div>
                </aside>
            </div>
        </div>
          <jsp:include page="/WEB-INF/comment/comments.jsp">
              <jsp:param name="referenceId" value="${TESTS[param.TEST_PATH].id}"/>
              <jsp:param name="commentType" value="TEST"/>
          </jsp:include>
    </main>
    <c:if test="${sessionScope.person != null}">
    <script src="${pageContext.request.contextPath}/js/learned-progress.js"></script>
    <script>
    LearnedProgress.initCoursePage({
        ctx: '${pageContext.request.contextPath}',
        testPath: '${param.TEST_PATH}',
        labelOf: '<spring:message code="learned.of.total"/>',
        labelLearnedWord: '<spring:message code="learned.word"/>'
    });
    </script>
    </c:if>
    </jsp:body>
</t:wrapper2>