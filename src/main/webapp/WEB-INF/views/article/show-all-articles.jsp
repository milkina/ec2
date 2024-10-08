<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:wrapper>
  <jsp:attribute name="header">
    <meta charset="UTF-8">
    <meta name="description" content="Вам нравится язык программирования Java? На сайте ExamClouds вы найдете интересные и полезные статьями по Java программировании и из сферы IT.">
    <title>Статьи из IT сферы на ExamClouds</title>
    <link rel="canonical" href="https://www.examclouds.com/ru/show-all-articles">
    <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/show-all-articles">
    <link rel="alternate" hreflang="en" href="https://www.examclouds.com/show-all-articles">
    <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/show-all-articles">
    <meta property="og:title" content="Статьи из IT сферы на ExamClouds">
    <meta property="og:type" content="article">
    <meta property="og:description" content="Вам нравится язык программирования Java? На сайте ExamClouds вы найдете интересные и полезные статьями по Java программировании и из сферы IT.">
    <meta property="og:site_name" content="ExamClouds">
    <meta property="og:url" content="https://www.examclouds.com/ru/show-all-articles">
    <meta property="twitter:title" content="Статьи из IT сферы на ExamClouds">
    <meta property="twitter:card" content="summary">
    <meta property="twitter:description" content="Вам нравится язык программирования Java? На сайте ExamClouds вы найдете интересные и полезные статьями по Java программировании и из сферы IT.">
    <meta property="twitter:site" content="@ExamClouds">
    <meta property="og:image" content="https://www.examclouds.com/images/general/logo.svg">
    <meta property="twitter:image" content="https://www.examclouds.com/images/general/logo.svg">
    <meta property="twitter:image:alt" content="Статьи из IT сферы на ExamClouds">
  </jsp:attribute>
  <jsp:body>
    <main>
     <%@ include file="/WEB-INF/breadCrumbs/publicationsBreadCrumbs2.jsp"%>
     <h1 class="article-head">Статьи из IT сферы</h1>
     <p class="index-items-text">Добро пожаловать на нашу страницу, на которой вы найдёте обширную подборку материалов, охватывающих самые разные
     аспекты информационных технологий. Наши статьи предлагают глубокие знания и практические советы по <strong>программированию</strong>,
     <strong>сетевым технологиям</strong>, <strong>безопасности</strong>, развитию <strong>веб-приложений</strong> и многим другим
     темам. Независимо от вашего уровня подготовки, вы обязательно найдёте что-то полезное и интересное. Откройте для себя мир IT
     с нами и постоянно улучшайте свои навыки и знания.</p>
      <ul class="article-list">
        <c:forEach var="article" items="${ARTICLES}">
        <c:if test="${article.language.code=='ru'}">
         <li>
           <div class="row article-head-date">
             <h2 class="article-head col-xs-12 col-sm-9">${article.title}</h2>
             <div class="col-xs-12 col-sm-3 article-date">${article.formattedDate}</div>
           </div>
           <div class="article-author">${article.author.login}</div>
           <div class="article-desc">${article.description}</div>
           <a href="${pageContext.request.contextPath}/ru/${article.url}" class="article-url"><spring:message code="read.more"/></a>
         </li>
         </c:if>
        </c:forEach>
      </ul>
    </main>
 </jsp:body>
</t:wrapper>