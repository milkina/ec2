<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<t:wrapper>
 <jsp:attribute name="header">
    <meta name="robots" content="noindex">
    <title><spring:message code="edit.article"/></title>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <jsp:include page="/edit/tinymceHeader.jsp"/>
 </jsp:attribute>
 <jsp:body>
       <div class="mainArea">
        <form action="${pageContext.request.contextPath}/save-article" method="post" >
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="ARTICLE_ID" value="${ARTICLE_ATTRIBUTE.id}">
            <span class="adminLabel"><spring:message code="url"/>:<span class="wrongMessage">*</span></span>
            <input type="text" name="URL_PARAM" maxlength="70" required value="${ARTICLE_ATTRIBUTE.url}" size="70"><br>
            <span class="adminLabel">Tag:</span>
            <input type="text" name="ARTICLE_TAG" maxlength="50" value="${ARTICLE_ATTRIBUTE.tag}" size="30"><br>
            <span class="adminLabel">Min read:</span>
            <input type="text" name="ARTICLE_MIN_READ" maxlength="10" value="${ARTICLE_ATTRIBUTE.minRead}" size="10"><br>
            <span class="adminLabel"><spring:message code="title"/>:<span class="wrongMessage">*</span></span>
            <input type="text" name="TITLE" maxlength="70" required value="${ARTICLE_ATTRIBUTE.title}" size="70"><br>
            <span class="adminLabel"><spring:message code="image.url"/>:</span>
            <input type="text" name="ARTICLE_IMAGE" maxlength="70" value="${ARTICLE_ATTRIBUTE.image}"><br>
                       <strong class="adminLabel"><spring:message	code="language"/>:</strong>
                        <select name="LANGUAGE">
                           <c:forEach var="language" items="${LANGUAGES}">
                              <option value="${language.value.code}"
                                <c:if test="${ARTICLE_ATTRIBUTE.language.code==language.value.code}">selected</c:if>
                                  >${language.value.description}
                              </option>
                           </c:forEach>
                        </select><br>
            <span class="adminLabel"><spring:message code="index"/>?</span>
            <input type="checkbox" name="index"
              <c:if test="${ARTICLE_ATTRIBUTE==null || ARTICLE_ATTRIBUTE.indexStatus}">checked</c:if>>
            <br>
             <span class="adminLabel"><spring:message code="keywords"/>:<span class="wrongMessage">*</span></span>
            <textarea rows="7" cols="40" maxlength="160" name="keywords" required id="keywords">${ARTICLE_ATTRIBUTE.keywords}</textarea>  <br>
            <span class="adminLabel"><spring:message code="meta.description"/>:<span class="wrongMessage">*</span></span>
            <textarea rows="7" cols="40" maxlength="160" name="description" required id="description">${ARTICLE_ATTRIBUTE.description}</textarea>  <br>
            <span class="adminLabel"><spring:message code="text"/>:<span class="wrongMessage">*</span></span>
            <textarea rows="25" cols="80" name="article.text" id="ARTICLE_TEXT">${ARTICLE_ATTRIBUTE.text}</textarea> <br>
            <input type="submit" value="<spring:message code="save.button"/>" name="Save" id="save"><br>
        </form>
      </div>
  </jsp:body>
</t:wrapper>