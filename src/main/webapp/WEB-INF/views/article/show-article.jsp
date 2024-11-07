<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<t:wrapper>
  <jsp:attribute name="language">lang="${ARTICLE_ATTRIBUTE.language.code}"</jsp:attribute>
  <jsp:attribute name="header">
    <meta charset="UTF-8">
    <meta name="keywords" content="${ARTICLE_ATTRIBUTE.keywords}">
    <meta name="description" content="${ARTICLE_ATTRIBUTE.description}">
    <title>${ARTICLE_ATTRIBUTE.title}</title>
    <link rel="canonical" href="https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}${ARTICLE_ATTRIBUTE.url}"/>
    <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/${ARTICLE_ATTRIBUTE.url}">
    <link rel="alternate" hreflang="en" href="https://www.examclouds.com/${ARTICLE_ATTRIBUTE.url}">
    <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/${ARTICLE_ATTRIBUTE.url}">
    <meta property="og:title" content="${ARTICLE_ATTRIBUTE.title}"/>
    <meta property="twitter:title" content="${ARTICLE_ATTRIBUTE.title}"/>
    <meta property="og:type" content="article"/>
    <meta property="twitter:card" content="summary"/>
    <meta property="twitter:site" content="@ExamClouds">
    <c:choose>
       <c:when test="${ARTICLE_ATTRIBUTE.image != null &&  not empty ARTICLE_ATTRIBUTE.image}">
              <meta property="og:image" content="https://www.examclouds.com/${ARTICLE_ATTRIBUTE.image}">
              <meta property="twitter:image" content="${ARTICLE_ATTRIBUTE.image}">
              <meta property="twitter:image:alt" content="${ARTICLE_ATTRIBUTE.title}">
        </c:when>
        <c:otherwise>
              <meta property="og:image" content="https://www.examclouds.com/images/general/logo.svg">
              <meta property="twitter:image" content="https://www.examclouds.com/images/general/logo.svg">
              <meta property="twitter:image:alt" content="<spring:message code="welcome.on"/> ExamClouds">
        </c:otherwise>
    </c:choose>
    <meta property="og:description" content="${ARTICLE_ATTRIBUTE.description}">
    <meta property="twitter:description" content="${ARTICLE_ATTRIBUTE.description}">
    <meta property="og:url" content="https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}${ARTICLE_ATTRIBUTE.url}">
    <meta property="og:site_name" content="ExamClouds">
    <script async src="${pageContext.request.contextPath}/js/prism.min.js?ver=1"></script>
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
    <div class="breadCrumbs">
      <ol>
        <li>
          <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>">
               <span><spring:message code="home"/></span></a>
        </li>
        <li>
           <span><a href="<menu:articlesTag/>"><spring:message code="articles"/>
           </a></span>
        </li>
        <li>${ARTICLE_ATTRIBUTE.title}</li>
       </ol>
     </div>
    <main>
      <article>
       <c:if test="${ARTICLE_ATTRIBUTE.image != null &&  not empty ARTICLE_ATTRIBUTE.image}">
          <img class="categoryImage" src="${ARTICLE_ATTRIBUTE.image}"
             alt="${ARTICLE_ATTRIBUTE.title}" title="${ARTICLE_ATTRIBUTE.title}" width="280" height="200">
       </c:if>
       <div class="article-desc">
       ${ARTICLE_ATTRIBUTE.text}
       </div>
      </article>
    </main>
    <%@ include file="/WEB-INF/socialButtons.jsp" %>
    <jsp:include page="/WEB-INF/comment/comments.jsp">
      <jsp:param name="referenceId" value="${ARTICLE_ATTRIBUTE.id}" />
      <jsp:param name="commentType" value="ARTICLE" />
    </jsp:include>
</jsp:body>
</t:wrapper>