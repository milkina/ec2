<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri = "http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<t:wrapper2>
  <jsp:attribute name="header">
    <title>Tatyana Milkina - Java developer and the author | ExamClouds</title>
    <meta name="description" content="Tatyana Milkina is a Java developer and the author of ExamClouds. Courses, hands-on practice, and Java training from scratch to a confident developer level.">
     <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/tatyana-milkina">
     <link rel="alternate" hreflang="en" href="https://www.examclouds.com/tatyana-milkina">
     <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/tatyana-milkina">
     <link rel="canonical" href="https://www.examclouds.com/tatyana-milkina">
     <meta property="og:title" content="Tatyana Milkina - Java developer and the author | ExamClouds">
             <meta property="og:type" content="article">
             <meta property="og:description" content="Tatyana Milkina is a Java developer and the author of ExamClouds. Courses, hands-on practice, and Java training from scratch to a confident developer level.">
             <meta property="og:site_name" content="ExamClouds">
             <meta property="og:url" content="https://www.examclouds.com/tatyana-milkina">
             <meta property="og:published_time" content="2026-22-04T12:00:00Z">
             <meta property="og:modified_time" content="2026-22-04T12:00:00Z">
             <meta property="og:image" content="https://img.examclouds.com/general/tatyana-milkina-small.jpg">
             <meta property="og:image:alt" content="Tatyana Milkina - Java developer and the author | ExamClouds">
     <meta name="twitter:title" content="Tatyana Milkina - Java developer and the author | ExamClouds">
         <meta name="twitter:card" content="summary">
         <meta name="twitter:description" content="Tatyana Milkina is a Java developer and the author of ExamClouds. Courses, hands-on practice, and Java training from scratch to a confident developer level.">
         <meta name="twitter:site" content="@ExamClouds">
         <meta name="twitter:image" content="https://img.examclouds.com/general/tatyana-milkina-small.jpg">
         <meta name="twitter:image:alt" content="Tatyana Milkina - Java developer and the author | ExamClouds">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/author.css?v=3" />
 </jsp:attribute>
 <jsp:body>
  <main class="quiz-bg">
      <div class="container quiz-wrap">

        <nav class="quiz-crumbs" aria-label="Breadcrumb">
          <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>"><spring:message code="home"/></a>
          <span class="sep">/</span>
          <span class="current">About the author</span>
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
        </nav>

        <!-- Hero card -->
        <section class="quiz-card author-hero">
          <div class="author-photo-wrap">
            <div class="author-photo" aria-hidden="true">
              <img src="https://img.examclouds.com/general/tatyana-milkina.png" class="author-img" alt="Tatyana Milkina Java Developer" />
            </div>
           <span class="author-badge">
              <span class="star" aria-hidden="true">★</span> 4.8 rating
            </span>
          </div>

          <div class="author-intro">
            <p class="results-eyebrow">Course author</p>
            <h1 class="results-title">Tatyana Milkina</h1>
            <p class="author-role">Senior Java Developer · Instructor · 10 years in enterprise Java</p>
            <p class="author-lead">
              Tatyana has been writing Java for over a decade — building enterprise back-ends,
              mentoring engineers, and helping students get their first developer job. She created ExamClouds to make Java learning
              structured, free, and actually fun.
            </p>

            <div class="author-actions">
              <a class="btn-primary" href="https://www.udemy.com/course/java-bup/" target="_blank" rel="noopener">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M11.998 0L4.4 4.378v2.225L12 2.226l7.598 4.377V4.378zM6.931 9.91v7.41C6.931 20.715 9.41 23 12.005 23s5.064-2.285 5.064-5.68V9.91h-2.97v7.41c0 1.397-.93 2.503-2.094 2.503-1.164 0-2.105-1.106-2.105-2.503V9.91z"/></svg>
                View course on Udemy
              </a>
                            <a class="btn-ghost" href="https://www.youtube.com/c/tatyanamilkina" target="_blank" rel="noopener">
                              <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.546 15.568V8.432L15.818 12l-6.272 3.568z"/></svg>
                              Youtube
                            </a>
              <a class="btn-ghost" href="https://www.linkedin.com/groups/13093432/" target="_blank" rel="noopener">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M20.45 20.45h-3.55v-5.57c0-1.33-.02-3.04-1.85-3.04-1.85 0-2.13 1.45-2.13 2.94v5.67H9.37V9h3.41v1.56h.05c.47-.9 1.64-1.85 3.37-1.85 3.6 0 4.27 2.37 4.27 5.46v6.28zM5.34 7.43a2.06 2.06 0 1 1 0-4.12 2.06 2.06 0 0 1 0 4.12zM7.12 20.45H3.56V9h3.56v11.45zM22.22 0H1.77C.79 0 0 .77 0 1.72v20.56C0 23.23.79 24 1.77 24h20.45c.98 0 1.78-.77 1.78-1.72V1.72C24 .77 23.2 0 22.22 0z"/></svg>
                LinkedIn
              </a>
            </div>
          </div>
        </section>

        <!-- Stats -->
        <section class="author-stats">
          <div class="author-stat">
            <div class="author-stat-val">10</div>
            <div class="author-stat-label">Years writing Java</div>
          </div>
          <div class="author-stat">
            <div class="author-stat-val">200+</div>
            <div class="author-stat-label">Lessons published</div>
          </div>
          <div class="author-stat">
            <div class="author-stat-val">20k+</div>
            <div class="author-stat-label">Students taught</div>
          </div>
          <div class="author-stat">
            <div class="author-stat-val">4.8★</div>
            <div class="author-stat-label">Avg. course rating</div>
          </div>
        </section>


        <!-- About / experience -->
        <section class="quiz-card author-sectio
        n">
          <h2 class="author-h2">A bit more about Tatyana</h2>
          <ul class="author-bullets">
            <li>
              <span class="ab-ic" aria-hidden="true">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>
              </span>
              <p>Experienced Java developer and author of the ExamClouds project.</p>
            </li>
            <li>
              <span class="ab-ic" aria-hidden="true">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M9 21V9h6v12"/><path d="M3 9h18"/></svg>
              </span>
              <p>Builds enterprise web apps using Java, Spring, and Hibernate for 10+ years.</p>
            </li>
            <li>
              <span class="ab-ic" aria-hidden="true">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M2 12h20"/><path d="M12 2a15.3 15.3 0 0 1 0 20M12 2a15.3 15.3 0 0 0 0 20"/></svg>
              </span>
              <p>International projects in healthcare, HR, and telecommunications.</p>
            </li>
            <li>
              <span class="ab-ic" aria-hidden="true">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M22 10L12 5 2 10l10 5 10-5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg>
              </span>
              <p>Structured learning materials, tests, and practical examples on ExamClouds.</p>
            </li>
          </ul>

          <hr class="author-divider">

          <h3 class="author-h3">Experience</h3>
          <ul class="author-exp">
            <li>
              <span class="ae-ic" aria-hidden="true">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
              </span>
              13+ years in software development
            </li>

            <li>
              <span class="ae-ic" aria-hidden="true">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg>
              </span>
              5+ years teaching Java Core and OOP
            </li>
          </ul>

          <hr class="author-divider">

          <h3 class="author-h3">Topics I write about</h3>
          <ul class="author-topics">
            <li>
              <span class="at-ic" aria-hidden="true">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>
              </span>
              Java Core
            </li>
            <li>
              <span class="at-ic" aria-hidden="true">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><circle cx="6" cy="6" r="2"/><circle cx="6" cy="18" r="2"/><circle cx="18" cy="12" r="2"/><path d="M6 8v8"/><path d="M8 6h6a4 4 0 0 1 4 4"/><path d="M8 18h6a4 4 0 0 0 4-4"/></svg>
              </span>
              OOP Principles
            </li>
            <li>
              <span class="at-ic" aria-hidden="true">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><ellipse cx="12" cy="5" rx="9" ry="3"/><path d="M3 5v6c0 1.66 4.03 3 9 3s9-1.34 9-3V5"/><path d="M3 11v6c0 1.66 4.03 3 9 3s9-1.34 9-3v-6"/></svg>
              </span>
              SQL & Databases
            </li>
            <li>
              <span class="at-ic" aria-hidden="true">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 22 7 12 12 2 7 12 2"/><polyline points="2 12 12 17 22 12"/><polyline points="2 17 12 22 22 17"/></svg>
              </span>
              Collection Framework
            </li>
             <li>
              <span class="at-ic" aria-hidden="true">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><circle cx="6" cy="5" r="2"/><circle cx="18" cy="5" r="2"/><circle cx="12" cy="19" r="2"/><path d="M6 7v4a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V7"/><path d="M12 13v4"/></svg>
              </span>
              Multithreading
            </li>
              <li>
              <span class="at-ic" aria-hidden="true">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>
              </span>
              REST API
            </li>
          </ul>
        </section>

      </div>
    </main>
 </jsp:body>
 </t:wrapper2>