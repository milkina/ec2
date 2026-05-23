<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<t:wrapper2>
  <jsp:attribute name="header">
    <meta name="description" content="Are you keen on the Java language? Welcome to the ExamClouds, where you can find articles for Java Engineers and those who wants to become them.">
    <title>IT Blog on ExamClouds: Comprehensive Resource for Technology Insights</title>
    <link rel="canonical" href="https://www.examclouds.com/show-all-articles">
    <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/show-all-articles">
    <link rel="alternate" hreflang="en" href="https://www.examclouds.com/show-all-articles">
    <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/show-all-articles">
    <meta property="og:title" content="IT Blog on ExamClouds: Comprehensive Resource for Technology Insights">
    <meta property="og:type" content="article">
    <meta property="og:description" content="Are you keen on the Java language? Welcome to the ExamClouds, where you can find articles for Java Engineers and those who wants to become them.">
    <meta property="og:site_name" content="ExamClouds">
    <meta property="og:url" content="https://www.examclouds.com/show-all-articles">
    <meta property="twitter:title" content="IT Blog on ExamClouds: Comprehensive Resource for Technology Insights">
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:description" content="Are you keen on the Java language? Welcome to the ExamClouds, where you can find articles for Java Engineers and those who wants to become them.">
    <meta property="twitter:site" content="@ExamClouds">
    <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
    <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
    <meta property="twitter:image:alt" content="IT Blog on ExamClouds: Comprehensive Resource for Technology Insights">
  </jsp:attribute>
  <jsp:body>
    <main>
           <section class="container articles-page">
         <span class="article-tag"><spring:message code="articles"/></span>
              <h1 class="articles-title">IT Blog on ExamClouds</h1>
         <p class="articles-lede">Welcome to our page, where you'll find a comprehensive collection of materials covering various
                                       aspects of <strong>information technology</strong>. Our articles offer in-depth knowledge and practical advice on <strong>programming</strong>,
                                       <strong>network technologies</strong>, <strong>security</strong>, <strong>web application development</strong>, and many
                                       other topics. Regardless of your skill level, you are sure to find something useful and interesting. Discover the world of IT with us and continuously improve your skills and knowledge.</p>
           <div class="articles-grid">
            <c:forEach var="article" items="${ARTICLES}" varStatus="loop">
            <c:if test="${article.language.code=='en' && not empty article.text}">
             <a href="${pageContext.request.contextPath}/${article.url}" class="article-card article-card--c${(loop.index % 4) + 1}">
               <div class="article-card-cover"><span class="article-card-cat">${article.tag!= null && not empty article.tag?article.tag:"IT"}</span></div>
               <div class="article-card-body">
                  <h2>${article.title}</h2>
                  <p>${article.description}</p>
                  <div class="article-card-meta">
                      <span class="article-author">${article.author.login}</span>
                      <span class="article-date">${article.formattedDate}</span>
                  </div>
                  <c:set var="plainText" value="${fn:replace(fn:replace(fn:replace(article.text, '<', ' <'), '>', '> '), '&nbsp;', ' ')}"/>
                  <c:set var="charCount" value="${fn:length(plainText)}"/>
                  <c:set var="readMin" value="${fn:replace((charCount - (charCount mod 1500)) / 1500 + 1, '.0', '')}"/>
                  <div class="article-card-meta">
                      <span class="article-readtime">
                       <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                                  ${readMin}&nbsp;<spring:message code="min.read"/>
                       </span>
                       <span class="article-card-read"><spring:message code="show.more"/>  →</span>
                  </div>
               </div>
             </a>
             </c:if>
            </c:forEach>
          </div>
          </section>
    </main>
 </jsp:body>
</t:wrapper2>