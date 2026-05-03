<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib uri="/WEB-INF/tld/cache-tagjsp-taglib.tld" prefix="cache"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <%@ include file="/WEB-INF/head-common-without-bootstrap.jsp"%>
  <title>Бесплатные курсы Java программирования с нуля</title>
  <meta name="description" content="Ищете курсы программирования Java? Основы Java, Java Core, видеоуроки, тесты и практические задания. Курсы Java для начинающих онлайн. Начните сегодня!">
  <link rel="alternate" hreflang="ru" href="https://www.examclouds.com/ru/">
  <link rel="alternate" hreflang="en" href="https://www.examclouds.com">
  <link rel="alternate" hreflang="x-default" href="https://www.examclouds.com">
  <link rel="canonical" href="https://www.examclouds.com/ru/">
  <meta property="og:title" content="Бесплатные курсы Java программирования с нуля">
  <meta property="og:type" content="article">
  <meta property="og:description" content="Ищете курсы программирования Java? Основы Java, Java Core, видеоуроки, тесты и практические задания. Курсы Java для начинающих онлайн. Начните сегодня!">
  <meta property="og:site_name" content="ExamClouds">
  <meta property="og:url" content="https://www.examclouds.com/ru/">
  <meta property="og:published_time" content="2017-10-08T12:00:00Z">
  <meta property="og:modified_time" content="2024-10-08T12:00:00Z">
  <meta property="og:image" content="https://img.examclouds.com/general/logo.svg">
  <meta property="og:image:alt" content="Бесплатные курсы Java для начинающих | Изучение Java онлайн с нуля">
  <meta name="twitter:title" content="Бесплатные курсы Java программирования с нуля">
  <meta name="twitter:card" content="summary">
  <meta name="twitter:description" content="Ищете курсы программирования Java? Основы Java, Java Core, видеоуроки, тесты и практические задания. Курсы Java для начинающих онлайн. Начните сегодня!">
  <meta name="twitter:site" content="@ExamClouds">
  <meta name="twitter:image" content="https://img.examclouds.com/general/logo.svg">
  <meta name="twitter:image:alt" content="Бесплатные курсы Java для начинающих | Изучение Java онлайн с нуля">
  <script src="${pageContext.request.contextPath}/js/main.js?v=3"></script>
