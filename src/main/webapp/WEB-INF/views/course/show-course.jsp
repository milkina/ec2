<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:wrapper>
 <jsp:attribute name="header">
     <meta name="keywords" content="${TESTS[param.TEST_PATH].article.keywords}">
     <meta name="description" content="${TESTS[param.TEST_PATH].article.description}">
     <title>${TESTS[param.TEST_PATH].article.title}</title>
     <link rel="canonical" href="https://www.examclouds.com/${TESTS[param.TEST_PATH].language.code=='ru'?'ru/':''}${TESTS[param.TEST_PATH].fullPathName}">
     <meta property="og:title" content="${TESTS[param.TEST_PATH].article.title}"/>
     <meta property="og:type" content="article"/>
     <meta property="og:description" content="${TESTS[param.TEST_PATH].article.description}"/>
     <meta property="og:site_name" content="ExamClouds">
     <meta property="og:url" content="https://www.examclouds.com/${TESTS[param.TEST_PATH].language.code=='ru'?'ru/':''}${TESTS[param.TEST_PATH].fullPathName}">
     <meta property="og:image" content="https://www.examclouds.com/images/general/logo.svg"/>
     <meta property="twitter:image" content="https://www.examclouds.com/images/general/logo.svg"/>
     <meta property="twitter:title" content="${TESTS[param.TEST_PATH].article.title}"/>
     <meta property="twitter:card" content="summary"/>
     <meta property="twitter:description" content="${TESTS[param.TEST_PATH].article.description}"/>
     <meta property="twitter:site" content="@ExamClouds">

     <style>
      <c:if test="${TESTS[param.TEST_PATH].article.image!=null && not empty TESTS[param.TEST_PATH].article.image}">
         .show-course-header:before{
           background: url('${pageContext.request.contextPath}${TESTS[param.TEST_PATH].article.image}') no-repeat;
           width: 164px
         }
      </c:if>
      .category-href:before{
        content:"<spring:message code="lesson"/> " counter(lesson)" - ";
      }
     </style>
 </jsp:attribute>
 <jsp:body>
    <div class="breadCrumbs">
      <ol itemscope itemtype="https://schema.org/BreadcrumbList">
        <%@ include file="/WEB-INF/breadCrumbs/homeBreadCrumb.jsp"%>
        <li>${TESTS[param.TEST_PATH].name}</li>
      </ol>
    </div>
    <main><article>
      <h1 class="show-course-header">${TESTS[param.TEST_PATH].name}</h1>
      <div class="course-desc">${TESTS[param.TEST_PATH].article.text}</div>
      <jsp:include page="/WEB-INF/views/category/category-menu-center.jsp"/>
    </article></main>
    <%@ include file="/WEB-INF/socialButtons.jsp"%>
    <jsp:include page="/WEB-INF/comment/comments.jsp">
       <jsp:param name="referenceId" value="${TESTS[param.TEST_PATH].id}"/>
       <jsp:param name="commentType" value="TEST"/>
    </jsp:include>
 </jsp:body>
</t:wrapper>