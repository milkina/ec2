<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<header class="site-header dark-header">
  <div class="container header-row">
    <a href="<menu:homeTag/>" class="brand">
      <div class="logo">
            <img src="https://img.examclouds.com/general/logo.svg" alt="ExamClouds" width="122" height="49" fetchpriority="high">
          </div>
    </a>
    <nav class="nav" aria-label="Primary">
      <a href="<menu:homeTag/>" data-nav="home" class="is-active"><spring:message code="home"/></a>

      <!-- Courses dropdown trigger (mega menu) -->
      <c:if test="${pageLanguage == 'ru'}">
        <%@ include file="header-mega-menu-ru.jsp"%>
      </c:if>
      <c:if test="${pageLanguage != 'ru'}">
        <%@ include file="header-mega-menu.jsp"%>
      </c:if>
      <a href="<menu:testsTag/>" id="tests" data-nav="tests"><spring:message code="tests"/></a>
      <c:if test="${pageLanguage!='ru'}">
        <a href="<menu:questionsTag/>" id="questions" data-nav="interview"><spring:message code="questions.interviews"/></a>
      </c:if>
      <a href="<menu:tasksTag/>" id="tasks" data-nav="tasks"><spring:message code="menu.tasks.label"/></a>
      <c:if test="${pageLanguage=='ru'}">
           <a href="${pageContext.request.contextPath}/ru/video-java-uroki"><i class="fas fa-play-circle"></i> <spring:message code="video.uroki"/></a>
      </c:if>
       <c:if test="${pageLanguage=='en'}">
            <a href="${pageContext.request.contextPath}/video-lessons"><i class="fas fa-play-circle"></i> <spring:message code="video.uroki"/></a>
       </c:if>
      <a href="<menu:articlesTag/>" data-nav="articles"><spring:message code="articles"/></a>
    </nav>

    <div class="header-cta">
      <!-- Language switcher -->
      <%@ include file="switch-languages-form.jsp"%>

      <c:choose>
        <c:when test="${param.param != null || person == null}">
          <!-- Logged-OUT block -->
          <div class="auth-out">
            <a class="login" href="${pageContext.request.contextPath}${pageLanguage=='ru'?'/ru':''}/show-login-page" id="my-profile">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
              <spring:message code="log.in"/>
            </a>
          </div>
        </c:when>
        <c:otherwise>
          <!-- Logged-IN block (hidden until body.is-auth is set) -->
          <div class="auth-out">
            <div class="user-menu">
              <button type="button" class="user-trigger" data-user-toggle aria-expanded="false" aria-haspopup="menu" id="userLogin">
                <svg class="avatar" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="4"/><path d="M4 21a8 8 0 0 1 16 0"/></svg>
                <span data-username>${person.login}</span>
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
              </button>
              <div class="user-dropdown" data-user-panel hidden role="menu">
                <!-- Admins only — gate server-side or hide via body.is-admin -->
                <c:if test="${person.sysadmin}">
                  <a href="<%=request.getContextPath()%>/show-administration" role="menuitem">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 1 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 1 1-4 0v-.09a1.65 1.65 0 0 0-1-1.51 1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 1 1-2.83-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 1 1 0-4h.09a1.65 1.65 0 0 0 1.51-1 1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 1 1 2.83-2.83l.06.06a1.65 1.65 0 0 0 1.82.33h0a1.65 1.65 0 0 0 1-1.51V3a2 2 0 1 1 4 0v.09a1.65 1.65 0 0 0 1 1.51h0a1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 1 1 2.83 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82v0a1.65 1.65 0 0 0 1.51 1H21a2 2 0 1 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>
                    <spring:message code="administration.panel"/>
                  </a>
                </c:if>
                <a href="${pageContext.request.contextPath}/show-user-profile" role="menuitem">
                  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                  <spring:message code="my.profile.label"/>
                </a>
                <hr/>
                <a href="${pageContext.request.contextPath}/${pageLanguage=='ru'?'ru/':''}logout" data-signout role="menuitem" id="isLogin">
                  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
                  <spring:message code="logout"/>
                </a>
              </div>
            </div>
          </div>
        </c:otherwise>
       </c:choose>
    </div>
    <button class="menu-btn" type="button" aria-label="Toggle menu" aria-expanded="false" data-mobile-toggle>
      <svg class="i-menu" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="4" y1="6" x2="20" y2="6"/><line x1="4" y1="12" x2="20" y2="12"/><line x1="4" y1="18" x2="20" y2="18"/></svg>
      <svg class="i-close" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
    </button>
  </div>

  <!-- Mobile nav: courses shown as a flat list (Java Core, Web Services) -->
  <div class="mobile-nav" data-mobile-nav>
    <div class="container links">
      <a href="<menu:homeTag/>" data-nav="home" class="is-active"><spring:message code="home"/></a>
      <details class="m-courses">
        <summary>
          <span><spring:message code="courses"/></span>
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
        </summary>
         <c:forEach var="test" items="${TESTS}">
                          <c:if test="${test.value.language.code==pageLanguage && !test.value.pathName.equals('jpa')}">
                              <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>${test.value.fullPathName}" id="${test.value.pathName}">
                                  ${test.value.name}</a>
                          </c:if>
                      </c:forEach>
      </details>
      <a href="<menu:testsTag/>" id="tests" data-nav="tests"><spring:message code="tests"/></a>
      <c:if test="${pageLanguage!='ru'}">
          <a href="<menu:questionsTag/>" id="questions" data-nav="interview"><spring:message code="questions.interviews"/></a>
      </c:if>
      <a href="<menu:tasksTag/>" id="tasks" data-nav="tasks"><spring:message code="menu.tasks.label"/></a>
      <c:if test="${pageLanguage=='ru'}">
         <a href="${pageContext.request.contextPath}/ru/video-java-uroki"><i class="fas fa-play-circle"></i> <spring:message code="video.uroki"/></a>
      </c:if>
      <c:if test="${pageLanguage=='en'}">
                  <a href="${pageContext.request.contextPath}/video-lessons"><i class="fas fa-play-circle"></i> <spring:message code="video.uroki"/></a>
             </c:if>
      <a href="<menu:articlesTag/>" data-nav="articles"><spring:message code="articles"/></a>

      <c:choose>
        <c:when test="${param.param != null || person == null}">
          <div class="row m-row-top">
            <%@ include file="switch-languages-form.jsp"%>
            <a class="m-login" href="${pageContext.request.contextPath}${pageLanguage=='ru'?'/ru':''}/show-login-page" id="my-profile"><spring:message code="log.in"/></a>
          </div>
        </c:when>
        <c:otherwise>
          <div class="row m-row-top">
            <%@ include file="switch-languages-form.jsp"%>
            <div class="m-user">
              <svg class="avatar" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="4"/><path d="M4 21a8 8 0 0 1 16 0"/></svg>
              <span data-username>${person.login}</span>
            </div>
          </div>
          <a class="m-item m-admin" href="<%=request.getContextPath()%>/show-administration">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 1 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 1 1-4 0v-.09a1.65 1.65 0 0 0-1-1.51 1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 1 1-2.83-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 1 1 0-4h.09a1.65 1.65 0 0 0 1.51-1 1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 1 1 2.83-2.83l.06.06a1.65 1.65 0 0 0 1.82.33h0a1.65 1.65 0 0 0 1-1.51V3a2 2 0 1 1 4 0v.09a1.65 1.65 0 0 0 1 1.51h0a1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 1 1 2.83 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82v0a1.65 1.65 0 0 0 1.51 1H21a2 2 0 1 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>
            <spring:message code="administration.panel"/>
          </a>
          <a class="m-item" href="${pageContext.request.contextPath}/show-user-profile">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
            <spring:message code="my.profile.label"/>
          </a>
          <a href="${pageContext.request.contextPath}/${pageLanguage=='ru'?'ru/':''}logout" class="m-item m-signout" data-signout role="menuitem" id="isLogin">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
            <spring:message code="logout"/>
          </a>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</header>
