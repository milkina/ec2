<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/categoryjsp-taglib.tld" prefix="category"%>
<%@ taglib uri="/WEB-INF/tld/question-entryjsp-taglib.tld" prefix="qe"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<category:category categoryPath="${param.CATEGORY_PATH}">
<t:wrapper2>
    <jsp:attribute name="header">
        <meta name="robots" content="noindex">
        <title><spring:message code="questions"/> <category:name/> - ${TESTS[param.TEST_PATH].name}</title>
        <meta name="description" content="<category:description/>">
        <script async src="${pageContext.request.contextPath}/js/show_questions.js"></script>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/quiz.css?v=1">
   </jsp:attribute>
   <jsp:body>
    <main>
        <div class="container articles-page">
          <span class="iq-eyebrow"><spring:message code="questions"/></span>
          <h1 class="iq-title">
                <category:name/>
                <c:if test="${param.TYPE.equals('NOT_APPROVED')}"> — <spring:message code="not.approved"/></c:if>
          </h1>
          <p class="iq-sub"><category:questionsCount/></p>

          <div class="iq-toolbar">
            <form action="${pageContext.request.contextPath}/clear-history" class="iq-toolbar-form">
              <input type="hidden" name="CATEGORY_PATH" value="<category:pathName/>">
              <input type="hidden" name="TEST_PATH" value="${param.TEST_PATH}">
              <c:if test="${person!=null && (param.TYPE.equals('QUESTION') || param.TYPE.equals('TEST'))}">
                   <input type="submit" value="<spring:message code="clear.history"/>" name="clearHistory" class="btn btn-outline btn-sm">
                   <%@ include file="/WEB-INF/showQuestions/selectOptionsPanel.jsp" %>
              </c:if>
            </form>
          </div>

          <div id="iq-groups" class="iq-groups">
          <qe:qeList>
            <qe:qe>
              <details class="iq-item <qe:type/>" id="li<qe:id/>" data-id="<qe:id/>">
                <summary class="iq-summary">
                  <input type="checkbox" id="isAnswered<qe:id/>"
                         title="<spring:message code="mark.question"/>" <qe:checkbox/>
                         onchange="markAnswered('${pageContext.request.contextPath}',<qe:id/>);"
                         class="iq-check iq-check-input">
                  <div class="iq-q"><qe:number/>.&nbsp;<qe:question/></div>
                  <span class="iq-plus" aria-hidden="true">+</span>
                </summary>
                <div class="iq-a">
                  <qe:answers>
                    <div><qe:answer><qe:answertext/> <input type="checkbox" disabled <qe:answercheckbox/> class="iq-right-mark"></qe:answer></div>
                  </qe:answers>
                  <div class="iq-actions">
                    <c:if test="${param.TYPE.equals('TEST') || param.TYPE.equals('QUESTION')}">
                      <a href="<qe:up/>&TEST_PATH=${param.TEST_PATH}&TYPE=${param.TYPE}" class="btn btn-outline btn-sm"><spring:message code="up"/></a>
                    </c:if>
                    <a href="<qe:show/>&TEST_PATH=${param.TEST_PATH}" class="btn btn-outline btn-sm"><spring:message code="edit"/></a>
                    <a href="${pageContext.request.contextPath}/show-question?QUESTION_ENTRY_ID_PARAM=<qe:id/>&TEST_PATH=${param.TEST_PATH}" class="btn btn-outline btn-sm"><spring:message code="go.to"/></a>
                    <a href="${pageContext.request.contextPath}/show-question-picture?QUESTION_ENTRY_ID_PARAM=<qe:id/>&TEST_PATH=${param.TEST_PATH}" class="btn btn-outline btn-sm"><spring:message code="show.picture"/></a>
                    <a href="#" class="btn btn-outline btn-sm" onclick="deleteQuestion('${pageContext.request.contextPath}',<qe:id/>,'<category:pathName/>','${param.TEST_PATH}');return false;"><spring:message code="delete"/></a>
                    <c:if test="${param.TYPE.equals('NOT_APPROVED')}">
                      <a href="#" class="btn btn-outline btn-sm" onclick="approveQuestion('${pageContext.request.contextPath}',<qe:id/>);return false;"><spring:message code="approve"/></a>
                    </c:if>
                    <span class="iq-meta"><qe:createdDate/>&nbsp;<qe:author/>&nbsp;<qe:approved/></span>
                  </div>
                </div>
              </details>
            </qe:qe>
          </qe:qeList>
          </div>
          
          <div class="iq-pagination">
            <button id="iq-prev" class="btn btn-outline btn-sm" disabled><spring:message code="previous"/></button>
            <span id="iq-page-info" class="iq-page-info" data-page-text="<spring:message code="page"/>" data-of-text="<spring:message code="of"/>"><spring:message code="page"/> 1 <spring:message code="of"/> 1</span>
            <button id="iq-next" class="btn btn-outline btn-sm" disabled><spring:message code="next"/></button>
          </div>
        </div>
         <script async src="${pageContext.request.contextPath}/js/prism.min.js?ver=1"></script>
 </jsp:body>
</t:wrapper2>
</category:category>
