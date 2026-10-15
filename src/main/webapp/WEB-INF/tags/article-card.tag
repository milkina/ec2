<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ attribute name="article" required="true" type="model.article.Article" %>
<%@ attribute name="href" required="true" %>
<%@ attribute name="index" required="true" type="java.lang.Integer" %>
<%@ attribute name="authorName" required="false" %>
<%@ attribute name="datePattern" required="true" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- Карточка статьи в списке блога (show-all-articles.jsp / show-all-en-articles.jsp).
     authorName выводится только для своих статей (Java-раздел); у гостевых автор не указывается. --%>
<a href="${href}" class="article-card article-card--c${(index % 4) + 1}">
  <div class="article-card-cover"><span class="article-card-cat">${not empty article.tag ? article.tag : 'IT'}</span></div>
  <div class="article-card-body">
    <h3>${article.title}</h3>
    <p>${article.description}</p>
    <div class="article-card-meta">
      <c:if test="${not empty authorName}"><span class="article-author">${authorName}</span></c:if>
      <c:if test="${article.createdDate != null}">
        <time class="article-date" datetime="<fmt:formatDate value='${article.createdDate}' pattern='yyyy-MM-dd'/>"><fmt:formatDate value="${article.createdDate}" pattern="${datePattern}"/></time>
      </c:if>
    </div>
    <div class="article-card-meta">
      <span class="article-readtime">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
        ${not empty article.minRead ? article.minRead : 5}&nbsp;<spring:message code="min.read"/>
      </span>
      <span class="article-card-read"><spring:message code="show.more"/> →</span>
    </div>
  </div>
</a>
