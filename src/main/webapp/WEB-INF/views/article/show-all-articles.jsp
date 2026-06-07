<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:wrapper2>
  <jsp:attribute name="header">
    <meta name="description" content="Вам нравится язык программирования Java? На сайте ExamClouds вы найдете интересные и полезные статьями по Java программировании и из сферы IT.">
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <title>Блог из IT сферы на ExamClouds</title>
    <link rel="canonical" href="https://www.examclouds.com/ru/show-all-articles">
    <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/show-all-articles">
    <link rel="alternate" hreflang="en" href="https://www.examclouds.com/show-all-articles">
    <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/show-all-articles">
    <meta property="og:title" content="Блог из IT сферы на ExamClouds">
    <meta property="og:type" content="article">
    <meta property="og:description" content="Вам нравится язык программирования Java? На сайте ExamClouds вы найдете интересные и полезные статьями по Java программировании и из сферы IT.">
    <meta property="og:site_name" content="ExamClouds">
    <meta property="og:url" content="https://www.examclouds.com/ru/show-all-articles">
    <meta property="twitter:title" content="Блог из IT сферы на ExamClouds">
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:description" content="Вам нравится язык программирования Java? На сайте ExamClouds вы найдете интересные и полезные статьями по Java программировании и из сферы IT.">
    <meta property="twitter:site" content="@ExamClouds">
    <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
    <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
    <meta property="twitter:image:alt" content="Блог из IT сферы на ExamClouds">
  </jsp:attribute>
  <jsp:body>
    <main>
       <section class="container articles-page">
     <span class="article-tag"><spring:message code="articles"/></span>
          <h1 class="articles-title">Блог из IT сферы</h1>
     <p class="articles-lede">Добро пожаловать на нашу страницу, на которой вы найдёте обширную подборку материалов, охватывающих самые разные
     аспекты информационных технологий. Наши статьи предлагают глубокие знания и практические советы по <strong>программированию</strong>,
     <strong>сетевым технологиям</strong>, <strong>безопасности</strong>, развитию <strong>веб-приложений</strong> и многим другим
     темам. Независимо от вашего уровня подготовки, вы обязательно найдёте что-то полезное и интересное. Откройте для себя мир IT
     с нами и постоянно улучшайте свои навыки и знания.</p>
       <div class="articles-grid">
        <c:forEach var="article" items="${ARTICLES}" varStatus="loop">
        <c:if test="${article.language.code=='ru' && not empty article.text}">
         <a href="${pageContext.request.contextPath}/ru/${article.url}" class="article-card article-card--c${(loop.index % 4) + 1}">
           <div class="article-card-cover"><span class="article-card-cat">${article.tag!= null && not empty article.tag?article.tag:"IT"}</span></div>
           <div class="article-card-body">
              <h2>${article.title}</h2>
              <p>${article.description}</p>
              <div class="article-card-meta">
                  <span class="article-author">${article.author.login}</span>
                  <span class="article-date">${article.formattedDate}</span>
              </div>
              <div class="article-card-meta">
                  <span class="article-readtime">
                   <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                       ${article.minRead!=null && not empty article.minRead?article.minRead:5}&nbsp;<spring:message code="min.read"/>
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