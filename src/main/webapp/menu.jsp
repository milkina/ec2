<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
      <a href="<menu:homeTag/>"><i class="fas fa-home"></i> <spring:message code="home"/></a>
       <div class="mega-dropdown desktop-only">
           <button class="mega-toggle">
                <spring:message code="courses"/>
                 <i class="fas fa-chevron-down arrow"></i>
           </button>
           <div class="mega-menu">
               <div class="mega-container">
                 <c:if test="${pageLanguage=='ru'}">
                     <jsp:include page="/menu-mega-ru.jsp"/>
                 </c:if>
                 <c:if test="${pageLanguage!='ru'}">
                     <jsp:include page="/menu-mega.jsp"/>
                 </c:if>
               </div>
        </div>
      </div>
      <div class="dropdown mobile-only">
          <button type="button" class="dropdown-toggle">
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
      <a href="<menu:testsTag/>" id="tests"><i class="fas fa-check-square"></i> <spring:message code="tests"/></a>
      <a href="<menu:questionsTag/>" id="questions"><i class="fas fa-question-circle"></i> <spring:message code="questions.interviews"/></a>
      <a href="<menu:tasksTag/>" id="tasks"><i class="fas fa-code"></i> <spring:message code="menu.tasks.label"/></a>
      <c:if test="${pageLanguage!='en'}">
          <a href="${pageContext.request.contextPath}/ru/video-java-uroki"><i class="fas fa-play-circle"></i> <spring:message code="video.uroki"/></a>
      </c:if>
      <a href="<menu:articlesTag/>"><i class="fas fa-newspaper"></i> <spring:message code="articles"/></a>
      <c:choose>
                <c:when test="${param.param != null || person == null}">
      		       <a href="${pageContext.request.contextPath}/show-login-page" id='my-profile'>
      		         <spring:message code="log.in"/>
      		       </a>
      		  </c:when>
                <c:otherwise>
                    <div class="dropdown">
                              <button class="dropdown-toggle" id="userLogin">
                                <i class="fas fa-user-circle"></i> ${person.login}
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
  const megaToggle = document.querySelector(".mega-toggle");
  const megaMenu = document.querySelector(".mega-menu");
  const megaDropdown = document.querySelector(".mega-dropdown");
  let megaMenuTimer;

  burger.addEventListener("click", () => {
    nav.classList.toggle("active");
  });
  document.querySelectorAll(".dropdown-toggle").forEach(btn => {
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      e.stopPropagation();
      const menu = btn.nextElementSibling;
      menu.classList.toggle("active");
      if (menu.classList.contains("active")) {
        menu.style.pointerEvents = "none";
        setTimeout(() => { menu.style.pointerEvents = ""; }, 350);
      }
    });
  });

  megaToggle.addEventListener("click", () => {
    megaMenu.classList.toggle("active");
  });

  [megaDropdown, megaMenu].forEach(element => {
    element.addEventListener("mouseenter", () => {
      clearTimeout(megaMenuTimer);
      megaMenu.classList.add("active");
    });

    element.addEventListener("mouseleave", () => {
      megaMenuTimer = setTimeout(() => {
        megaMenu.classList.remove("active");
      }, 150);
    });
  });
</script>