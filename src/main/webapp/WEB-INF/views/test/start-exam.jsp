<div id="collapse_${test.pathName}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading_${test.pathName}">
  <form action="${pageContext.request.contextPath}/${pageLanguage=='ru'?'ru/':''}start-test/${test.pathName}" method="post" class="test-form">
    <div class="test-form-grid">
      <div class="test-field">
        <label class="test-field-label" for="CATEGORY_PATH_test_${test.pathName}"><spring:message code="category.label"/></label>
        <select name="CATEGORY_PATH" id="CATEGORY_PATH_test_${test.pathName}" multiple="multiple" class="2col active" required>
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
      </div>
      <div class="test-field">
        <label class="test-field-label"><spring:message code="number.questions.label"/></label>
        <div class="test-qty">
          <button type="button" class="test-qty-btn dec button" aria-label="-">-</button>
          <input type="number" value="25" name="NUMBER_OF_QUESTIONS" class="test-qty-input number-questions-input" min="5" max="100">
          <button type="button" class="test-qty-btn inc button" aria-label="+">+</button>
        </div>
        <div class="test-qty-hint"><spring:message code="questions.range.hint"/></div>
      </div>
    </div>
    <button type="submit" name="startTest" class="test-submit">
      <span class="test-submit-ic">&#9655;</span>
      <spring:message code="start.test"/>
      <span class="test-submit-arrow">&#8599;</span>
    </button>
  </form>
</div>