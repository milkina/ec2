<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<footer class="site-footer dark-footer">
  <div class="container footer-grid-3">
    <div>
      <a href="<menu:homeTag/>" class="brand brand-light">
        <div class="logo">
              <img src="https://img.examclouds.com/general/logo.svg" alt="ExamClouds" width="122" height="49">
            </div>
      </a>
      <h2 class="f-title"><spring:message code="about.us"/></h2>
      <p class="f-blurb"><spring:message code="about.us.text"/></p>
    </div>

    <nav aria-label="Footer">
      <h2 class="f-title"><spring:message code="quick.links"/></h2>
      <ul class="f-links">
        <li><a href="<menu:tasksTag/>"><spring:message code="menu.tasks.label"/></a></li>
        <li><a href="<menu:testsTag/>"><spring:message code="tests"/></a></li>
        <c:if test="${pageLanguage!='ru'}">
          <li><a href="<menu:questionsTag/>"><spring:message code="questions.interviews"/></a></li>
        </c:if>
        <li><a href="<menu:articlesTag/>"><spring:message code="articles"/></a></li>
        <li><a href="${pageContext.request.contextPath}/show-login-page"><spring:message code="log.in"/></a></li>
        <li><a href="${pageContext.request.contextPath}/register"><spring:message code="register"/></a></li>
        <li><a href="<menu:privacyTag/>"><spring:message code="privacy"/></a></li>
      </ul>
    </nav>
    <div class="f-follow">
      <h2 class="f-title"><spring:message code="follow.us"/></h2>
      <ul class="social-grid">
        <li><a href=""https://www.patreon.com/bePatron?u=71601793" target="_blank" rel="noopener nofollow sponsored" aria-label="Patreon" title="Patreon">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
          <em>Patreon</em>
        </a></li>
        <li><a href="https://ko-fi.com/examclouds" target="_blank" rel="noopener nofollow sponsored" aria-label="Ko-fi" title="Ko-fi">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M18 8h1a4 4 0 0 1 0 8h-1"/><path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4z"/><line x1="6" y1="2" x2="6" y2="4"/><line x1="10" y1="2" x2="10" y2="4"/><line x1="14" y1="2" x2="14" y2="4"/></svg>
          <em>Ko-fi</em>
        </a></li>
        <li><a href="https://www.youtube.com/c/tatyanamilkina" target="_blank" rel="noopener nofollow sponsored" aria-label="YouTube" title="YouTube">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33A2.78 2.78 0 0 0 3.4 19c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.25 29 29 0 0 0-.46-5.33z"/><polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02"/></svg>
          <em>YouTube</em>
        </a></li>
        <li><a href="https://www.facebook.com/Examclouds" target="_blank" rel="noopener nofollow sponsored" aria-label="Facebook" title="Facebook">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"/></svg>
          <em>Facebook</em>
        </a></li>
        <li><a href="https://x.com/ExamClouds" target="_blank" rel="noopener nofollow sponsored" aria-label="X" title="X">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M18.244 2H21.5l-7.49 8.56L23 22h-6.91l-5.41-6.65L4.4 22H1.14l8.02-9.17L1 2h7.09l4.89 6.04L18.244 2zm-1.213 18h1.92L7.06 4H5.01l12.02 16z"/></svg>
          <em>X</em>
        </a></li>
        <li><a href="https://www.linkedin.com/groups/13093432/" target="_blank" rel="noopener nofollow sponsored" aria-label="LinkedIn" title="LinkedIn">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-4 0v7h-4v-7a6 6 0 0 1 6-6z"/><rect x="2" y="9" width="4" height="12"/><circle cx="4" cy="4" r="2"/></svg>
          <em>LinkedIn</em>
        </a></li>
        <li><a href="https://t.me/examclouds/" target="_blank" rel="noopener nofollow sponsored" aria-label="Telegram" title="Telegram">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
          <em>Telegram</em>
        </a></li>
        <li><a href="https://www.udemy.com/course/java-bup/" target="_blank" rel="noopener nofollow sponsored" aria-label="Udemy" title="Udemy">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M22 10v6M2 10l10-5 10 5-10 5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg>
          <em>Udemy</em>
        </a></li>
      </ul>
      <a class="f-mail" href="mailto:tatyana.milkina@gmail.com">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
        tatyana.milkina@gmail.com
      </a>
    </div>
  </div>

  <div class="footer-bot dark">
    <div class="container">
      <p>&copy; <span data-year>2026</span> ExamClouds. <spring:message code="free.java.learning"/>. All Rights Reserved.</p>
    </div>
  </div>
</footer>
<script src="${pageContext.request.contextPath}/js/main1.js" defer></script>
