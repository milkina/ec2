<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- Blog sections by article.tag: «Java» / «Oracle Certification» / «Web Service» — own Java articles, everything else — «Other articles». --%>
<c:set var="pageTitle" value="Java Blog: Articles for Beginner Developers | ExamClouds"/>
<c:set var="pageDescription" value="Articles for Java developers: which Oracle Java certification to take in 2026, a code style checklist before you submit code, plus other IT topics."/>
<c:set var="blogUrl" value="https://www.examclouds.com/show-all-articles"/>
<t:wrapper2>
  <jsp:attribute name="header">
    <meta name="description" content="${pageDescription}">
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <title>${pageTitle}</title>
    <link rel="canonical" href="${blogUrl}">
    <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/show-all-articles">
    <link rel="alternate" hreflang="en" href="https://www.examclouds.com/show-all-articles">
    <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/show-all-articles">
    <meta property="og:title" content="${pageTitle}">
    <meta property="og:type" content="website">
    <meta property="og:description" content="${pageDescription}">
    <meta property="og:site_name" content="ExamClouds">
    <meta property="og:url" content="${blogUrl}">
    <meta property="og:image" content="https://img.examclouds.com/general/og-home-en.png">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta name="twitter:title" content="${pageTitle}">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:description" content="${pageDescription}">
    <meta name="twitter:site" content="@ExamClouds">
    <meta name="twitter:image" content="https://img.examclouds.com/general/og-home-en.png">
    <meta name="twitter:image:alt" content="${pageTitle}">
    <script type="application/ld+json">{
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": "Java Blog",
      "description": "${pageDescription}",
      "url": "${blogUrl}",
      "inLanguage": "en",
      "isPartOf": {"@type": "WebSite", "name": "ExamClouds", "url": "https://www.examclouds.com/"},
      "publisher": {"@type": "Organization", "name": "ExamClouds", "url": "https://www.examclouds.com"},
      "mainEntity": {
        "@type": "ItemList",
        "itemListElement": [
          <c:set var="pos" value="0"/>
          <c:forEach var="article" items="${ARTICLES}">
            <c:if test="${article.language.code=='en' && not empty article.text && article.indexStatus}">
              <c:set var="pos" value="${pos + 1}"/>
              <c:if test="${pos > 1}">,</c:if>{"@type": "ListItem", "position": ${pos}, "url": "https://www.examclouds.com/${article.url}", "name": "${fn:replace(article.title, '"', '')}"}
            </c:if>
          </c:forEach>
        ]
      }
    }</script>
  </jsp:attribute>
  <jsp:body>
    <main>
       <section class="container articles-page">
         <nav class="crumbs" aria-label="Breadcrumb">
           <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>"><spring:message code="home"/></a>
           <span class="sep">›</span>
           <span class="here"><spring:message code="articles"/></span>
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
                 "item": "${blogUrl}"
               }
             ]
           }</script>
         </nav>
         <h1 class="articles-title">Java Blog</h1>
         <p class="articles-lede">Articles that go alongside the <a href="${pageContext.request.contextPath}/java-core">Java Core lessons</a>: which Oracle Java certification exam to take in 2026 and a code style checklist to run before you submit code. To learn Java step by step, start with the <a href="${pageContext.request.contextPath}/">free Java course</a>, practice with <a href="${pageContext.request.contextPath}/practical-java-tasks">practical tasks</a> and check yourself with <a href="${pageContext.request.contextPath}/tests">tests</a>.</p>

         <%-- Java and Oracle certification --%>
         <h2 class="articles-section-title" id="java">Java and Oracle certification</h2>
         <div class="articles-grid">
           <c:set var="cardIndex" value="0"/>
           <c:forEach var="article" items="${ARTICLES}">
             <c:if test="${article.language.code=='en' && not empty article.text && (article.tag=='Java' || article.tag=='Oracle Certification' || article.tag=='Web Service')}">
               <t:article-card article="${article}" href="${pageContext.request.contextPath}/${article.url}" index="${cardIndex}" authorName="Tatyana Milkina" datePattern="yyyy-MM-dd"/>
               <c:set var="cardIndex" value="${cardIndex + 1}"/>
             </c:if>
           </c:forEach>
         </div>

         <%-- Other articles --%>
         <h2 class="articles-section-title" id="other">Other articles</h2>
         <div class="articles-grid">
           <c:forEach var="article" items="${ARTICLES}">
             <c:if test="${article.language.code=='en' && not empty article.text && article.tag!='Java' && article.tag!='Oracle Certification' && article.tag!='Web Service'}">
               <t:article-card article="${article}" href="${pageContext.request.contextPath}/${article.url}" index="${cardIndex}" datePattern="yyyy-MM-dd"/>
               <c:set var="cardIndex" value="${cardIndex + 1}"/>
             </c:if>
           </c:forEach>
         </div>
       </section>
    </main>
 </jsp:body>
</t:wrapper2>
