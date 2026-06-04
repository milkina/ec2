<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="/WEB-INF/tld/examjsp-taglib.tld" prefix="exam"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="/WEB-INF/tld/canonical-jsp-taglib.tld" prefix="ca"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<t:wrapper>
<jsp:attribute name="language">lang="${TESTS[param.TEST_PATH].language.code}"</jsp:attribute>
<jsp:attribute name="header">
    <title>${QUESTION_ENTRY_ATTRIBUTE.category.parentCategory.name} ${QUESTION_ENTRY_ATTRIBUTE.category.name} - ${TESTS[TEST_PATH].name}</title>
    <meta name="description" content="${QUESTION_ENTRY_ATTRIBUTE.category.article.description}">
    <script async src="${pageContext.request.contextPath}/js/show_questions.js?v=4"></script>
    <script async src="${pageContext.request.contextPath}/js/prism.min.js?ver=1"></script>
    <link rel="canonical" href="<ca:canonicalTag/>">
    <link href="${pageContext.request.contextPath}/css/english.css" rel="stylesheet">
</jsp:attribute>
<jsp:body>
  <div class="breadCrumbs">
    <ol itemscope itemtype="https://schema.org/BreadcrumbList">
      <%@ include file="/WEB-INF/breadCrumbs/homeBreadCrumb.jsp"%>
      <li itemprop="itemListElement" itemscope
          itemtype="https://schema.org/ListItem"><a itemprop="item" href="<menu:testsTag/>">
        <span itemprop="name"><spring:message code="tests.questions"/></span></a>
        <meta itemprop="position" content="2"></li>
      <li>${TESTS[param.TEST_PATH].name}</li>
    </ol>
  </div>
  <c:if test="${QUESTION_ENTRY_ATTRIBUTE.category.parentCategory!=null}">
    <h1 class="exam-header1">${QUESTION_ENTRY_ATTRIBUTE.category.parentCategory.name}</h1>
  </c:if>
  <div class="clearfix">
    <h2 class="exam-header2">${QUESTION_ENTRY_ATTRIBUTE.category.name}</h2>
  </div>
  <div class="questionEntryBody">
    <div class="questionText">${QUESTION_ENTRY_ATTRIBUTE.question.text}</div>
    <spring:message code="read.answer" var="readAnswerMsg"/>
    <spring:message code="hide.answer" var="hideAnswerMsg"/>
    <a class="read-answer collapsed" role="button" id="a1"
       href="javascript:void(0);" aria-expanded="false" aria-controls="answer1"
       onclick="showAnswer(1,'${readAnswerMsg}','${hideAnswerMsg}'); this.classList.toggle('collapsed');">
      <spring:message code="read.answer"/>
    </a>
    <div class="answer" id="answer1" style="display:none;">${QUESTION_ENTRY_ATTRIBUTE.answer.text}</div>
  </div>
  <a href="${pageContext.request.contextPath}/see-questions/${TEST_PATH}/${QUESTION_ENTRY_ATTRIBUTE.category.pathName}"
     id="seeOtherQuestions">
     <spring:message code="see.other.questions"/>
  </a>
  <jsp:include page="/WEB-INF/comment/comments.jsp">
    <jsp:param name="referenceId" value="${QUESTION_ENTRY_ATTRIBUTE.id}"/>
    <jsp:param name="commentType" value="QUESTION"/>
  </jsp:include>
 </jsp:body>
</t:wrapper>