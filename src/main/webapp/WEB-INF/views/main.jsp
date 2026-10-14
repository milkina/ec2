<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib uri="/WEB-INF/tld/cache-tagjsp-taglib.tld" prefix="cache"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- Числа (уроки, задачи, тестовые вопросы, модули, часы) — HomeUtility.addHomeToModel (курс java-core). --%>
<spring:message code="home.lessons.${HOME_LESSONS_FORM}" arguments="${HOME_LESSONS}" var="lessonsText"/>
<spring:message code="home.tasks.${HOME_TASKS_FORM}" arguments="${HOME_TASKS}" var="tasksText"/>
<spring:message code="home.tests.${TEST_QUESTIONS_FORM}" arguments="${TEST_QUESTIONS_TOTAL}" var="testsText"/>
<spring:message code="hub.modules.${HOME_MODULES_FORM}" arguments="${fn:length(HOME_MODULES)}" var="modulesText"/>
<c:set var="pageTitle" value="Free Java Course for Beginners — Learn Java Online | ExamClouds"/>
<c:set var="pageDescription" value="Free Java course for beginners: ${lessonsText}, ${tasksText} and ${testsText}. Learn Java Core online at your own pace, no registration."/>
<!doctype html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/head-new.jsp"%>
    <title>${pageTitle}</title>
    <meta name="description" content="${fn:escapeXml(pageDescription)}">
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/">
    <link rel="alternate" hreflang="en" href="https://www.examclouds.com/">
    <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com/">
    <link rel="canonical" href="https://www.examclouds.com/">
    <meta property="og:title" content="${pageTitle}">
    <meta property="og:type" content="website">
    <meta property="og:description" content="${fn:escapeXml(pageDescription)}">
    <meta property="og:site_name" content="ExamClouds">
    <meta property="og:url" content="https://www.examclouds.com/">
    <meta property="og:image" content="https://img.examclouds.com/general/og-home-en.png">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:image:alt" content="Free Java course for beginners — ExamClouds">
    <meta name="twitter:title" content="${pageTitle}">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:description" content="${fn:escapeXml(pageDescription)}">
    <meta name="twitter:site" content="@ExamClouds">
    <meta name="twitter:image" content="https://img.examclouds.com/general/og-home-en.png">
    <meta name="twitter:image:alt" content="Free Java course for beginners — ExamClouds">
    <script type="application/ld+json">{
      "@context": "https://schema.org",
      "@type": "Course",
      "@id": "https://www.examclouds.com/java-core#course",
      "name": "Java Core — free Java course for beginners",
      "description": "<spring:escapeBody javaScriptEscape="true">${pageDescription}</spring:escapeBody>",
      "url": "https://www.examclouds.com/java-core",
      "inLanguage": "en",
      "isAccessibleForFree": true,
      "educationalLevel": "Beginner",
      "teaches": "Java Core: syntax, operators, control flow, arrays, OOP, interfaces and enums, wrapper classes, lambdas, the Stream API, sorting algorithms, exceptions, Git",
      "provider": {"@type": "Organization", "name": "ExamClouds", "url": "https://www.examclouds.com"},
      "author": {"@type": "Person", "name": "Tatyana Milkina", "jobTitle": "Senior Java Developer", "url": "https://www.examclouds.com/tatyana-milkina", "sameAs": ["https://www.youtube.com/c/tatyanamilkina"]},
      "offers": {"@type": "Offer", "category": "Free", "price": 0, "priceCurrency": "EUR"},
      "hasCourseInstance": {"@type": "CourseInstance", "courseMode": "Online", "courseWorkload": "PT${HOME_STUDY_HOURS}H"}
    }</script>
    <script type="application/ld+json">{
      "@context": "https://schema.org",
      "@type": "WebSite",
      "name": "ExamClouds",
      "url": "https://www.examclouds.com/",
      "description": "<spring:escapeBody javaScriptEscape="true">${pageDescription}</spring:escapeBody>",
      "inLanguage": "en",
      "author": {
        "@type": "Person",
        "name": "Tatyana Milkina",
        "url": "https://www.examclouds.com/tatyana-milkina"
      },
      "publisher": {
        "@type": "Organization",
        "name": "ExamClouds",
        "url": "https://www.examclouds.com",
        "logo": {
          "@type": "ImageObject",
          "url": "https://img.examclouds.com/general/logo.png"
        }
      }
    }</script>
