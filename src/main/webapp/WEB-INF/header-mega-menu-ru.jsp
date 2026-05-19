<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<div class="nav-courses">
        <button class="nav-courses-btn" type="button" data-courses-toggle aria-expanded="false" aria-haspopup="true">
          <spring:message code="courses"/>
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
        </button>
        <div class="mega-menu" data-courses-panel hidden>
          <div class="container mega-grid">
            <div class="mega-col">
              <h4>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
                Основы Java
              </h4>
              <a href="${pageContext.request.contextPath}/ru/exam/java-core-russian"><b>Java Core</b><span>Полный курс с нуля</span></a>
              <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/probeli-kommentarii-identifikatori-kluchevie-slova-java"><b>Лексика языка</b><span>Переменные, методы, типы данных</span></a>
              <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/metodiki-programmirovanija"><b>ООП в Java</b><span>Классы, объекты, наследование</span></a>
              <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/kollekcii-v-java"><b>Коллекции framework</b><span>List, Set, Map и другие</span></a>
              <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/obrabotka-iskluchenij"><b>Исключения</b><span>Обработка ошибок и исключений</span></a>
              <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/stroki"><b>Строки</b><span>Классы String, StringBuilder, StringBuffer</span></a>
            </div>
            <div class="mega-col">
              <h4>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>
                Практика
              </h4>
              <a href="${pageContext.request.contextPath}/ru/practicheskie-zadachi"><b>Практические задачи</b><span>Разного уровня сложности</span></a>
              <a href="${pageContext.request.contextPath}/ru/tests"><b>Тесты</b><span>Проверь и оцени свои знания</span></a>
              <a href="${pageContext.request.contextPath}/ru/video-java-uroki"><b>Полный список видео</b><span>Закрепи знания с помощью видео</span></a>
            </div>
            <div class="mega-col">
              <h4>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M22 10v6M2 10l10-5 10 5-10 5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg>
                Продвинутое
              </h4>
              <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/chto-takoe-stream-api"><b>Stream API</b><span>Функциональное программирование</span></a>
              <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/threads-russian"><b>Многопоточность</b><span>Потоки и параллелизм</span></a>
              <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/drivers"><b>JDBC и базы данных</b><span>Работа с SQL и JDBC</span></a>
              <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/vcs"><b>Git и GitHub</b><span>Контроль версий VCS, GitHub, git</span></a>
              <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/maven"><b>Maven</b><span>Сборка проекта, репозитории</span></a>
              <a href="${pageContext.request.contextPath}/ru/java/java-core-russian/serialization-russian"><b>Сериализация</b><span>Механизмы сериализации и сериализации</span></a>
            </div>
            <aside class="mega-promo">
              <div class="mega-promo-icon" aria-hidden="true">
                <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M4.5 16.5c-1.5 1.26-2 5-2 5s3.74-.5 5-2c.71-.84.7-2.13-.09-2.91a2.18 2.18 0 0 0-2.91-.09z"/><path d="M12 15l-3-3a22 22 0 0 1 2-3.95A12.88 12.88 0 0 1 22 2c0 2.72-.78 7.5-6 11a22.35 22.35 0 0 1-4 2z"/><path d="M9 12H4s.55-3.03 2-4c1.62-1.08 5 0 5 0"/><path d="M12 15v5s3.03-.55 4-2c1.08-1.62 0-5 0-5"/></svg>
              </div>
              <h5>Начни путь разработчика</h5>
              <p>Пошаговое обучение от основ до реальной разработки</p>
              <a class="btn btn-primary btn-sm mega-cta" href="${pageContext.request.contextPath}/ru/exam/java-core-russian">Начать обучение →</a>
              <a class="btn btn-outline btn-sm mega-cta-outline" href="${pageContext.request.contextPath}/ru/exam/java-core-russian">См. полный путь (29 тем)</a>
            </aside>
          </div>
          <!-- Feature strip -->
          <div class="mega-feats">
            <div class="container mega-feats-grid">
              <div class="mega-feat">
                <span class="mega-feat-ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 2 7 12 12 22 7 12 2"/><polyline points="2 17 12 22 22 17"/><polyline points="2 12 12 17 22 12"/></svg></span>
                <div><b>Бесплатно</b><span>Все материалы доступны без оплаты</span></div>
              </div>
              <div class="mega-feat">
                <span class="mega-feat-ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg></span>
                <div><b>Пошаговое обучение</b><span>Структурированные курсы от простого к сложному</span></div>
              </div>
              <div class="mega-feat">
                <span class="mega-feat-ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg></span>
                <div><b>Практика и тесты</b><span>Закрепляй знания на практике</span></div>
              </div>
              <div class="mega-feat">
                <span class="mega-feat-ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M22 10v6M2 10l10-5 10 5-10 5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg></span>
                <div><b>Подходит новичкам</b><span>Начни с нуля — это просто!</span></div>
              </div>
            </div>
          </div>
        </div>
      </div>