</head>
<body itemscope itemtype="https://schema.org/WebPage" class="scroll-style">
  <div class="container-fluid menu top round-border-bottom">
    <%@ include file="/menu.jsp"%>
    <!-- HERO -->
    <div class="container mt-3">
      <div class="hero">
        <div>
          <h1>Изучи Java с нуля до разработчика</h1>
          <p>Бесплатные уроки, практика и тесты для подготовки к работе</p>
          <p class="hero-sub">
            100+ уроков • Практика • Тесты • Бесплатно
          </p>
          <p class="hero-trust">
            Более 50 000 студентов уже начали обучение
          </p>
          <div class="mt-2">
            <a href="${pageContext.request.contextPath}/ru/exam/java-core-russian" class="btn btn-primary">🚀 Начать обучение</a>
            <a href="${pageContext.request.contextPath}/ru/tests" class="btn btn-secondary">📊 Пройти тест</a>
          </div>
        </div>
        <div class="custom-layout">
          <div class="hide-mobile-item">
            <img src="https://img.examclouds.com/general/index-image.webp" alt="Курсы программирования Java" width="473" height="250" loading="eager" fetchpriority="high">
          </div>
        </div>
      </div>
    </div>
  </div>
  <main>
    <!-- FEATURES -->
    <div class="container mt-4">
      <div class="features-grid">
        <div class="feature-item">
          <i class="fas fa-gift feature-icon free"></i>
          <span class="feature-text">Бесплатно</span>
        </div>
        <div class="feature-item">
          <i class="fas fa-route feature-icon learning"></i>
          <span class="feature-text">Пошаговое обучение</span>
        </div>
        <div class="feature-item">
          <i class="fas fa-tasks feature-icon practice"></i>
          <span class="feature-text">Практика и тесты</span>
        </div>
        <div class="feature-item">
          <i class="fas fa-user-graduate feature-icon beginner"></i>
          <span class="feature-text">Подходит новичкам</span>
        </div>
        <div class="feature-item">
          <i class="fas fa-play-circle feature-icon video"></i>
          <span class="feature-text">Видео</span>
        </div>
      </div>
    </div>

    <!-- WHERE TO START -->
    <div class="container mt-4">
      <div class="card">
        <h2 class="h2">С чего начать?</h2>
        <p>
          Выберите путь в зависимости от вашего уровня
        </p>
      </div>
    </div>

    <!-- START BLOCK -->
    <div class="container mt-4">
    <div class="mt-3 grid grid-3">
      <div class="card card-horizontal">
        <div class="card-icon-circle">
          <i class="fas fa-chalkboard-teacher fa-2x"></i>
        </div>
        <div class="card-horizontal-content">
          <h3 class="h3">Новичок в Java?</h3>
          <p class="text mt-1">Начни с основ языка и изучай пошагово</p>
          <a href="${pageContext.request.contextPath}/ru/exam/java-core-russian" class="btn btn-outline mt-2">Начать курс →</a>
        </div>
      </div>

      <div class="card card-horizontal">
        <div class="card-icon-circle">
          <i class="fas fa-laptop-code fa-2x"></i>
        </div>
        <div class="card-horizontal-content">
          <h3 class="h3">Хочешь практики?</h3>
          <p class="text mt-1">Решай задачи и прокачивай навыки</p>
          <a href="${pageContext.request.contextPath}/ru/practicheskie-zadachi" class="btn btn-outline mt-2">Решить задачи →</a>
        </div>
      </div>

      <div class="card card-horizontal">
        <div class="card-icon-circle">
          <i class="fas fa-tasks fa-2x"></i>
        </div>
        <div class="card-horizontal-content">
          <h3 class="h3">Проверь знания</h3>
          <p class="text mt-1">Пройди тесты и оцени уровень</p>
          <a href="${pageContext.request.contextPath}/ru/tests" class="btn btn-outline mt-2">Пройти тест→</a>
        </div>
      </div>
     </div>
    </div>

    <!-- ROADMAP -->
    <div class="container mt-4">
    <div class="mt-3 grid">
      <div class="card">
        <h2 class="h2">Путь Java разработчика</h2>
        <p class="text mt-1">Следуй шагам обучения</p>

        <c:set var="i" value="1" />
        <c:forEach var="category" items="${TESTS['java-core-russian'].categories}">
          <c:if test="${category.value.hidden==false && category.value.parentCategory==null}">
            <c:if test="${i==1}"><div class="grid grid-6 mt-3"></c:if>
            <c:if test="${i==7}"></div></c:if>
            <c:if test="${i==7}"><div class="roadmap-hidden grid grid-6 mt-3"></c:if>
            <div class="roadmap-step">
              ${i}<span>
                <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/${category.value.pathName}"
                   id="categoryItem${category.value.pathName}" class="category-href-main">
                  ${category.value.roadMapName!=null && not empty category.value.roadMapName?category.value.roadMapName:category.value.name}
                </a>
              </span>
            </div>
            <c:set var="i" value="${i + 1}" />
          </c:if>
        </c:forEach>
        </div>
      </div>

      <div class="text-center mt-3">
       <c:set var="str" value="Показать полный курс (${i-1} тем)" />
        <button class="btn btn-outline" onclick="toggleRoadmap('${str}','Скрыть')">
          ${str}
        </button>
      </div>
    </div>
    </div>

    <!-- POPULAR -->
    <div class="container mt-4">
      <h2 class="h2">Популярные разделы</h2>
      <div class="grid grid-3 mt-3">
        <a href="${pageContext.request.contextPath}/ru/exam/java-core-russian" class="card card-horizontal c1">
          <div class="card-icon-circle">
            <i class="fas fa-code fa-2x"></i>
          </div>
          <div class="card-horizontal-content">
            <h3 class="h3">Java Core</h3>
            <p class="text mt-1">Полный курс Java</p>
          </div>
        </a>
        <a href="${pageContext.request.contextPath}/ru/tests" class="card card-horizontal c1">
          <div class="card-icon-circle">
            <i class="fas fa-check-circle fa-2x"></i>
          </div>
          <div class="card-horizontal-content">
            <h3 class="h3">Тесты</h3>
            <p class="text mt-1">Проверь знания</p>
          </div>
        </a>
        <a href="${pageContext.request.contextPath}/ru/practicheskie-zadachi" class="card card-horizontal c1">
          <div class="card-icon-circle">
            <i class="fas fa-laptop-code fa-2x"></i>
          </div>
          <div class="card-horizontal-content">
            <h3 class="h3">Практика</h3>
            <p class="text mt-1">Задачи разного уровня</p>
          </div>
        </a>
      </div>
    </div>

    <!-- LESSONS -->
    <div class="container mt-4">
      <div class="grid grid-3 mt-3">
        <a href="https://www.youtube.com/c/tatyanamilkina" rel="nofollow noopener noreferrer" target="_blank" class="card card-horizontal c1">
          <div class="card-icon-circle">
            <i class="fab fa-youtube fa-2x"></i>
          </div>
          <div class="card-horizontal-content">
            <h3 class="h3">Видео</h3>
            <p class="text mt-1">Подписывайтесь на наш канал на YouTube</p>
          </div>
        </a>
        <a href="${pageContext.request.contextPath}/ru/show-all-articles" class="card card-horizontal c1">
          <div class="card-icon-circle">
            <i class="fas fa-newspaper fa-2x"></i>
          </div>
          <div class="card-horizontal-content">
            <h3 class="h3">Блог</h3>
            <p class="text mt-1">Новости IT</p>
          </div>
        </a>
        <a href="https://www.udemy.com/course/java-bup/" rel="nofollow sponsored noopener" target="_blank" class="card card-horizontal c1">
          <div class="card-icon-circle">
            <i class="fas fa-certificate fa-2x"></i>
          </div>
          <div class="card-horizontal-content">
            <h3 class="h3">Сертификат</h3>
            <p class="text mt-1">Курс на Udemy</p>
          </div>
        </a>
      </div>
    </div>

    <!-- BENEFITS -->
    <div class="container mt-4">
        <div class="mt-3 grid">
      <div class="card">
        <h2 class="h2">Почему ExamClouds?</h2>
        <div class="grid grid-3 mt-3">
          <div>
            <h3 class="h3">Бесплатно</h3>
            <p class="text">Все материалы доступны бесплатно</p>
          </div>
          <div>
            <h3 class="h3">Структура</h3>
            <p class="text">Пошаговое обучение</p>
          </div>
          <div>
            <h3 class="h3">Практика</h3>
            <p class="text">Закрепляй знания задачами</p>
          </div>
        </div>
      </div>
      </div>
    </div>

    <!-- CTA -->
    <div class="container mt-4">
     <div class="mt-3 grid">
      <div class="card text-center">
        <h2 class="h2">Начни обучение прямо сейчас</h2>
        <p class="text mt-2">Сделай первый шаг к карьере разработчика</p>
        <a href="${pageContext.request.contextPath}/ru/exam/java-core-russian" class="btn btn-outline mt-3">
          Начать обучение →
        </a>
      </div>
    </div>
    </div>
  </main>
