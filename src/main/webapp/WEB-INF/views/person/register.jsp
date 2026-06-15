<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:wrapper2>
  <jsp:attribute name="header">
      <meta name="robots" content="noindex">
      <title><spring:message code="create.account"/> | ExamClouds</title>
      <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css?v=1">
  </jsp:attribute>
  <jsp:body>
  <main class="auth-bg">
      <div class="auth-wrap">
        <div class="auth-head">
          <h1 class="auth-title"><spring:message code="create.account"/></h1>
          <p class="auth-sub"><spring:message code="start.learning.java"/></p>
        </div>

        <div class="auth-card">
           <spring:message code="yourname" var="yournamePlaceholder"/>
           <spring:message code="at.least.characters" var="atLeastCharsPlaceholder"/>
           <spring:message code="repeat.password" var="repeatPasswordPlaceholder"/>
           <form:form action="${pageContext.request.contextPath}/${pageLanguage!=null && pageLanguage=='ru'?'ru/':''}addPerson"
                             method="post" id="confirmRegistration" name="confirmRegistration">
               <span class="wrongMessage" id="registerWrongMessage">${requestScope.message}</span>
            <div class="auth-field">
              <label for="login"><spring:message code="login"/></label>
              <div class="auth-input-wrap">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="8" r="4"/><path d="M4 21a8 8 0 0 1 16 0"/></svg>
                <form:input required="required" minlength="3" maxlength="70" path="login" class="auth-input has-icon"  placeholder="${yournamePlaceholder}" autocomplete="login"/>
              </div>
              <p class="auth-hint"><spring:message code="login.hint"/></p>
            </div>

            <div class="auth-field">
              <label for="email">Email</label>
              <div class="auth-input-wrap">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="3" y="5" width="18" height="14" rx="2"/><polyline points="3 7 12 13 21 7"/></svg>
                <form:input type="email" path="email" required="required" maxlength="50" placeholder="you@example.com" autocomplete="email"  class="auth-input has-icon"/>
              </div>
            </div>

            <div class="auth-field">
              <label for="password"><spring:message code="password"/></label>
              <div class="auth-input-wrap">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="4" y="11" width="16" height="10" rx="2"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>
                <form:input type="password" path="password" required="required" minlength="8" maxlength="50" placeholder="${atLeastCharsPlaceholder}" autocomplete="new-password" class="auth-input has-icon"/>
              </div>
            </div>

            <div class="auth-field">
              <label for="confirm"><spring:message code="confirm.password"/></label>
              <div class="auth-input-wrap">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M20 6 9 17l-5-5"/></svg>
                <input type="password" required minlength="8" maxlength="50" placeholder="${repeatPasswordPlaceholder}" name="confPassword" class="auth-input has-icon" autocomplete="new-password">
              </div>
            </div>

            <label class="auth-terms">
              <input type="checkbox" required />
              <span><spring:message code="agree.to"/> <a href="${pageContext.request.contextPath}${pageLanguage!=null && pageLanguage=='ru'?'/ru':''}/privacy"><spring:message code="with.privacy"/></a>.</span>
            </label>
            <button class="auth-submit" type="submit"><spring:message code="create.account"/></button>
           </form:form>
        </div>

        <p class="auth-foot">
          <spring:message code="already.have.account"/> <a href="${pageContext.request.contextPath}${pageLanguage!=null && pageLanguage=='ru'?'/ru':''}/show-login-page"><spring:message code="log.in"/></a>
        </p>
      </div>
    </main>
</jsp:body>
</t:wrapper2>