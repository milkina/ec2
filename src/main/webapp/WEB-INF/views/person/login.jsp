<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:wrapper2>
 <jsp:attribute name="language">lang="<spring:message code='lang'/>"</jsp:attribute>
 <jsp:attribute name="header">
    <title><spring:message code="login.to"/> ExamClouds</title>
    <meta name="robots" content="noindex">
    <meat name="description" content="<spring:message code="login.description"/>">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
 </jsp:attribute>
 <jsp:body>
  <main class="auth-bg">
    <div class="auth-wrap">
      <div class="auth-head">
        <h1 class="auth-title"><spring:message code="welcome.back"/></h1>
        <p class="auth-sub"><spring:message code="continue.journey"/></p>
      </div>

     <!--//TODO <div class="auth-card">
        <div class="auth-oauth">
          <button type="button">
            <svg viewBox="0 0 24 24" aria-hidden="true"><path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/><path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.99.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/><path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/><path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/></svg>
            Continue with Google
          </button>
          <button type="button">
            <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 .5C5.73.5.75 5.48.75 11.75c0 4.97 3.22 9.18 7.69 10.67.56.1.77-.24.77-.54v-1.9c-3.13.68-3.79-1.51-3.79-1.51-.51-1.3-1.25-1.65-1.25-1.65-1.02-.7.08-.69.08-.69 1.13.08 1.72 1.16 1.72 1.16 1 1.72 2.63 1.22 3.27.94.1-.73.39-1.22.71-1.5-2.5-.28-5.13-1.25-5.13-5.57 0-1.23.44-2.24 1.16-3.03-.12-.28-.5-1.43.11-2.98 0 0 .95-.3 3.1 1.16.9-.25 1.86-.38 2.82-.38.96 0 1.92.13 2.82.38 2.15-1.46 3.1-1.16 3.1-1.16.61 1.55.23 2.7.11 2.98.72.79 1.16 1.8 1.16 3.03 0 4.33-2.63 5.29-5.14 5.57.4.35.76 1.04.76 2.1v3.11c0 .3.21.65.78.54 4.46-1.49 7.68-5.7 7.68-10.67C23.25 5.48 18.27.5 12 .5z"/></svg>
            Continue with GitHub
          </button>
        </div>

        <div class="auth-divider">or</div>
-->
        <form class="auth-form" action="${pageContext.request.contextPath}/login" method="POST" id="LoginForm">
          <div class="auth-field">
            <label for="email"><spring:message code="login"/></label>
            <div class="auth-input-wrap">
              <input id="email" name="login" class="auth-input has-icon" value="${person.login}" type="text" placeholder="you@example.com" autocomplete="email" />
            </div>
          </div>
          <div class="auth-field">
            <label for="password"><spring:message code="password"/></label>
            <div class="auth-input-wrap">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="4" y="11" width="16" height="10" rx="2"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>
              <input id="password" class="auth-input has-icon" type="password" placeholder="••••••••" autocomplete="current-password" name="password" value="${person.password}" />
            </div>
          </div>

          <div class="auth-row">
            <label><input type="checkbox" CHECKED name="Remember"> <spring:message code="remember.me"/></label>
            <span class="wrongMessage" id="wrongMessage">${wrongLoginMessage}</span>
          <!--  <a href="#">Forgot password?</a>-->
          </div>

          <button class="auth-submit" type="submit" name="Enter"><spring:message code="log.in"/></button>
        </form>
      </div>

      <p class="auth-foot">
        <spring:message code="new.here"/> <a href="${pageContext.request.contextPath}${pageLanguage=='ru'?'/ru':''}/register"><spring:message code="register"/></a>
      </p>
    </div>
  </main>
 </jsp:body>
</t:wrapper2>