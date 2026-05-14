<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib uri="/WEB-INF/tld/cache-tagjsp-taglib.tld" prefix="cache"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<!doctype html>
<html lang="ru">
<head>
    <%@ include file="/WEB-INF/head-new.jsp"%>
    <title>Бесплатные курсы Java программирования с нуля</title>
    <meta name="description" content="Ищете курсы программирования Java? Основы Java, Java Core, видеоуроки, тесты и практические задания. Курсы Java для начинающих онлайн. Начните сегодня!">
    <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/">
    <link rel="alternate" hreflang="en" href="https://www.examclouds.com">
    <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com">
    <link rel="canonical" href="https://www.examclouds.com/ru/">
    <meta property="og:title" content="Бесплатные курсы Java программирования с нуля">
    <meta property="og:type" content="website">
    <meta property="og:description" content="Ищете курсы программирования Java? Основы Java, Java Core, видеоуроки, тесты и практические задания. Курсы Java для начинающих онлайн. Начните сегодня!">
    <meta property="og:site_name" content="ExamClouds">
    <meta property="og:url" content="https://www.examclouds.com/ru/">
    <meta property="og:published_time" content="2017-10-08T12:00:00Z">
    <meta property="og:modified_time" content="2026-05-14T12:00:00Z">
    <meta property="og:image" content="https://img.examclouds.com/general/logo-f.png">
    <meta property="og:image:alt" content="Бесплатные курсы Java для начинающих | Изучение Java онлайн с нуля">
    <meta name="twitter:title" content="Бесплатные курсы Java программирования с нуля">
    <meta name="twitter:card" content="summary">
    <meta name="twitter:description" content="Ищете курсы программирования Java? Основы Java, Java Core, видеоуроки, тесты и практические задания. Курсы Java для начинающих онлайн. Начните сегодня!">
    <meta name="twitter:site" content="@ExamClouds">
    <meta name="twitter:image" content="https://img.examclouds.com/general/logo-f.png">
    <meta name="twitter:image:alt" content="Бесплатные курсы Java для начинающих | Изучение Java онлайн с нуля">
