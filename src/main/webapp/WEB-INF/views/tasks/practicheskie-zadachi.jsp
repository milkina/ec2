<%@ page trimDirectiveWhitespaces="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:wrapper2>
    <jsp:attribute name="header">
     <c:set var="hubDescription"><spring:message code="hub.tasks.${TASKS_TOTAL_FORM}" arguments="${TASKS_TOTAL}"/> по <spring:message code="hub.topics.${MODULES_TOTAL_FORM}" arguments="${MODULES_TOTAL}"/> Java Core: от первой программы до коллекций, Stream API и многопоточности. Подсказки, видеоразборы, подходят для лабораторных работ.</c:set>
     <link href="${pageContext.request.contextPath}/css/pr-tasks.css?v=3" rel="stylesheet">
     <meta name="description" content="${fn:escapeXml(hubDescription)}">
     <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
     <title>Задачи по Java для начинающих с решениями | ExamClouds</title>
     <link rel="canonical" href="https://www.examclouds.com/ru/practicheskie-zadachi">
     <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/practicheskie-zadachi">
     <link rel="alternate" hreflang="en" href="https://www.examclouds.com/practical-java-tasks">
     <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/practical-java-tasks">
     <meta property="og:title" content="Задачи по Java для начинающих с решениями | ExamClouds">
     <meta property="og:type" content="article">
     <meta property="og:description" content="${fn:escapeXml(hubDescription)}">
     <meta property="og:site_name" content="ExamClouds">
     <meta property="og:url" content="https://www.examclouds.com/ru/practicheskie-zadachi">
     <meta property="twitter:title" content="Задачи по Java для начинающих с решениями | ExamClouds">
     <meta property="twitter:card" content="summary_large_image">
     <meta property="twitter:description" content="${fn:escapeXml(hubDescription)}">
     <meta property="twitter:site" content="@ExamClouds">
     <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
     <meta property="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
     <meta property="twitter:image:alt" content="Задачи по Java для начинающих с решениями | ExamClouds">
<script type="application/ld+json">{
  "@context": "https://schema.org",
  "@type": "LearningResource",
  "learningResourceType": "Assignment",
  "name": "Практические задачи по Java",
  "description": "<spring:escapeBody javaScriptEscape="true">${hubDescription}</spring:escapeBody>",
  "url": "https://www.examclouds.com/ru/practicheskie-zadachi",
  "inLanguage": "ru",
  "author": {
    "@type": "Person",
    "name": "Tatyana Milkina",
    "url": "https://www.examclouds.com/ru/tatyana-milkina"
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
                 "item": "https://www.examclouds.com/ru/practicheskie-zadachi"
               }
             ]
           }</script>
            <!-- Hero -->
                 <section class="panel tasks-hero">
                   <div class="tasks-hero-icon" aria-hidden="true">&lt;/&gt;</div>
                   <div>
                     <h1 style="font-size:clamp(1.5rem,2.4vw,2rem);margin:0 0 .5rem;">Практические задачи по Java с решениями</h1>
                     <p style="color:var(--muted-fg);margin:0;">
                       На ExamClouds собрано <spring:message code="hub.tasks.${TASKS_TOTAL_FORM}" arguments="${TASKS_TOTAL}"/> по Java Core, разбитых на <spring:message code="hub.modules.${MODULES_TOTAL_FORM}" arguments="${MODULES_TOTAL}"/> по темам курса: синтаксис, ООП, строки, коллекции, Stream API, исключения, ввод-вывод, JDBC и многопоточность. К части задач есть решение и видеоразбор. Задачи идут от простых к сложным и подходят для самостоятельной практики, лабораторных работ и подготовки к собеседованию.
                     </p>
                     <c:set var="shop" value="${PROJECTS['online-shop']}"/>
                     <c:if test="${shop != null && fn:length(shop.parts) >= 3}">
                       <p class="project-teaser"><a href="#project"><spring:message code="project.teaser" arguments="${fn:length(shop.parts)}"/> &darr;</a></p>
                     </c:if>
                     <jsp:include page="/WEB-INF/views/tasks/_hub-levels-nav.jsp"/>
                   </div>
                 </section>

                       <!-- 2-column grid -->
                       <div class="tasks-ux-grid">
                         <!-- ============ MAIN ============ -->
                         <div>
<jsp:include page="/WEB-INF/views/tasks/_hub-groups.jsp"/>


                         </div>

                         <!-- ============ RIGHT PANEL ============ -->
                         <aside>
                           <div class="panel task-ux-side">
                             <h2 class="side-h">Обзор</h2>
                             <div class="overview-grid">
                               <div class="ov-cell"><b>${MODULES_TOTAL}</b><span><spring:message code='modules'/></span></div>
                               <div class="ov-cell"><b>Free</b><span>весь доступ</span></div>
                             </div>
                           </div>
                           <jsp:include page="/WEB-INF/promo/udemy-promo.jsp"/>
                           <jsp:include page="/WEB-INF/author/author-mini-card.jsp"/>
                           <div class="panel tip-panel">
                             <span class="tip-ic">💡</span>
                             <p>Новичок в Java? Начните с полного <a href="${pageContext.request.contextPath}/ru/java-core-russian">курса Java Core</a> — задачи станут понятнее.</p>
                           </div>
                         </aside>
                       </div>
            </div>
        </main>
    </jsp:body>
</t:wrapper2>