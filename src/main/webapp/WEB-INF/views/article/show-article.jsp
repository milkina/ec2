<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<t:wrapper2>
  <jsp:attribute name="header">
    <meta name="description" content="${ARTICLE_ATTRIBUTE.description}">
    <title>${ARTICLE_ATTRIBUTE.title}</title>
    <c:set var="canonicalUrl" value="https://www.examclouds.com/${ARTICLE_ATTRIBUTE.language.code=='ru'?'ru/':''}${ARTICLE_ATTRIBUTE.url}"/>
    <link rel="canonical" href="${canonicalUrl}"/>
    <link rel="alternate" hreflang="x-default" href="${canonicalUrl}">
    <c:if test="${pageLanguage=='ru'}">
       <link rel="alternate" hreflang="ru" href="${canonicalUrl}">
    </c:if>
    <c:if test="${pageLanguage!='ru'}">
       <link rel="alternate" hreflang="en" href="${canonicalUrl}">
    </c:if>
    <meta property="og:title" content="${ARTICLE_ATTRIBUTE.title}"/>
    <meta property="twitter:title" content="${ARTICLE_ATTRIBUTE.title}"/>
    <meta property="og:type" content="article"/>
    <meta property="twitter:card" content="summary"/>
    <meta property="twitter:site" content="@ExamClouds">
    <c:choose>
       <c:when test="${ARTICLE_ATTRIBUTE.image != null &&  not empty ARTICLE_ATTRIBUTE.image}">
              <meta property="og:image" content="${ARTICLE_ATTRIBUTE.image}">
              <meta property="twitter:image" content="${ARTICLE_ATTRIBUTE.image}">
              <meta property="twitter:image:alt" content="${ARTICLE_ATTRIBUTE.title}">
        </c:when>
        <c:otherwise>
              <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
              <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
              <meta property="twitter:image:alt" content="<spring:message code="welcome.on"/> ExamClouds">
        </c:otherwise>
    </c:choose>
    <meta property="og:description" content="${ARTICLE_ATTRIBUTE.description}">
    <meta property="twitter:description" content="${ARTICLE_ATTRIBUTE.description}">
    <meta property="og:url" content="https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}${ARTICLE_ATTRIBUTE.url}">
    <meta property="og:site_name" content="ExamClouds">
    <c:if test="${!ARTICLE_ATTRIBUTE.indexStatus}">
        <meta name="robots" content="noindex">
    </c:if>
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
         }
       ]
     }</script>
 </jsp:attribute>
 <jsp:body>
    <main>
       <article class="container article-page">
            <a href="<menu:articlesTag/>" class="article-back">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"/></svg>
              <spring:message code="articles"/>
            </a>
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
                      ${ARTICLE_ATTRIBUTE.minRead!=null?ARTICLE_ATTRIBUTE.minRead:"5"} <spring:message code="min.read"/>
                    </span>
            </div>
       <c:if test="${ARTICLE_ATTRIBUTE.image != null &&  not empty ARTICLE_ATTRIBUTE.image}">
          <img class="categoryImage" src="${ARTICLE_ATTRIBUTE.image}"
             alt="${ARTICLE_ATTRIBUTE.title}" title="${ARTICLE_ATTRIBUTE.title}" width="280" height="200">
       </c:if>
       <div class="article-body">
       ${ARTICLE_ATTRIBUTE.text}
       </div>
      </article>
    </main>
   <!-- <jsp:include page="/WEB-INF/comment/comments.jsp">
      <jsp:param name="referenceId" value="${ARTICLE_ATTRIBUTE.id}" />
      <jsp:param name="commentType" value="ARTICLE" />
    </jsp:include>-->
    <script async src="${pageContext.request.contextPath}/js/prism.min.js?ver=1"></script>
</jsp:body>
</t:wrapper2>