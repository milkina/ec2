<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<t:wrapper>
    <jsp:attribute name="header">
    <meta charset="UTF-8">
    <c:set var="titleName" value="${CATEGORY_ATTRIBUTE.name} - ${TESTS[param.TEST_PATH].name}"/>
    <c:if test="${CATEGORY_ATTRIBUTE.title!=null && !CATEGORY_ATTRIBUTE.title.equals('')}">
      <c:set var="titleName" value="${CATEGORY_ATTRIBUTE.title}"/>
    </c:if>
    <c:if test="${CATEGORY_ATTRIBUTE.parentCategory!=null && (CATEGORY_ATTRIBUTE.name.equals('Задания') || CATEGORY_ATTRIBUTE.name.equals('Tasks')) && (CATEGORY_ATTRIBUTE.title==null || CATEGORY_ATTRIBUTE.title.trim().equals(''))}">
       <c:set var="titleName" value="${CATEGORY_ATTRIBUTE.parentCategory.name}. ${titleName}"/>
    </c:if>
    <c:set var="header1" value="${CATEGORY_ATTRIBUTE.name}"/>
    <c:if test="${CATEGORY_ATTRIBUTE.parentCategory!=null && (CATEGORY_ATTRIBUTE.name.equals('Задания') || CATEGORY_ATTRIBUTE.name.equals('Tasks'))}">
       <c:set var="header1" value="${CATEGORY_ATTRIBUTE.parentCategory.name}. ${CATEGORY_ATTRIBUTE.name}"/>
    </c:if>
    <title><c:out value="${titleName}"/></title>
    <meta name="keywords" content="${CATEGORY_ATTRIBUTE.article.keywords}">
    <meta name="description" content="${CATEGORY_ATTRIBUTE.article.description}">
    <%@ include file="/edit/categoryOL.jsp"%>
    <script async src="${pageContext.request.contextPath}/js/prism.min.js?ver=1"></script>
    <c:set var="pathLanguage" value="${TESTS[param.TEST_PATH].language.code=='ru'?'ru/':''}"/>
    <c:set var="canonicalUrl" value="https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}java/${param.TEST_PATH}/${CATEGORY_ATTRIBUTE.pathName}"/>
   <c:set var="alternateRuUrl" value="${ruUrl!=null ? 'https://www.examclouds.com'.concat(ruUrl) : pageLanguage=='ru' ? canonicalUrl : null}"/>
   <c:set var="alternateEnUrl" value="${enUrl!=null ? 'https://www.examclouds.com'.concat(enUrl) : pageLanguage!='ru' ? canonicalUrl : null}"/>
   <c:set var="defaultUrl" value="${alternateEnUrl!=null ? alternateEnUrl : alternateRuUrl}"/>

   <link rel="canonical" href="${canonicalUrl}">
   <c:if test="${alternateRuUrl!=null}">
       <link rel="alternate" hreflang="ru" href="${alternateRuUrl}">
   </c:if>
   <c:if test="${alternateEnUrl!=null}">
       <link rel="alternate" hreflang="en" href="${alternateEnUrl}">
   </c:if>
   <c:if test="${defaultUrl!=null}">
       <link rel="alternate" hreflang="x-default" href="${defaultUrl}">
   </c:if>
   <meta property="og:url" content="https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}java/${param.TEST_PATH}/${CATEGORY_ATTRIBUTE.pathName}">
   <c:if test="${CATEGORY_ATTRIBUTE.hidden || !CATEGORY_ATTRIBUTE.article.indexStatus}">
          <meta name="robots" content="noindex">
    </c:if>
    <script type="application/ld+json">{
         "@context": "https://schema.org",
         "url": "https://www.examclouds.com/${pageLanguage=='ru'?'ru/':''}java/${param.TEST_PATH}/${CATEGORY_ATTRIBUTE.pathName}",
         "@type": "Article",
         "headline": "<c:out value="${titleName}"/>"
    }
    </script>
    </jsp:attribute>
    <jsp:body>
      <jsp:include page="/WEB-INF/breadCrumbs/breadCrumbs3.jsp"/>
      <main class="container">
        <article>
         <h1 class="show-category-header">${header1}</h1>
         <div class="category-article">
                     <c:if test="${CATEGORY_ATTRIBUTE.article.image != null &&  not empty CATEGORY_ATTRIBUTE.article.image}">
                       <img class="categoryImage" src="${CATEGORY_ATTRIBUTE.article.image}" loading="lazy"
                         width ="280" height="200" alt="${CATEGORY_ATTRIBUTE.name}&nbsp;<spring:message code='photo'/>" title="${CATEGORY_ATTRIBUTE.name}&nbsp;<spring:message code='photo'/>">
                     </c:if>
            <div class="author-category">
              <img src="https://img.examclouds.com/general/tatyana-milkina-small.jpg"
                   alt="Tatyana Milkina"
                   class="author-img-small"
                   width="50"
                   height="50"
                   loading="lazy"/>
              <div class="author-info">
                <span class="author-label"><spring:message code="author"/>:</span>
                <a href="${pageContext.request.contextPath}/${pathLanguage}tatyana-milkina"
                   class="author-link">Tatyana Milkina</a>
              </div>
            </div>
            <c:if test="${CATEGORY_ATTRIBUTE.videoPath!=null && not empty CATEGORY_ATTRIBUTE.videoPath}">
                  <iframe width="100%" height="315" src="${fn:replace(CATEGORY_ATTRIBUTE.videoPath, "youtu.be", "www.youtube.com/embed")}"
                      frameborder="0" name="youtubeVideo" title="<c:out value="${titleName}"/>" loading="lazy" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                      class="iframe-category" allowfullscreen>
                  </iframe>
            </c:if>
            ${CATEGORY_ATTRIBUTE.article.text}
             <c:if test="${pageLanguage=='ru'}">
                <a href="https://www.udemy.com/course/java-bup/" rel="noopener nofollow sponsored" target="_blank"><img class="img-responsive" src="https://img.examclouds.com/ad1.png" loading="lazy"
                                     width ="546" height="475" alt="Курс 'Java для начинающих' на Udemy" title="Курс 'Java для начинающих' на Udemy"></a>
                <a href="https://www.udemy.com/course/java-bup/" rel="nofollow sponsored noopener" target="_blank">Курс 'Java для начинающих' на Udemy</a>
            </c:if>
         </div>
           <c:if test="${not empty CATEGORY_ATTRIBUTE.subCategories}">
            <ol class="category-list">
              <c:forEach var="subCategory" items="${CATEGORY_ATTRIBUTE.subCategories}">
                <c:if test="${subCategory.hidden==false}">
                  <li><a href="${pageContext.request.contextPath}/${pathLanguage}java/${param.TEST_PATH}/${subCategory.pathName}"
                       class="category-sub-href" id="categoryItem${subCategory.pathName}">${subCategory.name}
                       </a>
                  </li>
                 </c:if>
              </c:forEach>
            </ol>
           </c:if>
           <c:if test="${CATEGORY_ATTRIBUTE.questionsCount!=0 or not empty CATEGORY_ATTRIBUTE.subCategories}">
            <div class="read-questions-div">
               <a href="${pageContext.request.contextPath}/see-questions?CATEGORY_PATH=${param.CATEGORY_PATH}&TEST_PATH=${param.TEST_PATH}"
                 id="startQuiz" class="read-questions-href">
                   <spring:message code="questions"/>
               </a>
            </div>
           </c:if>
           <c:if test="${CATEGORY_ATTRIBUTE.testsCount!=0 or not empty CATEGORY_ATTRIBUTE.subCategories}">
             <input type="button" class="styled-button pass-test-btn" value="<spring:message code="start.test"/>" id="startTest"
              onclick="window.location.href='${pageContext.request.contextPath}/start-test?CATEGORY_PATH=${param.CATEGORY_PATH}&TEST_PATH=${param.TEST_PATH}';">
           </c:if>
         </article>
         <input type="button" class="styled-button pass-test-btn" value="<spring:message code="add.question.button"/>" id="AddQuestion"
           onclick="window.location.href='${pageContext.request.contextPath}/add-question?TEST_PATH=${param.TEST_PATH}&CATEGORY_PATH=${param.CATEGORY_PATH}';">
         <div class="row">
           <div class="col-xs-6 previous-exam-button">
             <c:if test="${PREVIOUS_CATEGORY!=null}">
               <a href="${pageContext.request.contextPath}/<spring:message code='menu.home'/>java/${param.TEST_PATH}/${PREVIOUS_CATEGORY.pathName}">
                 <spring:message code="previous"/>
               </a>
             </c:if>
           </div>
           <div class="col-xs-6 next-exam-button">
             <c:if test="${NEXT_CATEGORY!=null}">
               <a href="${pageContext.request.contextPath}/<spring:message code='menu.home'/>java/${param.TEST_PATH}/${NEXT_CATEGORY.pathName}">
                 <spring:message code="next"/>
               </a>
              </c:if>
           </div>
         </div>
         <c:if test="${not empty CATEGORY_ATTRIBUTE.parentCategory.subCategories}">
           <div>
             <spring:message code="read.also"/>:
              <ul>
                <c:set var="liCount" value="0" />
                <c:forEach var="subCategory" items="${CATEGORY_ATTRIBUTE.parentCategory.subCategories}">
                  <c:if test="${subCategory!=CATEGORY_ATTRIBUTE && liCount < 5}">
                    <li><a href="${pageContext.request.contextPath}/<spring:message code='menu.home'/>java/${param.TEST_PATH}/${subCategory.pathName}">${subCategory.name}
                        </a>
                    </li>
                    <c:set var="liCount" value="${liCount + 1}" />
                  </c:if>
                </c:forEach>
              </ul>
           </div>
         </c:if>
      </main>
      <%@ include file="/WEB-INF/socialButtons.jsp"%>
      <jsp:include page="/WEB-INF/comment/comments.jsp">
        <jsp:param name="referenceId" value="${CATEGORY_ATTRIBUTE.article.id}"/>
        <jsp:param name="commentType" value="ARTICLE"/>
      </jsp:include>
    </jsp:body>
</t:wrapper>
