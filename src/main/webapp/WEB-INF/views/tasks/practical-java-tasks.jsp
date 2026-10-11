<%@ page trimDirectiveWhitespaces="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:wrapper2>
    <jsp:attribute name="header">
     <c:set var="hubDescription">${TASKS_TOTAL} Java practice exercises across <spring:message code="hub.topics.${MODULES_TOTAL_FORM}" arguments="${MODULES_TOTAL}"/> of Java Core: from your first program to OOP, lambdas and the Stream API. Hints and video walkthroughs included.</c:set>
     <link href="${pageContext.request.contextPath}/css/pr-tasks.css?v=5" rel="stylesheet">
     <meta name="description" content="${fn:escapeXml(hubDescription)}">
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
     <title>Java Practice Exercises and Assignments for Beginners | ExamClouds</title>
     <link rel="canonical" href="https://www.examclouds.com/practical-java-tasks">
     <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/practicheskie-zadachi">
     <link rel="alternate" hreflang="en" href="https://www.examclouds.com/practical-java-tasks">
     <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/practical-java-tasks">
     <meta property="og:title" content="Java Practice Exercises and Assignments for Beginners | ExamClouds">
     <meta property="og:type" content="article">
     <meta property="og:description" content="${fn:escapeXml(hubDescription)}">
     <meta property="og:site_name" content="ExamClouds">
     <meta property="og:url" content="https://www.examclouds.com/practical-java-tasks">
     <meta property="twitter:title" content="Java Practice Exercises and Assignments for Beginners | ExamClouds">
     <meta property="twitter:card" content="summary_large_image">
     <meta property="twitter:description" content="${fn:escapeXml(hubDescription)}">
     <meta property="twitter:site" content="@ExamClouds">
     <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
     <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
     <meta property="twitter:image:alt" content="Java Practice Exercises and Assignments for Beginners | ExamClouds">
<script type="application/ld+json">{
  "@context": "https://schema.org",
  "@type": "LearningResource",
  "learningResourceType": "Assignment",
  "name": "Java Practice Exercises and Assignments",
  "description": "<spring:escapeBody javaScriptEscape="true">${hubDescription}</spring:escapeBody>",
  "url": "https://www.examclouds.com/practical-java-tasks",
  "inLanguage": "en",
  "author": {
    "@type": "Person",
    "name": "Tatyana Milkina",
    "url": "https://www.examclouds.com/tatyana-milkina"
  },
  "provider": {
    "@type": "Organization",
    "name": "ExamClouds",
    "url": "https://www.examclouds.com"
  }
}</script>
 <style>
      .category-name:before{
        content:"<spring:message code="module"/> " counter(lesson)" - ";
      }
      #categories li:hover::before {
        content: "<spring:message code="open"/> →";
        position: absolute;
        bottom: 15px;
        right: 15px;
        color: #4DA3FF;
        font-size: 13px;
      }
     </style>
    </jsp:attribute>
    <jsp:body>
    <main style="padding: 1.5rem 0 3rem;">
        <div class="container">
          <nav class="crumbs" aria-label="Breadcrumb">
            <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>"><spring:message code="home"/></a>
            <span class="sep">›</span>
            <span class="here"><spring:message code="menu.tasks.label"/></span>
          </nav>
          <script type="application/ld+json">{
             "@context": "https://schema.org",
             "@type": "BreadcrumbList",
             "itemListElement": [
               {
                 "@type": "ListItem",
                 "position": 1,
                 "name": "<spring:message code="home"/>",
                 "item": "https://www.examclouds.com/<spring:message code="menu.home"/>"
               },
               {
                 "@type": "ListItem",
                 "position": 2,
                 "name": "<spring:message code="menu.tasks.label"/>",
                 "item": "https://www.examclouds.com/practical-java-tasks"
               }
             ]
           }</script>
            <!-- Hero -->
                 <section class="panel tasks-hero">
                   <div class="tasks-hero-icon" aria-hidden="true">&lt;/&gt;</div>
                   <div>
                     <h1 style="font-size:clamp(1.5rem,2.4vw,2rem);margin:0 0 .5rem;">Java Practice Exercises and Coding Tasks</h1>
                     <p style="color:var(--muted-fg);margin:0;">
                       ExamClouds has <spring:message code="hub.tasks.${TASKS_TOTAL_FORM}" arguments="${TASKS_TOTAL}"/> for Java Core practice, split into <spring:message code="hub.modules.${MODULES_TOTAL_FORM}" arguments="${MODULES_TOTAL}"/> that follow the course: syntax, operators, control flow, arrays, OOP, the static keyword, Object methods, interfaces and enums, lambdas, the Stream API and algorithms. Many tasks come with a hint, and some with a solution and a video walkthrough. Tasks go from simple to more advanced and work for self-study, lab assignments and interview preparation.
                     </p>
                     <c:if test="${FEATURED_PROJECT != null}">
                       <p class="project-teaser"><a href="#project-${FEATURED_PROJECT.code}"><c:out value="${FEATURED_PROJECT.title}"/> &darr;</a></p>
                     </c:if>
                     <jsp:include page="/WEB-INF/views/tasks/_hub-levels-nav.jsp"/>
                   </div>
                 </section>

                       <!-- 2-column grid -->
                       <div class="tasks-ux-grid">
                         <!-- ============ MAIN ============ -->
                         <div>
                        <jsp:include page="/WEB-INF/views/tasks/_hub-groups.jsp"/>
                        <jsp:include page="/WEB-INF/views/tasks/_hub-faq-en.jsp"/>


                         </div>

                         <!-- ============ RIGHT PANEL ============ -->
                         <aside>
                           <div class="panel task-ux-side">
                             <p class="side-h">Overview</p>
                             <div class="overview-grid">
                               <div class="ov-cell"><b>${MODULES_TOTAL}</b><span><spring:message code='modules'/></span></div>
                               <div class="ov-cell"><b>Free</b><span>all access</span></div>
                             </div>
                           </div>
                          <jsp:include page="/WEB-INF/author/author-mini-card.jsp"/>
<!--
                           <div class="panel">
                             <h2 class="side-h">Your progress</h2>
                             <div class="prog-row"><span>Getting started</span><span class="prog-val">1 / 5</span></div>
                             <div class="bar"><span style="width:20%"></span></div>
                             <div class="prog-row" style="margin-top:.85rem;"><span>Syntax</span><span class="prog-val">3 / 7</span></div>
                             <div class="bar"><span style="width:43%"></span></div>
                             <div class="prog-row" style="margin-top:.85rem;"><span>Arrays</span><span class="prog-val">0 / 7</span></div>
                             <div class="bar"><span style="width:0%"></span></div>
                           </div>-->

                           <div class="panel tip-panel">
                             <span class="tip-ic">💡</span>
                             <p>New to Java? Start with the full <a href="${pageContext.request.contextPath}/java-core">Java Core course</a> first — tasks will make more sense.</p>
                           </div>
                         </aside>
                       </div>
            </div>
        </main>
    </jsp:body>
</t:wrapper2>
