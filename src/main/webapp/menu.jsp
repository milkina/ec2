<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<header class="header">
  <div class="container header-container">

    <!-- Лого -->
    <div class="logo">
      <img src="https://img.examclouds.com/general/logo.svg" alt="ExamClouds">
    </div>

    <!-- Навигация -->
    <nav class="nav" id="nav">
      <a href="<menu:homeTag/>"><spring:message code="home"/></a>
      <c:if test="${pageLanguage=='en'}">
      <div class="dropdown">
          <button class="dropdown-toggle">
            <spring:message code="courses"/>
            <i class="fas fa-chevron-down arrow"></i>
          </button>

          <div class="dropdown-menu">
          <c:forEach var="test" items="${TESTS}">
             <c:if test="${test.value.language.code==pageLanguage}">
                 <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>${test.value.fullPathName}" id="${test.value.pathName}">
                                              ${test.value.name}</a>
             </c:if>
          </c:forEach>
          </div>
        </div>
        </c:if>

      <a href="<menu:testsTag/>" id="tests"><spring:message code="tests"/></a>
      <a href="<menu:questionsTag/>" id="questions"><spring:message code="questions.interviews"/></a>
      <a href="<menu:tasksTag/>" id="tasks"><spring:message code="menu.tasks.label"/></a>
      <c:if test="${pageLanguage!='en'}">
          <a href="${pageContext.request.contextPath}/ru/video-java-uroki"><spring:message code="video.uroki"/></a>
      </c:if>
      <a href="<menu:articlesTag/>"><spring:message code="articles"/></a>
      <c:choose>
                <c:when test="${param.param != null || person == null}">
      		       <a href="${pageContext.request.contextPath}/show-login-page" id='my-profile'>
      		         <spring:message code="log.in"/>
      		       </a>
      		  </c:when>
                <c:otherwise>
                    <div class="dropdown glyphicon glyphicon-user">
                              <button class="dropdown-toggle" id="userLogin">
                                ${person.login}
                                <i class="fas fa-chevron-down arrow"></i>
                              </button>
                              <div class="dropdown-menu">
                                        <c:if test="${person.sysadmin}">
                                                                    <a href="<%=request.getContextPath()%>/show-administration">
                                                                               <spring:message code="administration.panel"/></a>
                                                                </c:if>
                                      <a href="${pageContext.request.contextPath}/show-user-profile">
                                                                      <spring:message code="my.profile.label"/>
                                                                   </a>
                                      <a href="${pageContext.request.contextPath}/logout" id="isLogin"><spring:message code="logout"/></a>

                              </div>
                    </div>
                </c:otherwise>
              </c:choose>
    </nav>

    <!-- Языки -->
    <div class="lang">
      <form method="post" action="${ruUrl}">
                         <input type="hidden" name="lang" value="ru">
                         <input type="hidden" name="pageLanguage" value="ru">
                         <button type="submit"><spring:message code="language.ru"/></button>
                       </form>
      <form method="post" action="${enUrl}">
                          <input type="hidden" name="lang" value="en">
                          <input type="hidden" name="pageLanguage" value="en">
                          <button type="submit"><spring:message code="language.en"/></button>
                       </form>
    </div>
    <!-- Бургер -->
    <div class="burger" id="burger">
      <span></span>
      <span></span>
      <span></span>
    </div>

  </div>
</header>
<script>
  const burger = document.getElementById("burger");
  const nav = document.getElementById("nav");

  burger.addEventListener("click", () => {
    nav.classList.toggle("active");
  });
  document.querySelectorAll(".dropdown-toggle").forEach(btn => {
    btn.addEventListener("click", () => {
      const menu = btn.nextElementSibling;
      menu.classList.toggle("active");
    });
  });
</script>