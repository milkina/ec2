<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:wrapper>
  <jsp:attribute name="header">
    <meta charset="UTF-8">
    <meta name="description" content="Are you keen on the Java language? Welcome to the ExamClouds, where you can find articles for Java Engineers and those who wants to become them.">
    <title>IT Articles on ExamClouds: Comprehensive Resource for Technology Insights</title>
    <link rel="canonical" href="https://www.examclouds.com/show-all-articles">
    <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/show-all-articles">
    <link rel="alternate" hreflang="en" href="https://www.examclouds.com/show-all-articles">
    <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/show-all-articles">
    <meta property="og:title" content="IT Articles on ExamClouds: Comprehensive Resource for Technology Insights">
    <meta property="og:type" content="article">
    <meta property="og:description" content="Are you keen on the Java language? Welcome to the ExamClouds, where you can find articles for Java Engineers and those who wants to become them.">
    <meta property="og:site_name" content="ExamClouds">
    <meta property="og:url" content="https://www.examclouds.com/show-all-articles">
    <meta property="twitter:title" content="IT Articles on ExamClouds: Comprehensive Resource for Technology Insights">
    <meta property="twitter:card" content="summary">
    <meta property="twitter:description" content="Are you keen on the Java language? Welcome to the ExamClouds, where you can find articles for Java Engineers and those who wants to become them.">
    <meta property="twitter:site" content="@ExamClouds">
    <meta property="og:image" content="https://www.examclouds.com/images/general/logo.svg">
    <meta property="twitter:image" content="https://www.examclouds.com/images/general/logo.svg">
    <meta property="twitter:image:alt" content="IT Articles on ExamClouds: Comprehensive Resource for Technology Insights">
  </jsp:attribute>
  <jsp:body>
    <main>
     <%@ include file="/WEB-INF/breadCrumbs/publicationsBreadCrumbs2.jsp"%>
     <h1 class="article-head">IT Articles on ExamClouds</h1>
     <p class="index-items-text">Welcome to our page, where you'll find a comprehensive collection of materials covering various
     aspects of <strong>information technology</strong>. Our articles offer in-depth knowledge and practical advice on <strong>programming</strong>,
     <strong>network technologies</strong>, <strong>security</strong>, <strong>web application development</strong>, and many
     other topics. Regardless of your skill level, you are sure to find something useful and interesting. Discover the world of IT with us and continuously improve your skills and knowledge.</p>
      <ul class="article-list">
        <c:forEach var="article" items="${ARTICLES}">
        <c:if test="${article.language.code=='en'}">
         <li>
           <div class="row article-head-date">
             <h2 class="article-head col-xs-12 col-sm-9">${article.title}</h2>
             <div class="col-xs-12 col-sm-3 article-date">${article.formattedDate}</div>
           </div>
           <div class="article-author">${article.author.login}</div>
           <div class="article-desc">${article.description}</div>
           <a href="${pageContext.request.contextPath}/${article.url}" class="article-url"><spring:message code="read.more"/></a>
         </li>
         </c:if>
        </c:forEach>
      </ul>
    </main>
 </jsp:body>
</t:wrapper>