</head>
<body itemscope itemtype="https://schema.org/WebPage">
 <%@ include file="/WEB-INF/header.jsp"%>
  <main>
    <!-- ===== HERO ===== -->
    <section class="hero">
      <span class="blob blob-a"></span>
      <span class="blob blob-b"></span>
      <div class="container hero-grid">
        <div>
          <span class="eyebrow">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 3l1.9 5.8L20 11l-5.8 1.9L12 18l-1.9-5.1L4 11l6.1-2.2z"/></svg>
            Free
          </span>
          <h1>Learn <span class="accent">Java</span> Online — Free Java Course for Beginners</h1>
          <p class="lede">${lessonsText} of 5–15 minutes, ${tasksText} and ${testsText} — a free Java Core course built for beginners who want to actually finish it. No registration.</p>
          <div class="hero-actions">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/java-core">
              Start learning free
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
            </a>
          </div>
          <div class="hero-meta">
            <span><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg> <b>20,000</b> learners</span>
            <span><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg> <b>${HOME_LESSONS}</b> lessons</span>
            <span><svg class="star" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg> <b>4.4</b> on Trustpilot</span>
          </div>
        </div>

        <div class="hero-art">
          <div class="backdrop"></div>
          <div class="frame">

            <img src="https://img.examclouds.com/general/index-image.png" alt="Start learning Java? Welcome to ExamClouds"
                 width="750" height="400" title="Start learning Java? Welcome to ExamClouds" fetchpriority="high">
          </div>
        </div>
      </div>
    </section>

    <!-- ===== STATS ===== -->
    <section class="container">
      <div class="stats">
        <div class="stat"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></span><div><p class="v">20,000+</p><p class="l">Active learners</p></div></div>
        <div class="stat"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg></span><div><p class="v">${HOME_LESSONS}</p><p class="l">Free lessons</p></div></div>
        <div class="stat"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg></span><div><p class="v">${HOME_TASKS}</p><p class="l">Practical tasks</p></div></div>
        <div class="stat"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="8" r="7"/><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/></svg></span><div><p class="v">${TEST_QUESTIONS_TOTAL}</p><p class="l">Test questions</p></div></div>
      </div>
    </section>
          <!-- ===== REVIEWS PLATFORMS ===== -->
            <section class="container section">
              <div class="section-head section-head-center">
                <h2>Student reviews</h2>
                <p>Many students are already learning and recommend our course</p>
              </div>
              <div class="reviews-grid-en">
                <article class="review-card">
                  <div class="review-head">
                    <span class="review-logo review-logo-trustpilot">
                      <svg viewBox="0 0 24 24" width="22" height="22" fill="#00b67a" aria-hidden="true"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                      <b>Trustpilot</b>
                    </span>
                    <div class="review-rating">
                      <span class="stars stars-trustpilot" aria-hidden="true">
                        <i></i><i></i><i></i><i></i><i class="half"></i>
                      </span>
                      <span class="review-score">4.4 of 5</span>
                    </div>
                  </div>
                  <p class="review-quote">This site contains good and useful information. Besides theory it was interesting tasks to use knowledge in practice. Also there are sollutions of tasks.</p>
                  <a class="review-link" href="https://www.trustpilot.com/review/examclouds.com" target="_blank" rel="noopener noreferrer">Read all Trustpilot reviews →</a>
                </article>
                <article class="review-card">
                  <div class="review-head">
                    <span class="review-logo review-logo-youtube">
                      <svg viewBox="0 0 24 24" width="26" height="20" aria-hidden="true"><path fill="#ff0000" d="M23 6.2a3 3 0 0 0-2.1-2.1C19 3.6 12 3.6 12 3.6s-7 0-8.9.5A3 3 0 0 0 1 6.2 31 31 0 0 0 .5 12 31 31 0 0 0 1 17.8a3 3 0 0 0 2.1 2.1c1.9.5 8.9.5 8.9.5s7 0 8.9-.5a3 3 0 0 0 2.1-2.1A31 31 0 0 0 23.5 12 31 31 0 0 0 23 6.2z"/><polygon fill="#fff" points="9.75 15.5 15.75 12 9.75 8.5"/></svg>
                      <b>YouTube</b>
                    </span>
                    <div class="review-rating">
                      <span class="review-subs"><b>4K+</b> subscribers</span>
                    </div>
                  </div>
                  <p class="review-quote">I watch lessons on YouTube and follow along with the course — very convenient! The author explains complex topics in an easy and accessible way.</p>
                  <a class="review-link" href="https://www.youtube.com/c/tatyanamilkina" target="_blank" rel="noopener noreferrer">Visit the YouTube channel →</a>
                </article>
              </div>
            </section>

    <!-- ===== PATH PICKER ===== -->
    <section class="container section">
      <div class="section-head">
        <h2>Where do you want to start?</h2>
        <p>Pick the path that fits you today — you can switch any time.</p>
      </div>
      <div class="cards cards-3">
        <article class="path-card card-lift">
          <span class="tag tag-success">Beginner</span>
          <span class="ico-lg"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 10v6M2 10l10-5 10 5-10 5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg></span>
          <h3>New to Java?</h3>
          <p class="desc">Start with the basics. We'll guide you step by step from your first 'Hello World' to writing real classes.</p>
          <a class="link-arrow" href="${pageContext.request.contextPath}/java-core">Start the course →</a>
        </article>
        <article class="path-card card-lift">
          <span class="tag tag-primary">Practice</span>
          <span class="ico-lg"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg></span>
          <h3>Want to practice?</h3>
          <p class="desc">${tasksText} grouped by module and level, with hints and solutions for many of them. Write the code in your own IDE.</p>
          <a class="link-arrow" href="${pageContext.request.contextPath}/practical-java-tasks">Solve tasks →</a>
        </article>
        <article class="path-card card-lift">
          <span class="tag tag-accent">Test yourself</span>
          <span class="ico-lg"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="8" r="7"/><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/></svg></span>
          <h3>Verify your knowledge</h3>
          <p class="desc">Take a free test, find your level, and discover what to learn next.</p>
          <a class="link-arrow" href="${pageContext.request.contextPath}/tests">Take a test →</a>
        </article>
      </div>
    </section>

    <!-- ===== ROADMAP ===== -->
    <section class="band" id="roadmap">
      <div class="container roadmap-grid">
        <div class="roadmap-side">
          <span class="pill">Java Developer Roadmap</span>
          <h2 style="margin-top:1rem;">Your path to becoming a Java developer</h2>
          <p style="margin-top:1rem; color:var(--muted-fg);">A clear, ordered learning path. Each step unlocks the next. Free forever.</p>
          <a class="btn btn-primary btn-sm" style="margin-top:1.5rem;" href="${pageContext.request.contextPath}/java-core">
            Start step 1
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
          </a>
          <div class="callout">
            <span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/></svg></span>
            <div><p class="t">Just 15 minutes a day</p><p class="s">Most students finish step 1 in one sitting.</p></div>
          </div>
        </div>
        <div>
          <ol class="roadmap">
                      <c:set var="i" value="0" />
                      <c:forEach var="category" items="${TESTS['java-core'].categories}">
                        <c:if test="${i < 10 && category.value.hidden == false && category.value.parentCategory != null}">
                          <li class="roadmap-item ${i % 2 == 0 ? 'even' : 'odd'}">
                            <a href="${pageContext.request.contextPath}/java/java-core/${category.value.pathName}"
                               id="categoryItem${category.value.pathName}" class="category-href-main">
                              <span class="step-num">${i + 1}</span>
                              <div class="step-text">
                                <p class="step-topic">${category.value.parentCategory.roadMapName != null && not empty category.value.parentCategory.roadMapName ? category.value.parentCategory.roadMapName : category.value.parentCategory.name}</p>
                                <p class="step-title">${category.value.roadMapName != null && not empty category.value.roadMapName ? category.value.roadMapName : category.value.name}</p>
                              </div>
                              <span class="step-aside locked">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                              </span>
                            </a>
                          </li>
                          <c:set var="i" value="${i + 1}" />
                        </c:if>
                      </c:forEach>
                    </ol>
          <a class="see-all" href="${pageContext.request.contextPath}/java-core">See all ${lessonsText} →</a>
        </div>
      </div>
    </section>

    <!-- ===== COURSE PROGRAM (data — HomeUtility) ===== -->
    <c:if test="${not empty HOME_MODULES}">
    <section class="container section" id="program" aria-labelledby="program-title">
      <div class="section-head">
        <h2 id="program-title">What you will learn: ${modulesText} of Java Core</h2>
        <p>From your first program and Java syntax to OOP, lambdas and the Stream API: ${lessonsText}, ${tasksText} and ${testsText}. Every module has lessons, tasks and tests.</p>
      </div>
      <ol class="program-list">
        <c:forEach var="pm" items="${HOME_MODULES}">
          <li>
            <a class="program-item" href="${pageContext.request.contextPath}/java/java-core/${pm.firstLesson.pathName}">
              <span class="program-num">${pm.number}</span>
              <span class="program-name">${pm.module.name}</span>
              <span class="program-meta"><spring:message code="home.lessons.${pm.lessonsForm}" arguments="${pm.lessons}"/><c:if test="${pm.tasks > 0}"> · <spring:message code="hub.tasks.${pm.tasksForm}" arguments="${pm.tasks}"/></c:if></span>
            </a>
          </li>
        </c:forEach>
      </ol>
      <a class="see-all" href="${pageContext.request.contextPath}/java-core#modules">Full course program with all lessons →</a>
    </section>
    </c:if>

    <!-- ===== FEATURES ===== -->
    <section class="container section">
      <div class="section-head">
        <h2>Why learn Java on ExamClouds?</h2>
        <p>Most online courses get abandoned. This one is built to be finished.</p>
      </div>
      <div class="cards cards-2 cards-3-lg">
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg></span><h3>Free</h3><p>No paywalls, no upsells. Learning should be accessible.</p></div>
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/></svg></span><h3>Bite-sized lessons</h3><p>5–15 min lessons that fit into a busy schedule.</p></div>
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg></span><h3>Hands-on tasks</h3><p>Improve your knowledge with exercises.</p></div>
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/><path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/><path d="M4 22h16"/><path d="M18 2H6v7a6 6 0 0 0 12 0V2Z"/></svg></span><h3>Track your progress</h3><p>Mark lessons as completed — your course progress is saved.</p></div>
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="8" r="7"/><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/></svg></span><h3>Blog</h3><p>Short reads on Java concepts, career tips, and real interview questions — written for learners, not academics.</p><a class="link-arrow" href="${pageContext.request.contextPath}/show-all-articles">Read the blog →</a></div>
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></span><h3>Video</h3><p>Video walkthroughs on the ExamClouds YouTube channel for key lessons and practical tasks.</p></div>
      </div>
      <p class="home-author">The course is written by <a href="${pageContext.request.contextPath}/tatyana-milkina">Tatyana Milkina</a>, a Senior Java Developer with 10 years in enterprise Java development. Every lesson, task and test is written by hand and kept up to date.</p>
    </section>

    <!-- ===== FAQ ===== -->
    <section class="container section">
      <div class="faq-grid">
        <div>
          <h2>Frequently asked questions</h2>
        </div>
        <%-- One set of strings for the visible FAQ and FAQPage JSON-LD. No apostrophes: javaScriptEscape turns them into \' (invalid in JSON). --%>
        <c:set var="q1" value="Is this Java course really free?"/>
        <c:set var="a1" value="Yes. All ${lessonsText}, ${tasksText} and ${testsText} are free and need no registration. Nothing is locked behind a paywall."/>
        <c:set var="q2" value="Can I learn Java with no programming experience?"/>
        <c:set var="a2" value="Yes, the course is built for learning Java from scratch. It starts with what Java is and how to install the JDK, then goes from simple to complex: syntax, operators, control flow, arrays, OOP, interfaces, lambdas and the Stream API. Lessons take 5 to 15 minutes and come with tasks and tests."/>
        <c:set var="q3" value="How long does it take to learn Java from scratch?"/>
        <c:set var="a3" value="The lessons together with the practical tasks take about ${HOME_STUDY_HOURS} hours. At around an hour a day that is roughly ${HOME_STUDY_MONTHS} months. You can go faster or slower: your progress through the lessons is saved."/>
        <c:set var="q4" value="Is the course enough to get a junior Java developer job?"/>
        <c:set var="a4" value="The course covers the Java Core fundamentals that interviews check first: syntax, OOP, the Object class, interfaces and enums, exceptions, lambdas and the Stream API, plus Git. For a job you will also need collections, databases and frameworks such as Spring, which are not part of the English course yet."/>
        <c:set var="q5" value="Do I get a certificate?"/>
        <c:set var="a5" value="No. ExamClouds does not issue certificates: the course is free and focuses on knowledge you can show in an interview. Use the free Java online test on the site to check your level."/>
        <c:set var="q6" value="Do I need to install anything?"/>
        <c:set var="a6" value="Not for the lessons and tests, which work in the browser. For the practical tasks, install the free JDK and IntelliJ IDEA Community; the first lessons of the course show how."/>
        <c:set var="q7" value="Can I learn on mobile?"/>
        <c:set var="a7" value="Yes. Lessons and tests work well on a phone. The practical coding tasks are easier on a computer."/>
        <div class="faq-list">
          <c:forEach var="i" begin="1" end="7">
            <c:set var="qKey" value="q${i}"/><c:set var="aKey" value="a${i}"/>
            <details class="faq-item"><summary><c:out value="${pageScope[qKey]}"/><span class="plus">+</span></summary><p class="a"><c:out value="${pageScope[aKey]}"/></p></details>
          </c:forEach>
        </div>
      </div>
      <script type="application/ld+json">{
        "@context": "https://schema.org",
        "@type": "FAQPage",
        "mainEntity": [<c:forEach var="i" begin="1" end="7" varStatus="st"><c:set var="qKey" value="q${i}"/><c:set var="aKey" value="a${i}"/>
          {"@type": "Question", "name": "<spring:escapeBody javaScriptEscape="true">${pageScope[qKey]}</spring:escapeBody>", "acceptedAnswer": {"@type": "Answer", "text": "<spring:escapeBody javaScriptEscape="true">${pageScope[aKey]}</spring:escapeBody>"}}${st.last ? '' : ','}</c:forEach>
        ]
      }</script>
    </section>

    <!-- ===== FINAL CTA ===== -->
    <section class="container" style="padding-bottom:5rem;">
      <div class="final-cta">
        <span class="blob blob-c"></span>
        <span class="blob blob-d"></span>
        <div style="position:relative;">
          <svg class="trophy" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/><path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/><path d="M4 22h16"/><path d="M10 14.66V17c0 .55-.47.98-.97 1.21C7.85 18.75 7 20.24 7 22"/><path d="M14 14.66V17c0 .55.47.98.97 1.21C16.15 18.75 17 20.24 17 22"/><path d="M18 2H6v7a6 6 0 0 0 12 0V2Z"/></svg>
          <h2>Your Java journey starts today.</h2>
          <p>Join 20,000 learners. No credit card. No paywalls. Just learning that works.</p>
          <div class="actions">
            <a class="btn btn-onPrimary" href="${pageContext.request.contextPath}/java-core">
              Start learning free
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
            </a>
            <a class="btn btn-ghostOnPrimary" href="${pageContext.request.contextPath}/tests">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
              Take a 5-min test
            </a>
          </div>
        </div>
      </div>
   </section>
  </main>
   <%@ include file="/WEB-INF/footer-new.jsp"%>
</body>
</html>