</head>
<body>
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
            Бесплатно
          </span>
          <h1>Изучи <span class="accent">Java</span> с нуля до разработчика.</h1>
          <p class="lede">200+ коротких уроков, практических заданий и тестов — разработано для новичков, которые хотят действительно закончить курс.</p>
          <div class="hero-actions">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/ru/exam/java-core-russian">
              Начать обучение
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
            </a>
            <a class="btn btn-outline" href="${pageContext.request.contextPath}/ru/tests">Пройти тест</a>
          </div>
          <div class="hero-meta">
            <span><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg> <b>50,000</b> студентов</span>
            <span><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg> <b>200+</b> уроков</span>
            <span><svg class="star" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg> <b>4.4</b></span>
          </div>
        </div>

        <div class="hero-art">
          <div class="backdrop"></div>
          <div class="frame">

            <img src="https://img.examclouds.com/general/index-image.png" alt="Курсы программирования Java на ExamClouds"
                 width="750" height="400" title="Курсы программирования Java на ExamClouds" fetchpriority="high">
            <div class="badge tl">
              <span class="icon"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg></span>
              <div><p class="label">Step 3 done</p><p class="title">Java Syntax</p></div>
            </div>
            <div class="badge br">
              <span class="icon"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/><path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/><path d="M4 22h16"/><path d="M10 14.66V17c0 .55-.47.98-.97 1.21C7.85 18.75 7 20.24 7 22"/><path d="M14 14.66V17c0 .55.47.98.97 1.21C16.15 18.75 17 20.24 17 22"/><path d="M18 2H6v7a6 6 0 0 0 12 0V2Z"/></svg></span>
              <div><p class="label">Achievement</p><p class="title">First class!</p></div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- ===== STATS ===== -->
    <section class="container">
      <div class="stats">
        <div class="stat"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></span><div><p class="v">50,000+</p><p class="l">студентов</p></div></div>
        <div class="stat"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg></span><div><p class="v">100+</p><p class="l">бесплатных уроков</p></div></div>
        <div class="stat"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg></span><div><p class="v">100+</p><p class="l">Практических заданий</p></div></div>
        <div class="stat"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="8" r="7"/><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/></svg></span><div><p class="v">200+</p><p class="l">Видео</p></div></div>
      </div>
    </section>

    <!-- ===== PATH PICKER ===== -->
    <section class="container section">
      <div class="section-head">
        <h2>С чего начать?</h2>
        <p>Выбери путь в зависимости от уровня.</p>
      </div>
      <div class="cards cards-3">
        <article class="path-card card-lift">
          <span class="tag tag-success">Новичок</span>
          <span class="ico-lg"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 10v6M2 10l10-5 10 5-10 5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg></span>
          <h3>Новичок в Java?</h3>
          <p class="desc">Начни с основ языка и изучай пошагово.</p>
          <a class="link-arrow" href="${pageContext.request.contextPath}/ru/exam/java-core-russian">Начать курс →</a>
        </article>
        <article class="path-card card-lift">
          <span class="tag tag-primary">Практика</span>
          <span class="ico-lg"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg></span>
          <h3>Хочешь практики?</h3>
          <p class="desc">Решай задачи и прокачивай навыки.</p>
          <a class="link-arrow" href="${pageContext.request.contextPath}/ru/practicheskie-zadachi">Решить задачи →</a>
        </article>
        <article class="path-card card-lift">
          <span class="tag tag-accent">Тесты</span>
          <span class="ico-lg"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="8" r="7"/><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/></svg></span>
          <h3>Проверь знания</h3>
          <p class="desc">Пройди тесты и оцени уровень.</p>
          <a class="link-arrow" href="${pageContext.request.contextPath}/ru/tests">Пройти тест →</a>
        </article>
      </div>
    </section>

    <!-- ===== VIDEO (lazy YouTube embed) ===== -->
    <section class="container section" id="video">
      <div class="video-grid">
        <div>
          <span class="eyebrow">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="6 3 20 12 6 21 6 3"/></svg>
            Обзор курса · 1 минута
          </span>
          <h2 style="margin-top:1rem;">Просмотри обзор курса Java за 1 минуту</h2>
          <p style="margin-top:1rem;color:var(--muted-fg);font-size:1.05rem;">
            Короткий обзор структуры курса</p>
          <ul class="check-list">
            <li>✓ Бесплатно</li>
            <li>✓ Пошаговое обучение</li>
            <li>✓ Практика и тесты</li>
            <li>✓ Видео</li>
          </ul>
        </div>
        <!-- Lazy YouTube: iframe loads ONLY after click -->
        <button class="lite-yt" type="button"
          data-yt-id="Ir6KjeOhbGk"
          aria-label="Play: видео обзор Java курса">
          <img loading="lazy" src="https://i.ytimg.com/vi/Ir6KjeOhbGk/hqdefault.jpg"
            alt="Видео обзор Java курса" />
          <span class="lite-yt-play" aria-hidden="true">
            <svg width="28" height="28" viewBox="0 0 24 24" fill="currentColor"><polygon points="6 3 20 12 6 21 6 3"/></svg>
          </span>
          <span class="lite-yt-label">Watch · Обзор курса</span>
        </button>
      </div>
    </section>

    <!-- ===== ROADMAP ===== -->
    <section class="band" id="roadmap">
      <div class="container roadmap-grid">
        <div class="roadmap-side">
          <span class="pill">Путь Java разработчика</span>
          <h2 style="margin-top:1rem;">Следуй шагам обучения</h2>
          <p style="margin-top:1rem; color:var(--muted-fg);">Четкий и структурированный путь обучения. Каждый шаг открывает следующий.</p>
          <a class="btn btn-primary btn-sm" style="margin-top:1.5rem;" href="${pageContext.request.contextPath}/ru/exam/java-core-russian">
            Начни первый шаг
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
          </a>
          <div class="callout">
            <span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/></svg></span>
            <div><p class="t">Занимайтесь всего 15 минут в день</p><p class="s">Большинство студентов проходят первый урок за одно занятие.</p></div>
          </div>
        </div>
        <div>
            <ol class="roadmap">
            <c:set var="i" value="0" />
            <c:forEach var="category" items="${TESTS['java-core-russian'].categories}">
              <c:if test="${i < 10 && category.value.hidden == false && category.value.parentCategory != null}">
                <li class="roadmap-item ${i % 2 == 0 ? 'even' : 'odd'}">
                  <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/${category.value.pathName}"
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
          <a class="see-all" href="${pageContext.request.contextPath}/ru/exam/java-core-russian">Все 210 уроков →</a>
        </div>
      </div>
    </section>

    <!-- ===== FEATURES ===== -->
    <section class="container section">
      <div class="section-head">
        <h2>Почему ExamClouds?</h2>
        <p>Большинство онлайн-курсов бросают. Наши — нет.</p>
      </div>
      <div class="cards cards-2 cards-3-lg">
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg></span><h3>Бесплатно</h3><p>Материалы доступны бесплатно.</p></div>
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/></svg></span><h3>Короткие уроки</h3><p>Уроки по 5–15 минут, которые легко вписать в плотный график.</p></div>
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg></span><h3>Практические задания</h3><p>Закрепляйте знания задачами.</p></div>
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/><path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/><path d="M4 22h16"/><path d="M18 2H6v7a6 6 0 0 0 12 0V2Z"/></svg></span><h3>Поддерживайте серию занятий</h3><p>Ежедневные серии и награды помогают не терять мотивацию.</p></div>
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="8" r="7"/><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/></svg></span><h3>Сертификат</h3><p>Если Вам нужен сертификат, пройдите наш курс на Udemy.</p></div>
        <div class="feature-card"><span class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></span><h3>Видео</h3><p>Закрепляйте знания с помощью видео.</p></div>
      </div>
    </section>

    <!-- ===== UDEMY PROMO ===== -->
    <section class="container section-udemy" id="udemy">
      <div class="udemy-card">
        <div class="udemy-grid">
          <div class="udemy-main">
            <span class="udemy-badge">С наивысшим рейтингом на Udemy · Специальное предложение</span>
            <h3>Java SE для начинающих</h3>
            <p class="udemy-desc">Полный курс Java на русском языке — от нуля до уверенного Java-разработчика. Пожизненный доступ и сертификат по завершении.</p>
            <p class="udemy-meta">
              <span class="udemy-stars" aria-label="Rated 4.8 out of 5">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                <b>4.8</b> рейтинг
              </span>
              <span>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="7"/><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/></svg>
                Сертификат после завершения
              </span>
              <span>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                Пожизненный доступ
              </span>
            </p>
          </div>
          <div class="udemy-cta">
            <p class="udemy-eyebrow">Специальная цена</p>
            <p class="udemy-price"><span>€12.99</span></p>
            <p class="udemy-price-old">€59.99</p>
            <a class="udemy-btn" href="https://www.udemy.com/course/java-bup/?couponCode=ADF90A412F85133F9778" target="_blank" rel="noopener noreferrer sponsored">
              Начать обучение на Udemy
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
            </a>
            <p class="udemy-guarantee">30-дневная гарантия возврата средств</p>
          </div>
        </div>
      </div>
    </section>

    <!-- ===== TESTIMONIALS ===== -->
    <section class="testimonials">
      <div class="container section">
        <div class="section-head">
          <span class="eyebrow">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linejoin="round" style="color:var(--accent);"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
            4.8 средний рейтинг
          </span>
          <h2 style="margin-top:1rem;">Выбор студентов</h2>
        </div>
        <div class="cards cards-3">
          <figure class="testimonial">
            <div class="stars">
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
            </div>
            <blockquote>"Хороший курс. Советую. Все подробно обьяснено и доступно для любого уровня."</blockquote>
            <figcaption><span class="who">Aleksei</span></figcaption>
          </figure>
          <figure class="testimonial">
            <div class="stars">
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
            </div>
            <blockquote>"Очень грамотно все объясняется. Смотрел до этого разные курсы несмотря на это узнаю из данного курса много нового. Особо важно то что после каждого раздела следует блок задач для самостоятельного решения.
                         Большое спасибо автору за её труд."</blockquote>
            <figcaption><span class="who">Henadzi</span></figcaption>
          </figure>
          <figure class="testimonial">
            <div class="stars">
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg width="14" height="14" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
            </div>
            <blockquote>"Курс очень понравился! Каждый модуль курса хорошо структурирован - кроме видео, есть также множество практических заданий и тестов, что помогает легче усваивать материал. Рекомендую всем, кто изучает Java."</blockquote>
            <figcaption><span class="who">Alex</span></figcaption>
          </figure>
        </div>
      </div>
    </section>

    <!-- ===== FAQ ===== -->
    <section class="container section">
      <div class="faq-grid">
        <div>
          <h2>Часто задаваемые вопросы</h2>
          <p style="margin-top:0.75rem; color:var(--muted-fg);">Не нашли ответ? <a href="https://t.me/examclouds/" target="_blank" rel="noopener nofollow sponsored" style="color:var(--primary); font-weight:600; text-decoration:underline;">Напишите нам</a>.</p>
        </div>
        <div class="faq-list">
          <details class="faq-item"><summary>Почему стоит изучать Java?<span class="plus">+</span></summary><p class="a">Изучение Java — один из самых надежных способов начать карьеру в IT.</p></details>
          <details class="faq-item"><summary>Что предлагает ExamClouds?<span class="plus">+</span></summary><p class="a">На платформе ExamClouds вы найдете бесплатные курсы Java программирования, которые подходят как для начинающих, так и для тех, кто хочет систематизировать знания. В отличие от многих других платформ, здесь вы получаете не только теорию, но и реальную практику. Это помогает подготовиться к собеседованиям и работе Java-разработчиком.</p></details>
          <details class="faq-item"><summary>Что входит в курс?<span class="plus">+</span></summary><p class="a">Обучение построено по принципу «от простого к сложному»: от основ синтаксиса Java до сложных тем, таких как ООП, коллекции, Stream API и многопоточность. Каждый урок сопровождается примерами, практическими заданиями и тестами для закрепления материала.</p></details>
          <details class="faq-item"><summary>Кому подойдет обучение?<span class="plus">+</span></summary><p class="a">Начинающим и тем, кто хочет закрепить знания.</p></details>
        </div>
      </div>
    </section>

    <!-- ===== FINAL CTA ===== -->
    <section class="container" style="padding-bottom:5rem;">
      <div class="final-cta">
        <span class="blob blob-c"></span>
        <span class="blob blob-d"></span>
        <div style="position:relative;">
          <svg class="trophy" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/><path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/><path d="M4 22h16"/><path d="M10 14.66V17c0 .55-.47.98-.97 1.21C7.85 18.75 7 20.24 7 22"/><path d="M14 14.66V17c0 .55.47.98.97 1.21C16.15 18.75 17 20.24 17 22"/><path d="M18 2H6v7a6 6 0 0 0 12 0V2Z"/></svg>
          <h2>Начните изучать Java уже сегодня.</h2>
          <p>Присоединяйтесь к 50 000 студентов. Без карты. Без скрытых ограничений. Только обучение с реальным результатом.</p>
          <div class="actions">
            <a class="btn btn-onPrimary" href="${pageContext.request.contextPath}/ru/exam/java-core-russian">
              Начни обучение прямо сейчас
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
            </a>
            <a class="btn btn-ghostOnPrimary" href="${pageContext.request.contextPath}/ru/tests">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
              Проверьте знания за 5 минут
            </a>
          </div>
        </div>
      </div>
    </section>
  </main>

  <%@ include file="/WEB-INF/footer-new.jsp"%>

  <script src="${pageContext.request.contextPath}/js/main1.js" defer></script>
</body>
</html>
