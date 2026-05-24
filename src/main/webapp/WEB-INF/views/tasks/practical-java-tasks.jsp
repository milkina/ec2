<%@ page trimDirectiveWhitespaces="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:wrapper2>
    <jsp:attribute name="header">
     <meta name="description" content="Practice Java programming with real tasks. Improve your skills through training exercises and interview-style problems.">
     <title>Java Practice Tasks | Coding Exercises and Training | ExamClouds</title>
     <link rel="canonical" href="https://www.examclouds.com/practical-java-tasks">
     <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/practicheskie-zadachi">
     <link rel="alternate" hreflang="en" href="https://www.examclouds.com/practical-java-tasks">
     <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/practical-java-tasks">
     <meta property="og:title" content="Java Practice Tasks | Coding Exercises and Training | ExamClouds">
     <meta property="og:type" content="article">
     <meta property="og:description" content="Practice Java programming with real tasks. Improve your skills through training exercises and interview-style problems.">
     <meta property="og:site_name" content="ExamClouds">
     <meta property="og:url" content="https://www.examclouds.com/practical-java-tasks">
     <meta property="twitter:title" content="Java Practice Tasks | Coding Exercises and Training | ExamClouds">
     <meta property="twitter:card" content="summary_large_image">
     <meta property="twitter:description" content="Practice Java programming with real tasks. Improve your skills through training exercises and interview-style problems.">
     <meta property="twitter:site" content="@ExamClouds">
     <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
     <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
     <meta property="twitter:image:alt" content="Java Practice Tasks | Coding Exercises and Training | ExamClouds">
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Java Practice Tasks",
  "description": "Practice Java programming with real tasks. Improve your skills through training exercises and interview-style problems.",
  "author": {
    "@type": "Organization",
    "name": "ExamClouds"
  },
  "publisher": {
    "@type": "Organization",
    "name": "ExamClouds",
    "logo": {
      "@type": "ImageObject",
      "url": "https://img.examclouds.com/general/logo.svg"
    }
  },
  "mainEntityOfPage": "https://www.examclouds.com/practical-java-tasks"
}
</script>
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
               }
             ]
           }</script>
            <!-- Hero -->
                 <section class="panel tasks-hero">
                   <div class="tasks-hero-icon" aria-hidden="true">&lt;/&gt;</div>
                   <div>
                     <h1 style="font-size:clamp(1.5rem,2.4vw,2rem);margin:0 0 .5rem;">Java practice tasks</h1>
                     <p style="color:var(--muted-fg);margin:0;max-width:60ch;">
                       Coding exercises and interview-style problems. Work through real tasks
                       from basics to collections and algorithms — sorted by topic and level.
                     </p>
                   </div>
                 </section>

                       <!-- 2-column grid -->
                       <div class="course-ux-grid" style="margin-top:1.25rem;">
                         <!-- ============ MAIN ============ -->
                         <div style="display:grid;gap:1rem;min-width:0;">
 <c:forEach var="category" items="${TESTS['java-core'].categories}">
                        <c:if test="${category.value.hidden==false && category.value.name.equals('Tasks')}">

                           <article class="task-card panel">
                             <div class="task-card-head">
                               <h3>${category.value.parentCategory.name}</h3>
                               <div class="task-tags">
                                 <span class="tag tag-beginner">Beginner</span>
                                 <span class="tag tag-topic">${TESTS['java-core'].name}</span>
                               </div>
                             </div>
                             <p class="task-desc">${category.value.article.description}</p>
                             <div class="task-foot">
                               <span class="task-meta">⏱ ~20 min</span>
                               <!--<span class="task-meta">☰ 5 tasks</span>-->
                               <a class="task-open" href="${pageContext.request.contextPath}/<spring:message code='menu.home'/>java/${'java-core'}/${category.value.pathName}">Open →</a>
                             </div>
                           </article>
  </c:if>
                    </c:forEach>


                         </div>

                         <!-- ============ RIGHT PANEL ============ -->
                         <aside class="course-ux-side">
                           <div class="panel">
                             <h2 class="side-h">Overview</h2>
                             <div class="overview-grid">
                              <!-- <div class="ov-cell"><b>6</b><span>task sets</span></div>
                               <div class="ov-cell"><b>42</b><span>exercises</span></div>-->
                               <div class="ov-cell"><b>6</b><span><spring:message code='modules'/></span></div>
                               <div class="ov-cell"><b>Free</b><span>all access</span></div>
                             </div>
                           </div>

                           <div class="panel">
                             <h2 class="side-h"><spring:message code='modules'/></h2>
                             <ul class="topic-list">
                              <c:forEach var="category" items="${TESTS['java-core'].categories}">
                                                     <c:if test="${category.value.hidden==false && category.value.name.equals('Tasks')}">

                               <li><a href="${pageContext.request.contextPath}/<spring:message code='menu.home'/>java/${'java-core'}/${category.value.pathName}"><span class="t-ic">⌘</span><span class="t-name">${category.value.parentCategory.name}</span><!--<span class="t-count">5</span>--></a></li>
                               </c:if>
                             </c:forEach>
                             </ul>
                           </div>
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
