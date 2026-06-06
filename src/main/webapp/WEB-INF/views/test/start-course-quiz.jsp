<div id="collapse_q_${test.pathName}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading_q_${test.pathName}">
  <form action="${pageContext.request.contextPath}/see-questions/${test.pathName}" method="post" class="test-form" aria-label="Start quiz form">
    <div class="test-form-grid">
      <div class="test-field test-field--wide">
        <label class="test-field-label" for="CATEGORY_PATH_quiz_${test.pathName}"><spring:message code="category.label"/></label>
        <!-- Removed native `required` because many JS multi-select plugins hide the native <select>,
             which triggers "not focusable" browser validation errors. Rely on aria-required and
             the custom client-side validation below plus server-side validation. -->
        <select name="CATEGORY_PATH" id="CATEGORY_PATH_quiz_${test.pathName}" multiple="multiple" class="2col active" aria-required="true" aria-describedby="CATEGORY_PATH_quiz_${test.pathName}_error" aria-invalid="false">
          <c:set var="count" value="${1}"/>
          <c:forEach var="category" items="${test.categories}">
            <c:choose>
              <c:when test="${not empty category.value.subCategories}">
                <optgroup label="<spring:message code='module'/>&nbsp;${count} - ${category.value.name}">
                  <c:forEach var="subCategory" items="${category.value.subCategories}">
                    <option value="${subCategory.pathName}">${subCategory.name}</option>
                  </c:forEach>
                </optgroup>
              </c:when>
              <c:otherwise>
                <option value="${category.value.pathName}"><spring:message code="module"/>&nbsp;${count} - ${category.value.name}</option>
              </c:otherwise>
            </c:choose>
            <c:set var="count" value="${count+1}"/>
          </c:forEach>
        </select>
        <!-- Inline validation message for accessibility; will be shown when user attempts to submit without selecting categories -->
        <div class="field-error" id="CATEGORY_PATH_quiz_${test.pathName}_error" role="alert" aria-live="assertive" hidden>
          <spring:message code="select.category.required"/>
        </div>
      </div>
      <div class="test-field test-field--narrow">
        <label class="test-field-label" for="NUMBER_OF_QUESTIONS_quiz_${test.pathName}"><spring:message code="number.questions.label"/></label>
        <div class="test-qty">
          <button type="button" class="test-qty-btn dec button" aria-label="<spring:message code="decrease.number.questions"/>" aria-controls="NUMBER_OF_QUESTIONS_quiz_${test.pathName}">-</button>
          <input type="number" id="NUMBER_OF_QUESTIONS_quiz_${test.pathName}" value="25" name="NUMBER_OF_QUESTIONS" class="test-qty-input number-questions-input" min="5" max="100" aria-label="<spring:message code="number.questions.label"/>">
          <button type="button" class="test-qty-btn inc button" aria-label="<spring:message code="increase.number.questions"/>" aria-controls="NUMBER_OF_QUESTIONS_quiz_${test.pathName}">+</button>
        </div>
        <div class="test-qty-hint"><spring:message code="questions.range.hint"/></div>
      </div>
    </div>
    <button type="submit" name="startTest" class="test-submit" aria-label="<spring:message code="start.test.with.selected.options"/>">
      <span class="test-submit-ic" aria-hidden="true">&#9655;</span>
      <spring:message code="start"/>
      <span class="test-submit-arrow" aria-hidden="true">&#8599;</span>
    </button>
  </form>
</div>