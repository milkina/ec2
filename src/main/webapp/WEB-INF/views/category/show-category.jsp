<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:wrapper2>
    <jsp:attribute name="header">
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
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
    <c:set var="origUri" value="${requestScope['javax.servlet.forward.request_uri'] != null ? requestScope['javax.servlet.forward.request_uri'] : pageContext.request.requestURI}"/>
    <c:if test="${TESTS[param.TEST_PATH].language.code=='ru' && !fn:contains(origUri, '/ru/')}">
        <meta name="robots" content="noindex, follow">
    </c:if>
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
      <!-- Mobile sticky context bar -->
      <c:set var="stickyModuleName" value=""/>
      <c:set var="stickyLessonNum" value="0"/>
      <c:set var="stickyLessonTotal" value="0"/>
      <c:forEach var="cat" items="${TESTS[param.TEST_PATH].categories}">
        <c:if test="${cat.value.hidden==false && cat.value.parentCategory==null && cat.value.subCategories.contains(CATEGORY_ATTRIBUTE)}">
          <c:set var="stickyModuleName" value="${cat.value.roadMapName!=null && not empty cat.value.roadMapName ? cat.value.roadMapName : cat.value.name}"/>
          <c:set var="idx" value="0"/>
          <c:forEach var="sub" items="${cat.value.subCategories}">
            <c:if test="${sub.hidden==false}">
              <c:set var="idx" value="${idx + 1}"/>
              <c:if test="${sub.equals(CATEGORY_ATTRIBUTE)}"><c:set var="stickyLessonNum" value="${idx}"/></c:if>
            </c:if>
          </c:forEach>
          <c:set var="stickyLessonTotal" value="${idx}"/>
        </c:if>
      </c:forEach>
      <c:set var="stickyPct" value="${stickyLessonTotal > 0 ? (stickyLessonNum * 100 / stickyLessonTotal) : 0}"/>
      <div class="mobile-sticky-bar">
        <div class="msb-text">
          <span class="msb-module">${stickyModuleName}</span>
          <span class="msb-sep">·</span>
          <span class="msb-lesson"><spring:message code="lesson"/>&nbsp;${stickyLessonNum}/${stickyLessonTotal}</span>
        </div>
        <span class="msb-pct"><fmt:formatNumber value="${stickyPct}" maxFractionDigits="0"/>%</span>
        <div class="msb-progress"><span style="width:${stickyPct}%"></span></div>
      </div>
      <main class="lesson-bg">
        <div class="container lesson-grid">
           <!-- ===== LEFT: sticky course outline ===== -->
                 <aside class="lesson-outline">
                   <div class="panel lesson-outline-panel">
                     <jsp:include page="/WEB-INF/views/category/_outline-modules.jsp"/>
                    </div>
                    <script>document.addEventListener('DOMContentLoaded',function(){var a=document.querySelector('.lesson-outline .is-active-summary');if(a){a.scrollIntoView({block:'center',behavior:'instant'});}});</script>
                 </aside>
                 <!-- ===== CENTER: lesson content ===== -->
                       <section class="lesson-main">
                         <button class="outline-drawer-toggle" aria-expanded="false" onclick="document.querySelector('.outline-drawer').classList.add('is-open');document.querySelector('.outline-drawer-backdrop').classList.add('is-open');this.setAttribute('aria-expanded','true');">
                           <span class="odt-icon">☰</span> <spring:message code="course.content"/>
                           <span class="odt-chev">▾</span>
                         </button>
                         <jsp:include page="/WEB-INF/breadCrumbs/breadCrumbs3.jsp"/>

                         <div class="lesson-meta">
                           <span class="meta-chip meta-chip-primary">⏱ ${CATEGORY_ATTRIBUTE.article.minRead!=null && not empty CATEGORY_ATTRIBUTE.article.minRead?CATEGORY_ATTRIBUTE.article.minRead:"5"}&nbsp;<spring:message code="min.read"/>
                                </span>
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
                                        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/${pathLanguage}java/${param.TEST_PATH}/${PREVIOUS_CATEGORY.pathName}">
                                          ‹ <spring:message code="previous.lesson"/>
                                        </a>
                                      </c:if>
                           <c:if test="${NEXT_CATEGORY!=null}">
                                         <a class="btn btn-primary" href="${pageContext.request.contextPath}/${pathLanguage}java/${param.TEST_PATH}/${NEXT_CATEGORY.pathName}">
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
                                         <li><a href="${pageContext.request.contextPath}/see-questions/${TESTS[param.TEST_PATH].pathName}/${CATEGORY_ATTRIBUTE.pathName}" id="startQuiz" rel="nofollow"><span class="ic">?</span><spring:message code="questions"/></a></li>
                                     </c:if>
                                     <c:if test="${isTests}">
                                             <li><a href="${pageContext.request.contextPath}/${pathLanguage}start-test/${TESTS[param.TEST_PATH].pathName}/${CATEGORY_ATTRIBUTE.pathName}" id="startTest" rel="nofollow"><span class="ic">📝</span><spring:message code="tests"/></a></li>
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

                               <jsp:include page="/WEB-INF/author/author-mini-card.jsp"/>
                               <c:if test="${currentLang=='ru'}">
                                     <jsp:include page="/WEB-INF/promo/udemy-promo.jsp"/>
                               </c:if>
                             </aside>
         </div>
      </main>
      <!-- Mobile outline drawer -->
      <script>
        function closeOutlineDrawer(){
          var d=document.querySelector('.outline-drawer');
          var b=document.querySelector('.outline-drawer-backdrop');
          var t=document.querySelector('.outline-drawer-toggle');
          if(d) d.classList.remove('is-open');
          if(b) b.classList.remove('is-open');
          if(t) t.setAttribute('aria-expanded','false');
        }
        document.addEventListener('keydown',function(e){if(e.key==='Escape') closeOutlineDrawer();});
      </script>
      <div class="outline-drawer-backdrop" onclick="closeOutlineDrawer();"></div>
      <div class="outline-drawer" role="dialog" aria-modal="true" aria-label="<spring:message code='course.content'/>">
        <div class="outline-drawer-handle"></div>
        <button type="button" class="outline-drawer-close" aria-label="<spring:message code='close'/>" onclick="closeOutlineDrawer();">&times;</button>
        <jsp:include page="/WEB-INF/views/category/_outline-modules.jsp"/>
      </div>
      <!-- Mobile fixed bottom nav -->
      <div class="mobile-bottom-nav">
        <c:choose>
          <c:when test="${PREVIOUS_CATEGORY!=null}">
            <a class="mbn-btn mbn-prev" href="${pageContext.request.contextPath}/${pathLanguage}java/${param.TEST_PATH}/${PREVIOUS_CATEGORY.pathName}">‹ <spring:message code="previous.lesson"/></a>
          </c:when>
          <c:otherwise><span class="mbn-btn mbn-prev mbn-disabled"></span></c:otherwise>
        </c:choose>
        <c:choose>
          <c:when test="${NEXT_CATEGORY!=null}">
            <a class="mbn-btn mbn-next" href="${pageContext.request.contextPath}/${pathLanguage}java/${param.TEST_PATH}/${NEXT_CATEGORY.pathName}"><spring:message code="next.lesson"/> ›</a>
          </c:when>
          <c:otherwise><span class="mbn-btn mbn-next mbn-disabled"></span></c:otherwise>
        </c:choose>
      </div>
     <!-- <jsp:include page="/WEB-INF/comment/comments.jsp">
        <jsp:param name="referenceId" value="${CATEGORY_ATTRIBUTE.article.id}"/>
        <jsp:param name="commentType" value="ARTICLE"/>
      </jsp:include>-->
      <script async src="${pageContext.request.contextPath}/js/prism.min.js?ver=1"></script>
    </jsp:body>
</t:wrapper2>
