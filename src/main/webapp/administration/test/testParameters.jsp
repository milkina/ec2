 <strong class="adminLabel"><spring:message	code="course.name"/>:<span class="wrongMessage">*</span></strong>
             <form:input path="name" maxlength="25" required="required"/> <br>
             <strong class="adminLabel"><spring:message	code="course.path"/>:<span class="wrongMessage">*</span></strong>
             <form:input path="pathName" maxlength="70" required="required"/> <br>
             <strong class="adminLabel"><spring:message	code="language"/>:</strong>
             <select name="LANGUAGE">
                            <c:forEach var="language" items="${LANGUAGES}">
                                <option value="${language.value.code}"
                                  <c:if test="${TESTS[param.TEST_PATH].language.code==language.value.code}">selected</c:if>
                                >${language.value.description}
                                </option>
                            </c:forEach>
             </select>
             <br>
             <c:forEach items="${TESTS[param.TEST_PATH].canonicalUrls}" var="entry">
                  <c:if test="${entry.key == 1}">
                     <c:set var="ruCanonicalUrl" value="${entry.value.url}" />
                 </c:if>
                  <c:if test="${entry.key == 2}">
                         <c:set var="enCanonicalUrl" value="${entry.value.url}" />
                     </c:if>
             </c:forEach>
             <span class="adminLabel">Russian Version:</span>
             <input type="text" name="ruVersion" maxlength="80" value="${ruCanonicalUrl}" size="80"/>
             <br>
             <span class="adminLabel">English Version:</span>
             <input type="text" name="enVersion" maxlength="80" value="${enCanonicalUrl}" size="80"/>
             <br>
             <strong class="adminLabel"><spring:message	code="tags"/>:<span class="wrongMessage">*</span></strong>
             <form:input path="tags" maxlength="70" required="required"/> <br>
             <span class="adminLabel"><spring:message	code="image.url"/>:</span>
             <form:input path="article.image" maxlength="150" size="70"/> <br>
             <span class="adminLabel"><spring:message code="keywords"/>:<span class="wrongMessage">*</span></span>
             <form:textarea rows="4" cols="40" maxlength="160" path="article.keywords" required="required" id="keywords"/>  <br>
             <span class="adminLabel"><spring:message code="title"/>:<span class="wrongMessage">*</span></span>
             <form:textarea rows="4" cols="40" maxlength="160" path="article.title" required="required" id="TITLE"/>  <br>
             <span class="adminLabel"><spring:message code="meta.description"/>:<span class="wrongMessage">*</span></span>
             <form:textarea rows="4" cols="40" maxlength="160" path="article.description" required="required" id="description"/><br>
             <span class="adminLabel"><spring:message code="icon.text"/>:</span>
             <form:input path="iconText" maxlength="200" size="100" id="iconText"/>
             <span class="adminLabel"><spring:message code="text"/>:</span>
             <form:textarea rows="25" cols="80" path="article.text" id="ARTICLE_TEXT"/>
             <br>