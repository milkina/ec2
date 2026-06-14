<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<t:wrapper2>
  <jsp:attribute name="header">
    <meta name="description" content="${ARTICLE_ATTRIBUTE.description}">
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <title>${ARTICLE_ATTRIBUTE.title}</title>
    <c:set var="canonicalUrl" value="https://www.examclouds.com/${ARTICLE_ATTRIBUTE.language.code=='ru'?'ru/':''}${ARTICLE_ATTRIBUTE.url}"/>
    <link rel="canonical" href="${canonicalUrl}"/>
    <meta property="og:title" content="${ARTICLE_ATTRIBUTE.title}"/>
    <meta name="twitter:title" content="${ARTICLE_ATTRIBUTE.title}"/>
    <meta property="og:type" content="article"/>
    <meta property="og:locale" content="${ARTICLE_ATTRIBUTE.language.code=='ru'?'ru_RU':'en_US'}"/>
    <meta name="twitter:card" content="summary"/>
    <meta name="twitter:site" content="@ExamClouds">
    <c:choose>
       <c:when test="${ARTICLE_ATTRIBUTE.image != null &&  not empty ARTICLE_ATTRIBUTE.image}">
              <meta property="og:image" content="${ARTICLE_ATTRIBUTE.image}">
              <meta name="twitter:image" content="${ARTICLE_ATTRIBUTE.image}">
              <meta name="twitter:image:alt" content="${ARTICLE_ATTRIBUTE.title}">
        </c:when>
        <c:otherwise>
              <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
              <meta name="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
              <meta name="twitter:image:alt" content="<spring:message code="welcome.on"/> ExamClouds">
        </c:otherwise>
    </c:choose>
    <meta property="og:description" content="${ARTICLE_ATTRIBUTE.description}">
    <meta name="twitter:description" content="${ARTICLE_ATTRIBUTE.description}">
    <meta property="og:url" content="https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}${ARTICLE_ATTRIBUTE.url}">
    <meta property="og:site_name" content="ExamClouds">
    <c:if test="${ARTICLE_ATTRIBUTE.createdDate != null}">
      <meta property="article:published_time" content="<fmt:formatDate value="${ARTICLE_ATTRIBUTE.createdDate}" pattern="yyyy-MM-dd'T'HH:mm:ssXXX"/>">
    </c:if>
    <meta property="article:section" content="${ARTICLE_ATTRIBUTE.tag != null && not empty ARTICLE_ATTRIBUTE.tag?ARTICLE_ATTRIBUTE.tag:"IT"}">
    <meta property="article:author" content="https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}tatyana-milkina">
    <c:if test="${!ARTICLE_ATTRIBUTE.indexStatus}">
        <meta name="robots" content="noindex">
    </c:if>
    <c:set var="jsonTitle" value="${ARTICLE_ATTRIBUTE.title}"/>
    <c:set var="jsonDescription" value="${ARTICLE_ATTRIBUTE.description}"/>
    <script type="application/ld+json">{
       "@context": "https://schema.org",
       "@type": "BlogPosting",
       "mainEntityOfPage": {
         "@type": "WebPage",
         "@id": "${canonicalUrl}"
       },
       "headline": "${jsonTitle}",
       "description": "${jsonDescription}",
       "image": "${ARTICLE_ATTRIBUTE.image != null && not empty ARTICLE_ATTRIBUTE.image ? ARTICLE_ATTRIBUTE.image : 'https://img.examclouds.com/general/logo-f.png'}",
       <c:if test="${ARTICLE_ATTRIBUTE.createdDate != null}">"datePublished": "<fmt:formatDate value="${ARTICLE_ATTRIBUTE.createdDate}" pattern="yyyy-MM-dd'T'HH:mm:ssXXX"/>",</c:if>
       <c:if test="${ARTICLE_ATTRIBUTE.tag != null && not empty ARTICLE_ATTRIBUTE.tag}">"articleSection": "${ARTICLE_ATTRIBUTE.tag}",</c:if>
       "inLanguage": "${ARTICLE_ATTRIBUTE.language.code=='ru'?'ru':'en'}",
       "author": {
         "@type": "Person",
         "name": "Tatyana Milkina",
         "url": "https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}tatyana-milkina"
       },
       "publisher": {
         "@type": "Organization",
         "name": "ExamClouds",
         "logo": {
           "@type": "ImageObject",
           "url": "https://img.examclouds.com/general/logo-f.png"
         }
       }
     }</script>
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
           "name": "<spring:message code="articles"/>",
           "item": "https://www.examclouds.com<menu:articlesTag/>"
         },
         {
           "@type": "ListItem",
           "position": 3,
           "name": "${jsonTitle}",
           "item": "${canonicalUrl}"
         }
       ]
     }</script>
 </jsp:attribute>
 <jsp:body>
    <main>
       <article class="container article-page">
            <nav class="crumbs" aria-label="Breadcrumb">
              <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>"><spring:message code="home"/></a>
              <span class="sep">›</span>
              <a href="<menu:articlesTag/>"><spring:message code="articles"/></a>
              <span class="sep">›</span>
              <span class="here">${ARTICLE_ATTRIBUTE.title}</span>
            </nav>
            <div class="article-meta-top">
                    <span class="article-tag">${ARTICLE_ATTRIBUTE.tag!=null && not empty ARTICLE_ATTRIBUTE.tag?ARTICLE_ATTRIBUTE.tag:"IT"}</span>
                    <c:if test="${ARTICLE_ATTRIBUTE.createdDate != null}">
                    <span class="article-date">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                      <fmt:formatDate value="${ARTICLE_ATTRIBUTE.createdDate}" pattern="yyyy.MM.dd"/>
                    </span>
                    </c:if>
                    <span class="article-readtime">
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                      ${ARTICLE_ATTRIBUTE.minRead!=null && not empty ARTICLE_ATTRIBUTE.minRead?ARTICLE_ATTRIBUTE.minRead:"5"}&nbsp;<spring:message code="min.read"/>
                    </span>
            </div>
       <div class="article-body">
       ${ARTICLE_ATTRIBUTE.text}
       </div>
      </article>
    </main>
   <!-- <jsp:include page="/WEB-INF/comment/comments.jsp">
      <jsp:param name="referenceId" value="${ARTICLE_ATTRIBUTE.id}" />
      <jsp:param name="commentType" value="ARTICLE" />
    </jsp:include>-->
    <c:if test="${fn:contains(ARTICLE_ATTRIBUTE.text, '<pre') || fn:contains(ARTICLE_ATTRIBUTE.text, '<code')}">
       <script async src="${pageContext.request.contextPath}/js/prism.min.js?ver=1"></script>
    </c:if>
</jsp:body>
</t:wrapper2>