<section class="seo-text container mt-5">
  <h2>Курсы Java программирования с нуля</h2>
  <h3>Почему стоит изучать Java?</h3>
  <p>
    Изучение Java — один из самых надежных способов начать карьеру в IT.
    На платформе ExamClouds вы найдете бесплатные курсы Java программирования,
    которые подходят как для начинающих, так и для тех, кто хочет систематизировать знания.
  </p>

  <h3>Что входит в курс?</h3>
  <p>
    Обучение построено по принципу «от простого к сложному»:
    от основ синтаксиса Java до сложных тем, таких как ООП, коллекции, Stream API и многопоточность.
    Каждый урок сопровождается примерами, <a href="${pageContext.request.contextPath}/ru/practicheskie-zadachi">практическими заданиями</a> и <a href="${pageContext.request.contextPath}/ru/tests">тестами</a> для закрепления материала.
  </p>

  <p>
    В отличие от многих других платформ, здесь вы получаете не только теорию,
    но и реальную практику. Это помогает подготовиться к собеседованиям и работе Java-разработчиком.
  </p>
 <h3>Кому подойдет обучение?</h3>
  <p>
    Более 50 000 студентов уже начали обучение и используют материалы сайта
    для подготовки к работе и повышения квалификации.
  </p>
</section>
  <%@include file="/WEB-INF/footer.jsp"%>
</body>
</html>