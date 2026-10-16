<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- Разделы блога по тегу статьи (article.tag): «Java» / «Java Core» — свои статьи о Java, «Карьера» — карьера в IT, остальное — «Другие статьи». --%>
<c:set var="pageTitle" value="Блог о Java: статьи для начинающих разработчиков | ExamClouds"/>
<c:set var="pageDescription" value="Статьи о Java для начинающих: ошибки в реальных проектах, стиль кода, книги и ресурсы. Плюс карьера в IT: зарплаты, стажировки, первый проект."/>
<c:set var="blogUrl" value="https://www.examclouds.com/ru/show-all-articles"/>
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
    <meta property="og:image" content="https://img.examclouds.com/general/og-home-ru.png">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta name="twitter:title" content="${pageTitle}">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:description" content="${pageDescription}">
    <meta name="twitter:site" content="@ExamClouds">
    <meta name="twitter:image" content="https://img.examclouds.com/general/og-home-ru.png">
    <meta name="twitter:image:alt" content="${pageTitle}">
    <script type="application/ld+json">{
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": "Блог о Java и карьере в IT",
      "description": "${pageDescription}",
      "url": "${blogUrl}",
      "inLanguage": "ru",
      "isPartOf": {"@type": "WebSite", "name": "ExamClouds", "url": "https://www.examclouds.com/ru/"},
      "publisher": {"@type": "Organization", "name": "ExamClouds", "url": "https://www.examclouds.com"},
      "mainEntity": {
        "@type": "ItemList",
        "itemListElement": [
          <c:set var="pos" value="0"/>
          <c:forEach var="article" items="${ARTICLES}">
            <c:if test="${article.language.code=='ru' && not empty article.text && article.indexStatus}">
              <c:set var="pos" value="${pos + 1}"/>
              <c:if test="${pos > 1}">,</c:if>{"@type": "ListItem", "position": ${pos}, "url": "https://www.examclouds.com/ru/${article.url}", "name": "${fn:replace(article.title, '"', '')}"}
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
         <h1 class="articles-title">Блог о Java и карьере в IT</h1>
         <p class="articles-lede">Статьи, которые дополняют <a href="${pageContext.request.contextPath}/ru/java-core-russian">уроки Java Core</a>: почему программа работает в IntelliJ IDEA, но падает на сервере, как оформлять код, какие книги читать и сколько зарабатывают Java-разработчики. Чтобы учить Java по порядку, начните с <a href="${pageContext.request.contextPath}/ru/">бесплатного курса</a>, закрепляйте знания на <a href="${pageContext.request.contextPath}/ru/practicheskie-zadachi">практических задачах</a> и проверяйте себя <a href="${pageContext.request.contextPath}/ru/tests">тестами</a>.</p>

         <%-- Java и программирование --%>
         <h2 class="articles-section-title" id="java">Java и программирование</h2>
         <div class="articles-grid">
           <c:set var="cardIndex" value="0"/>
           <c:forEach var="article" items="${ARTICLES}">
             <c:if test="${article.language.code=='ru' && not empty article.text && (article.tag=='Java' || article.tag=='Java Core')}">
               <t:article-card article="${article}" href="${pageContext.request.contextPath}/ru/${article.url}" index="${cardIndex}" authorName="Татьяна Милькина" datePattern="dd.MM.yyyy"/>
               <c:set var="cardIndex" value="${cardIndex + 1}"/>
             </c:if>
           </c:forEach>
         </div>

         <%-- Карьера в IT --%>
         <h2 class="articles-section-title" id="career">Карьера в IT</h2>
         <div class="articles-grid">
           <c:forEach var="article" items="${ARTICLES}">
             <c:if test="${article.language.code=='ru' && not empty article.text && article.tag=='Карьера'}">
               <t:article-card article="${article}" href="${pageContext.request.contextPath}/ru/${article.url}" index="${cardIndex}" datePattern="dd.MM.yyyy"/>
               <c:set var="cardIndex" value="${cardIndex + 1}"/>
             </c:if>
           </c:forEach>
         </div>

         <%-- Остальные статьи --%>
         <h2 class="articles-section-title" id="other">Другие статьи</h2>
         <div class="articles-grid">
           <c:forEach var="article" items="${ARTICLES}">
             <c:if test="${article.language.code=='ru' && not empty article.text && article.tag!='Java' && article.tag!='Java Core' && article.tag!='Карьера'}">
               <t:article-card article="${article}" href="${pageContext.request.contextPath}/ru/${article.url}" index="${cardIndex}" datePattern="dd.MM.yyyy"/>
               <c:set var="cardIndex" value="${cardIndex + 1}"/>
             </c:if>
           </c:forEach>
         </div>
       </section>
    </main>
 </jsp:body>
</t:wrapper2>
