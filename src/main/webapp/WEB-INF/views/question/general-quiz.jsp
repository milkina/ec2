<p class="iq-sub"><spring:message code="total"/>: ${not empty TOTAL_QUESTIONS_COUNT ? TOTAL_QUESTIONS_COUNT : CATEGORY_ATTRIBUTE.questionsCount} <spring:message code="total.questions"/></p>
<div class="iq-toolbar">
            <form action="${pageContext.request.contextPath}/clear-history" class="iq-toolbar-form">
              <input type="hidden" name="CATEGORY_PATH" value="${CATEGORY_ATTRIBUTE.pathName}">
              <input type="hidden" name="TEST_PATH" value="${param.TEST_PATH}">
              <c:if test="${person!=null && ('QUESTION'.equals(param.TYPE) || param.TYPE.equals('TEST'))}">
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
                    <div><qe:answer><qe:answertext/></qe:answer></div>
                  </qe:answers>
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
