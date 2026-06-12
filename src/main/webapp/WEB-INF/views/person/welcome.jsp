<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:wrapper2>
 <jsp:attribute name="header">
    <title><spring:message code="welcome.on"/> ExamClouds</title>
    <meta name="robots" content="noindex">
    <link href="${pageContext.request.contextPath}/css/welcome-user.css?v=1" rel="stylesheet">
 </jsp:attribute>
 <jsp:body>
     <div class="wc-bg">
         <div class="wc-wrap">
           <header class="wc-hero">
             <span class="wc-badge"><span class="dot"></span> <spring:message code="account.created"/></span>
             <div class="wc-emoji" aria-hidden="true">🎉</div>
             <h1 class="wc-title"><spring:message code="welcome.on"/> <span>ExamClouds</span>!</h1>
             <p class="wc-sub">
               <spring:message code="welcome.text"/>
             </p>
           </header>

           <section class="wc-grid" aria-label="<spring:message code='what.you.can.do'/>">
             <a class="wc-card" href="<menu:tasksTag/>">
               <div class="wc-icon yellow" aria-hidden="true">⚡</div>
               <h3><spring:message code="menu.tasks.label"/></h3>
               <p><spring:message code="welcome.tasks.text"/></p>
             </a>
             <a class="wc-card" href="<menu:testsTag/>">
               <div class="wc-icon green" aria-hidden="true">✅</div>
               <h3><spring:message code="tests"/></h3>
               <p><spring:message code="welcome.tests.text"/></p>
             </a>
             <c:set var="courseUrl" value="${pageLanguage=='ru'?'/ru/java-core-russian':'/java-core'}"/>
             <a class="wc-card" href="${pageContext.request.contextPath}${courseUrl}">
               <div class="wc-icon purple" aria-hidden="true">🎓</div>
               <h3><spring:message code="welcome.lessons"/></h3>
               <p><spring:message code="welcome.lessons.text"/></p>
             </a>
              <c:set var="videoUrl" value="${pageLanguage=='ru'?'/ru/video-java-uroki':'/video-lessons'}"/>
              <a class="wc-card" href="${pageContext.request.contextPath}${videoUrl}">
               <div class="wc-icon purple" aria-hidden="true">🎥</div>
               <h3><spring:message code="video.uroki"/></h3>
               <p><spring:message code="welcome.video.text"/></p>
             </a>
           </section>

           <section class="wc-steps">
             <h2><spring:message code="get.started.text"/></h2>
             <ol>
               <li>
                 <span class="wc-step-num">1</span>
                 <div class="wc-step-text">
                   <strong><spring:message code="pick.lesson"/></strong>
                   <span><spring:message code="start.with.course"/></span>
                 </div>
               </li>
               <li>
                 <span class="wc-step-num">2</span>
                 <div class="wc-step-text">
                   <strong><spring:message code="practice.everyday"/></strong>
                   <span><spring:message code="practice.everyday.text"/></span>
                 </div>
               </li>
               <li>
                 <span class="wc-step-num">3</span>
                 <div class="wc-step-text">
                   <strong><spring:message code="test.knowledge"/></strong>
                   <span><spring:message code="test.knowledge.text"/></span>
                 </div>
               </li>
             </ol>
           </section>

           <div class="wc-cta">
             <a class="wc-btn primary" href="${pageContext.request.contextPath}${courseUrl}"><spring:message code="start.course"/> →</a>
             <a class="wc-btn ghost" href="<menu:homeTag/>"><spring:message code="explore.site"/></a>
           </div>
         </div>
       </div>
 </jsp:body>
</t:wrapper2>