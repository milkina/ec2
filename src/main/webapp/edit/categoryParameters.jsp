<span class="adminLabel"><spring:message code="category.name"/>:<span class="wrongMessage">*</span></span>
<input type="text" name="categoryName" maxlength="70" required value="${CATEGORY_ATTRIBUTE.name}" size="70"/>
<BR>
<span class="adminLabel">Title (optional):</span>
<input type="text" name="categoryTitle" maxlength="70" value="${CATEGORY_ATTRIBUTE.title}" size="70"/>
<BR>
<span class="adminLabel"><spring:message code="category.path"/>:<span class="wrongMessage">*</span></span>
<input type="text" name="categoryPathName" maxlength="70" required value="${param.CATEGORY_PATH}" size="70"/>
<BR>
<span class="adminLabel"><spring:message code="category.videoPath"/>:</span>
<input type="text" name="categoryVideoPath" maxlength="70" value="${CATEGORY_ATTRIBUTE.videoPath}" size="70"/>
<BR>
<c:forEach items="${CATEGORY_ATTRIBUTE.canonicalUrls}" var="entry">
     <c:if test="${entry.key == 1}">
        <c:set var="ruCanonicalUrl" value="${entry.value.url}" />
    </c:if>
     <c:if test="${entry.key == 2}">
            <c:set var="enCanonicalUrl" value="${entry.value.url}" />
        </c:if>
</c:forEach>
<span class="adminLabel">Russian Version:</span>
<input type="text" name="ruVersion" maxlength="70" value="${ruCanonicalUrl}" size="70"/>
<BR>
<span class="adminLabel">English Version:</span>
<input type="text" name="enVersion" maxlength="70" value="${enCanonicalUrl}" size="70"/>
<BR>
<span class="adminLabel"><spring:message code="category.parent"/>:</span>
<select name="categoryParent">
   <option value="" <c:if test="${CATEGORY_ATTRIBUTE.parentCategory==null}">
                          selected
                       </c:if>>&nbsp;</option>
   <c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
       <option value="${category.value.id}"
            <c:if test="${CATEGORY_ATTRIBUTE.parentCategory.id==category.value.id}">
                  selected
            </c:if>
       >${category.value.name}</option>
   </c:forEach>
</select>
<BR>
<span class="adminLabel"><spring:message code="hidden"/>?</span>
<input type="checkbox" name="hidden" <c:if test="${CATEGORY_ATTRIBUTE.hidden}">checked</c:if>>
<BR>
<span class="adminLabel"><spring:message code="index"/>?</span>
<input type="checkbox" name="index"
 <c:if test="${CATEGORY_ATTRIBUTE==null || CATEGORY_ATTRIBUTE.article.indexStatus}">checked</c:if>>
<BR>
<span class="adminLabel"><spring:message code="image.url"/>:</span>
<input type="text" name="ARTICLE_IMAGE" maxlength="150" value="${CATEGORY_ATTRIBUTE.article.image}" size="70"/> <BR>
<span class="adminLabel"><spring:message code="keywords"/>:</span>
<textarea rows="4" cols="40" maxlength="160" name="keywords" id="keywords">${CATEGORY_ATTRIBUTE.article.keywords}</textarea>  <BR>
<span class="adminLabel"><spring:message code="meta.description"/>:<span class="wrongMessage">*</span></span>
<textarea rows="4" cols="40" maxlength="160" name="description" required id="description">${CATEGORY_ATTRIBUTE.article.description}</textarea>  <BR>
<span class="adminLabel"><spring:message code="text"/>:</span>
<textarea rows="25" cols="80" name="article.text" id="ARTICLE_TEXT">${CATEGORY_ATTRIBUTE.article.text}</textarea> <BR>

