<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:wrapper>
 <jsp:attribute name="header">
     <meta charset="UTF-8">
     <meta name="description" content="${TESTS[param.TEST_PATH].article.description}">
     <title>${TESTS[param.TEST_PATH].article.title}</title>
     <c:set var="canonicalUrl" value="https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}${TESTS[param.TEST_PATH].fullPathName}"/>
     <link rel="canonical" href="${canonicalUrl}">
     <c:set var="currentLang" value="${TESTS[param.TEST_PATH].language.code}"/>
        <c:set var="ruHref" value="${currentLang=='ru' ? canonicalUrl : null}"/>
        <c:set var="enHref" value="${currentLang=='en' ? canonicalUrl : null}"/>
        <link rel="alternate" hreflang="${currentLang}" href="${canonicalUrl}">
        <c:forEach var="alt" items="${TESTS[param.TEST_PATH].canonicalUrls}">
            <c:if test="${alt.value != null && alt.value.url != null}">
                <c:set var="altPathLanguage" value="${alt.value.language.code=='ru' ? '/ru' : ''}"/>
                <c:set var="altHref" value="https://www.examclouds.com${altPathLanguage}${alt.value.url}"/>
                <link rel="alternate" hreflang="${alt.value.language.code}" href="${altHref}">
                <c:if test="${alt.value.language.code=='ru'}"><c:set var="ruHref" value="${altHref}"/></c:if>
                <c:if test="${alt.value.language.code=='en'}"><c:set var="enHref" value="${altHref}"/></c:if>
            </c:if>
        </c:forEach>
        <c:set var="xDefaultHref" value="${enHref != null ? enHref : ruHref}"/>
        <c:if test="${xDefaultHref != null}">
           <link rel="alternate" hreflang="x-default" href="${xDefaultHref}">
        </c:if>
     <meta property="og:title" content="${TESTS[param.TEST_PATH].article.title}">
     <meta property="og:type" content="article">
     <meta property="og:description" content="${TESTS[param.TEST_PATH].article.description}">
     <meta property="og:site_name" content="ExamClouds">
     <meta property="og:url" content="https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}${TESTS[param.TEST_PATH].fullPathName}">
     <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
     <meta property="og:image:alt" content="${TESTS[param.TEST_PATH].article.title}">
     <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
     <meta property="twitter:image:alt" content="${TESTS[param.TEST_PATH].article.title}">
     <meta property="twitter:title" content="${TESTS[param.TEST_PATH].article.title}">
     <meta property="twitter:card" content="summary">
     <meta property="twitter:description" content="${TESTS[param.TEST_PATH].article.description}">
     <meta property="twitter:site" content="@ExamClouds">
     <style>
      <c:if test="${TESTS[param.TEST_PATH].article.image!=null && not empty TESTS[param.TEST_PATH].article.image}">
         .show-course-header:before{
           background: url('${pageContext.request.contextPath}${TESTS[param.TEST_PATH].article.image}') no-repeat;
           width: 164px
         }
      </c:if>
      .category-name:before{
        content:"<spring:message code="lesson"/> " counter(lesson)" - ";
      }
      #categories li:hover::before {
        content: "<spring:message code="open"/> →";
        position: absolute;
        bottom: 15px;
        right: 15px;
        color: #4DA3FF;
        font-size: 13px;
      }
     </style>
     <script type="application/ld+json">{
                       "@context": "https://schema.org",
                       "url": "https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}${TESTS[param.TEST_PATH].fullPathName}",
                       "@type": "Article",
                       "headline": "${TESTS[param.TEST_PATH].article.title}"
             }
     </script>
 </jsp:attribute>
 <jsp:body>
    <div class="breadCrumbs">
      <ol>
        <%@ include file="/WEB-INF/breadCrumbs/homeBreadCrumb.jsp"%>
        <li>${TESTS[param.TEST_PATH].name}</li>
      </ol>
    </div>
    <main><article>
      <jsp:include page="/WEB-INF/views/category/category-menu-center.jsp"/>
    </article></main>
    <%@ include file="/WEB-INF/socialButtons.jsp"%>
    <jsp:include page="/WEB-INF/comment/comments.jsp">
       <jsp:param name="referenceId" value="${TESTS[param.TEST_PATH].id}"/>
       <jsp:param name="commentType" value="TEST"/>
    </jsp:include>
 </jsp:body>
</t:wrapper>