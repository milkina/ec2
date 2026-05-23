<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:wrapper2>
    <jsp:attribute name="header">
    <c:set var="titleName" value="${CATEGORY_ATTRIBUTE.name} - ${TESTS[param.TEST_PATH].name}"/>
    <c:if test="${CATEGORY_ATTRIBUTE.title!=null && !CATEGORY_ATTRIBUTE.title.equals('')}">
      <c:set var="titleName" value="${CATEGORY_ATTRIBUTE.title}"/>
    </c:if>
    <c:if test="${CATEGORY_ATTRIBUTE.parentCategory!=null && (CATEGORY_ATTRIBUTE.name.equals('Задания') || CATEGORY_ATTRIBUTE.name.equals('Tasks')) && (CATEGORY_ATTRIBUTE.title==null || CATEGORY_ATTRIBUTE.title.trim().equals(''))}">
       <c:set var="titleName" value="${CATEGORY_ATTRIBUTE.parentCategory.name}. ${titleName}"/>
    </c:if>
    <c:set var="header1" value="${CATEGORY_ATTRIBUTE.name}"/>
    <c:if test="${CATEGORY_ATTRIBUTE.parentCategory!=null && (CATEGORY_ATTRIBUTE.name.equals('Задания') || CATEGORY_ATTRIBUTE.name.equals('Tasks'))}">
       <c:set var="header1" value="${CATEGORY_ATTRIBUTE.parentCategory.name}. ${CATEGORY_ATTRIBUTE.name}"/>
    </c:if>
    <title><c:out value="${titleName}"/></title>
    <meta name="description" content="${CATEGORY_ATTRIBUTE.article.description}">
    <%@ include file="/edit/categoryOL.jsp"%>
    <c:set var="pathLanguage" value="${TESTS[param.TEST_PATH].language.code=='ru'?'ru/':''}"/>
    <c:set var="canonicalUrl" value="https://www.examclouds.com/${pathLanguage}java/${param.TEST_PATH}/${CATEGORY_ATTRIBUTE.pathName}"/>
    <link rel="canonical" href="${canonicalUrl}">
    <c:set var="currentLang" value="${TESTS[param.TEST_PATH].language.code}"/>
    <c:set var="ruHref" value="${currentLang=='ru' ? canonicalUrl : null}"/>
    <c:set var="enHref" value="${currentLang=='en' ? canonicalUrl : null}"/>
    <link rel="alternate" hreflang="${currentLang}" href="${canonicalUrl}">
    <c:forEach var="alt" items="${CATEGORY_ATTRIBUTE.canonicalUrls}">
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
   <meta property="og:url" content="${canonicalUrl}">
   <c:if test="${CATEGORY_ATTRIBUTE.hidden || !CATEGORY_ATTRIBUTE.article.indexStatus}">
          <meta name="robots" content="noindex">
    </c:if>
    <script type="application/ld+json">{
         "@context": "https://schema.org",
         "url": "${canonicalUrl}",
         "@type": "Article",
         "headline": "<c:out value="${titleName}"/>"
    }
    </script>
    </jsp:attribute>
    <jsp:body>
      <main class="lesson-bg">
        <div class="container lesson-grid">
           <!-- ===== LEFT: sticky course outline ===== -->
                 <aside class="lesson-outline">
                   <div class="panel lesson-outline-panel">
                     <p class="lesson-outline-eyebrow">${TESTS[param.TEST_PATH].name}</p>
                     <c:set var="catStatus" value="1" />
                     <c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
                       <c:if test="${category.value.hidden==false && category.value.parentCategory==null}">
                           <c:set var="isOpen" value="${category.value.subCategories.contains(CATEGORY_ATTRIBUTE)}"/>
                           <details class="ol-module" ${isOpen ? 'open' : ''}>
                              <summary class="${isOpen ? 'is-active-summary' : ''}">
                                <span class="ol-num">${catStatus}.</span>
                                <c:set var="catStatus" value="${catStatus + 1}" />
                                <span class="ol-title">${category.value.roadMapName!=null && not empty category.value.roadMapName?category.value.roadMapName:category.value.name}</span>
                                <span class="ol-chev">›</span>
                              </summary>
                              <c:if test="${fn:length(category.value.subCategories)>0}">
                                     <ul class="ol-lessons">
                                     <c:forEach var="subCategory" items="${category.value.subCategories}">
                                                         <c:if test="${subCategory.hidden==false}">
                                                           <c:set var="isActive" value="${subCategory.equals(CATEGORY_ATTRIBUTE)}"/>
                                                                <li><a class="${isActive ? 'is-active' : ''}" href="${pageContext.request.contextPath}/${pathLanguage}java/${param.TEST_PATH}/${subCategory.pathName}">
                                                                <span class="${isActive ? 'ol-dot active' : 'ol-dot'}"></span>${subCategory.name}</a></li>
                                                         </c:if>
                                                       </c:forEach>
                                     </ul>
                              </c:if>
                           </details>
                       </c:if>
                     </c:forEach>
                    </div>
                 </aside>
                 <!-- ===== CENTER: lesson content ===== -->
                       <section class="lesson-main">
                         <jsp:include page="/WEB-INF/breadCrumbs/breadCrumbs3.jsp"/>

                         <div class="lesson-meta">
                           <span class="meta-chip meta-chip-primary">⏱ 10–15 min</span>
                          <!-- <span class="meta-chip">Beginner</span>
                           <span class="meta-chip meta-chip-success">✓ Lesson 2 of 5</span>-->
                         </div>

                         <h1 class="lesson-title">${header1}</h1>
                         <div class="lesson-div">
                           ${CATEGORY_ATTRIBUTE.article.text}
                         </div>
                            <c:set var="isVideo" value="${CATEGORY_ATTRIBUTE.videoPath!=null && not empty CATEGORY_ATTRIBUTE.videoPath}"/>
                        <c:if test="${isVideo}">
                         <section>
                             <h2><spring:message code="video.explanation"/></h2>
                             <p><spring:message code="video.explanation.subtitle"/></p>
                             <c:set var="ytId" value="${fn:substringAfter(CATEGORY_ATTRIBUTE.videoPath, 'youtu.be/')}"/>
                             <button class="lite-yt" type="button"
                                       data-yt-id="${ytId}"
                                       aria-label="<spring:message code='watch'/>: ${header1}">
                                       <img loading="lazy" src="https://i.ytimg.com/vi/${ytId}/hqdefault.jpg"
                                         alt="${header1}" />
                                       <span class="lite-yt-play" aria-hidden="true">
                                         <svg width="28" height="28" viewBox="0 0 24 24" fill="currentColor"><polygon points="6 3 20 12 6 21 6 3"/></svg>
                                       </span>
                                       <span class="lite-yt-label"><spring:message code="watch"/> · <spring:message code="video.lesson"/></span>
                                     </button>
                         </section>
                         </c:if>
                         <div class="lesson-nav">
                         <c:if test="${PREVIOUS_CATEGORY!=null}">
                                        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/<spring:message code='menu.home'/>java/${param.TEST_PATH}/${PREVIOUS_CATEGORY.pathName}">
                                          ‹ <spring:message code="previous.lesson"/>
                                        </a>
                                      </c:if>
                           <c:if test="${NEXT_CATEGORY!=null}">
                                         <a class="btn btn-primary" href="${pageContext.request.contextPath}/<spring:message code='menu.home'/>java/${param.TEST_PATH}/${NEXT_CATEGORY.pathName}">
                                           <spring:message code="next.lesson"/> ›
                                         </a>
                                        </c:if>
                         </div>
                       </section>
                       <!-- ===== RIGHT: progress & resources ===== -->
                             <aside class="lesson-side">
                               <div class="panel lesson-side-panel">
                                  <!-- <p class="lesson-side-eyebrow">Course Progress</p>
                                 <div class="bar"><span style="width:35%; background: var(--success);"></span></div>
                                 <p class="lesson-side-progress">7 of 26 modules · 35%</p>-->

                                 <c:set var="isQuestions" value="${CATEGORY_ATTRIBUTE.questionsCount!=0}"/>
                                 <c:set var="isTests" value="${CATEGORY_ATTRIBUTE.testsCount!=0}"/>
                          <c:if test="${isVideo || isQuestions || isTests}">
                                 <p class="lesson-side-eyebrow" style="margin-top:1.5rem;"><spring:message code="for.this.lesson"/></p>
                                 <ul class="lesson-side-list">
                                     <c:if test="${isQuestions}">
                                         <li><a href="${pageContext.request.contextPath}/see-questions?CATEGORY_PATH=${param.CATEGORY_PATH}&TEST_PATH=${param.TEST_PATH}" id="startQuiz"><span class="ic">?</span><spring:message code="questions"/></a></li>
                                     </c:if>
                                     <c:if test="${isTests}">
                                             <li><a href="${pageContext.request.contextPath}/start-test?CATEGORY_PATH=${param.CATEGORY_PATH}&TEST_PATH=${param.TEST_PATH}" id="startTest"><span class="ic">📝</span><spring:message code="tests"/></a></li>
                                     </c:if>
                                     <c:if test="${isVideo}">
                                            <li><a href="${CATEGORY_ATTRIBUTE.videoPath}" target="_blank" rel="noopener noreferrer"><span class="ic">▶</span><spring:message code="video.lesson"/></a></li>
                                     </c:if>
                                 </ul>
                          </c:if>
                                 <p class="lesson-side-eyebrow" style="margin-top:1.5rem;"><spring:message code="share"/></p>
                                 <div class="lesson-share">
                                   <a href="https://www.facebook.com/sharer/sharer.php?u=${canonicalUrl}" target="_blank" rel="noopener" aria-label="Facebook">f</a>
                                   <a href="https://t.me/share/url?url=${canonicalUrl}&text=${titleName}" target="_blank" rel="noopener" aria-label="Telegram">✈</a>
                                   <a href="https://x.com/intent/tweet?url=${canonicalUrl}&text=${titleName}" target="_blank" rel="noopener" aria-label="X">𝕏</a>
                                   <a href="#" aria-label="Copy link" onclick="navigator.clipboard.writeText('${canonicalUrl}');return false;">🔗</a>
                                 </div>
                               </div>
                             </aside>
      <!--  <article>
         <div class="category-article">
            <div class="author-category">
              <img src="https://img.examclouds.com/general/tatyana-milkina-small.jpg"
                   alt="Tatyana Milkina"
                   class="author-img-small"
                   width="50"
                   height="50"
                   loading="lazy"/>
              <div class="author-info">
                <span class="author-label"><spring:message code="author"/>:</span>
                <a href="${pageContext.request.contextPath}/${pathLanguage}tatyana-milkina"
                   class="author-link">Tatyana Milkina</a>
              </div>
            </div>
         </div>

         </article>

        -->
         </div>
      </main>
     <!-- <jsp:include page="/WEB-INF/comment/comments.jsp">
        <jsp:param name="referenceId" value="${CATEGORY_ATTRIBUTE.article.id}"/>
        <jsp:param name="commentType" value="ARTICLE"/>
      </jsp:include>-->
    </jsp:body>
</t:wrapper2>
