<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<t:wrapper2>
    <jsp:attribute name="header">
        <meta name="description" content="${TESTS[param.TEST_PATH].article.description}">
        <title>${TESTS[param.TEST_PATH].article.title}</title>
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
        <meta property="og:title" content="${TESTS[param.TEST_PATH].article.title}">
        <meta property="og:type" content="article">
        <meta property="og:description" content="${TESTS[param.TEST_PATH].article.description}">
        <meta property="og:site_name" content="ExamClouds">
        <meta property="og:url" content="https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}${TESTS[param.TEST_PATH].fullPathName}">
        <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
        <meta property="og:image:alt" content="${TESTS[param.TEST_PATH].article.title}">
        <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
        <meta property="twitter:image:alt" content="${TESTS[param.TEST_PATH].article.title}">
        <meta property="twitter:title" content="${TESTS[param.TEST_PATH].article.title}">
        <meta property="twitter:card" content="summary_large_image">
        <meta property="twitter:description" content="${TESTS[param.TEST_PATH].article.description}">
        <meta property="twitter:site" content="@ExamClouds">
        <script type="application/ld+json">{
            "@context": "https://schema.org",
            "url": "https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}${TESTS[param.TEST_PATH].fullPathName}",
            "@type": "Article",
            "headline": "${TESTS[param.TEST_PATH].article.title}"
        }
        </script>
    </jsp:attribute>
    <jsp:body>
    <main class="course-bg" style="padding:0 0 3rem;">
        <c:set var="firstCategoryPath" value=""/>
        <c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
            <c:if test="${empty firstCategoryPath && category.value.hidden==false && category.value.parentCategory==null}">
                <c:set var="firstCategoryPath" value="${category.value.subCategories[0].pathName}"/>
            </c:if>
        </c:forEach>
        <!-- ===== Blue hero ===== -->
        <section class="course-hero">
            <div class="container">
                <nav class="crumbs crumbs-on-dark" aria-label="Breadcrumb">
                    <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>">
                        <span><spring:message code="home"/></span>
                    </a>
                    <span class="sep">›</span>
                    <span class="here">${TESTS[param.TEST_PATH].name}</span>
                </nav>
                <h1 class="course-hero-title">${TESTS[param.TEST_PATH].article.title}</h1>
                <p class="course-hero-lede">
                    ${TESTS[param.TEST_PATH].iconText}
                </p>
                <c:if test="${not empty firstCategoryPath}">
                    <a class="btn btn-onPrimary" href="${pageContext.request.contextPath}/${pageLanguage=='ru'?'ru/':''}java/${param.TEST_PATH}/${firstCategoryPath}"><spring:message code="start.course"/></a>
                </c:if>
                <p class="course-hero-note" style="margin:.6rem 0 0;font-size:.85rem;opacity:.85;"><spring:message code="free"/> · <spring:message code="without.registration"/></p>
            </div>
        </section>
        <div class="container" style="margin-top:1.5rem;">
            <div class="course-ux-grid">
                <!-- ============ MAIN ============ -->
                <div style="display:grid;gap:1.25rem;min-width:0;">

                    <!-- Description + Details -->
                    <section class="panel">
                        <div class="course-detail-grid">
                            <div>
                                <h2><spring:message code="course.description"/></h2>
                                <p class="course-desc-text">
                                    ${TESTS[param.TEST_PATH].article.text}
                                </p>
                                <!-- <div class="overall-progress">
                                    <div class="progress-row" style="margin-top:0;">
                                        <span style="color:var(--muted-fg);">Overall Progress</span>
                                        <span class="pct">58%</span>
                                    </div>
                                    <div class="bar"><span style="width:58%"></span></div>
                                </div>-->
                            </div>

                            <div class="details-col">
                                <h2><spring:message code="course.details"/></h2><spring:message code="without.registration"/>
                                <ul class="detail-list">
                                    <li><span class="ic">👥</span><span>2,100 <spring:message code="enrolled"/></span></li>
                                    <li><span class="ic">🌐</span><span>${TESTS[param.TEST_PATH].language.description}</span></li>
                                    <c:set var="lessonsCount" value="${fn:length(TESTS[param.TEST_PATH].categories)}"/>
                                    <c:set var="hoursCount" value="${(lessonsCount * 7 + 9) / 30}"/>
                                    <li><span class="ic">⏱</span><span>~<fmt:formatNumber value="${hoursCount}" maxFractionDigits="0"/>&nbsp;<spring:message code="hours"/></span></li>
                                    <li><span class="ic">📚</span><span>${lessonsCount}&nbsp;<spring:message code="lessons"/></span></li>
                                    <li><span class="ic">🧠</span><span><spring:message code="questions"/></span></li>
                                    <c:if test="${TESTS[param.TEST_PATH].pathName!='jpa' && TESTS[param.TEST_PATH].pathName!='web-services'}">
                                        <li><span class="ic">📝</span><span><spring:message code="tests"/></span></li>
                                        <li><span class="ic">🎥</span><span><spring:message code="category.video"/></span></li>
                                        <li><span class="ic">✅</span><span><spring:message code="menu.tasks.label"/></span></li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </section>

                    <!-- Modules -->
                    <section id="modules" class="panel">
                        <h2 style="margin-bottom:1.25rem;"><spring:message code="modules"/></h2>
                        <div class="modules-grid">
                            <!-- card template -->
                            <c:set var="catStatus" value="1" />
                            <c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
                                <c:if test="${category.value.hidden==false && category.value.parentCategory==null}">
                                    <article class="module-card">
                                        <div class="module-card-head">
                                            <div>
                                                <h3>${catStatus}. ${category.value.roadMapName!=null && not empty category.value.roadMapName?category.value.roadMapName:category.value.name}</h3>
                                                <c:set var="catStatus" value="${catStatus + 1}" />
                                                <c:set var="subCategoriesCount" value="${fn:length(category.value.subCategories)}"/>
                                                <c:if test="${subCategoriesCount>0}">
                                                    <p class="module-meta">${fn:length(category.value.subCategories)}&nbsp;<spring:message code="lessons"/></p>
                                                </c:if>
                                            </div>
                                            <!--<div class="progress-ring" style="--p:100;--c:oklch(0.55 0.18 255);">
                                                <span>100%</span>
                                            </div>-->
                                        </div>
                                        <ul class="module-topics">
                                            <c:set var="k" value="0" />
                                            <c:set var="firstSubCategory" value="${category.value.subCategories[0]}" />
                                            <c:forEach var="subCategory" items="${category.value.subCategories}">
                                                <c:if test="${subCategory.hidden==false && k<3}">
                                                    <li><span>${subCategory.name}</span>›</li>
                                                    <c:set var="k" value="${k + 1}" />
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                        <a class="module-more" href="${pageContext.request.contextPath}/${pageLanguage=='ru'?'ru/':''}java/${param.TEST_PATH}/${firstSubCategory.pathName}"><spring:message code="show.more"/> ›</a>
                                    </article>
                                </c:if>
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
    </main>
    <!-- <jsp:include page="/WEB-INF/comment/comments.jsp">
        <jsp:param name="referenceId" value="${TESTS[param.TEST_PATH].id}"/>
        <jsp:param name="commentType" value="TEST"/>
    </jsp:include>-->
    </jsp:body>
</t:wrapper2>