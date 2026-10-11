<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- FAQ RU-хаба практических задач: видимый блок + FAQPage JSON-LD из одних и тех же строк.
     Числа (задачи, модули, часы) — из TaskUtility.addPageStatsToModel, склонение — подписи hub.tasks.* / hub.modules.*.
     В текстах не используйте апостроф ('): javaScriptEscape превращает его в \' — это недопустимо в JSON. --%>
<spring:message code="hub.tasks.${TASKS_TOTAL_FORM}" arguments="${TASKS_TOTAL}" var="tasksText"/>
<spring:message code="hub.modules.${MODULES_TOTAL_FORM}" arguments="${MODULES_TOTAL}" var="modulesText"/>
<c:set var="q1" value="Где бесплатно решать задачи по Java?"/>
<c:set var="a1" value="Здесь: все ${tasksText} на ExamClouds бесплатны и доступны без регистрации. Они идут по программе бесплатного курса Java Core, и на странице каждого модуля есть ссылки на уроки, которые закрепляет задача. Код пишите и запускайте в своей среде разработки, например в IntelliJ IDEA: задачи не привязаны к онлайн-редактору."/>
<c:set var="q2" value="С каких задач по Java начать новичку?"/>
<c:set var="a2" value="С группы «Задачи по Java для начинающих»: первое приложение, синтаксис, операции, условные операторы и циклы, массивы. Затем переходите к ООП и стандартной библиотеке, а в конце — к Stream API, алгоритмам, вводу-выводу, базам данных и многопоточности. На карточке каждого модуля указаны уровень, число задач и примерное время."/>
<c:set var="q3" value="Подойдут ли задачи как лабораторные работы по Java?"/>
<c:set var="a3" value="Да. Задачи сгруппированы по модулям курса и идут от простых к сложным, поэтому модуль — готовый набор лабораторных или домашних заданий по Java. Учебные проекты на этой странице растут от модуля к модулю: каждая следующая часть опирается на предыдущую, так что их удобно использовать как сквозную лабораторную работу."/>
<c:set var="q4" value="Есть ли решения к задачам по Java?"/>
<c:set var="a4" value="У многих задач прямо под условием есть подсказка, а к части задач — решение на Patreon и видеоразбор. Сначала попробуйте решить задачу сами и только потом сверяйтесь с решением: так навык закрепляется лучше."/>
<c:set var="q5" value="Сколько времени займёт решение всех задач?"/>
<c:choose>
  <c:when test="${TASKS_TOTAL_HOURS > 0}">
    <c:set var="a5" value="На карточке каждого модуля указано примерное время — от часа до нескольких часов. Все ${tasksText} из ${MODULES_TOTAL} модулей в сумме занимают примерно ${TASKS_TOTAL_HOURS} ч сосредоточенной практики."/>
  </c:when>
  <c:otherwise>
    <c:set var="a5" value="На карточке каждого модуля указано примерное время — от часа до нескольких часов, так что практику удобно планировать по модулям."/>
  </c:otherwise>
</c:choose>
<section class="faq-section hub-faq">
  <h2 id="faq">Часто задаваемые вопросы</h2>
  <div class="faq">
    <c:forEach var="i" begin="1" end="5">
      <c:set var="qKey" value="q${i}"/><c:set var="aKey" value="a${i}"/>
      <div class="faq-item">
        <div>
          <p class="faq-q"><strong><c:out value="${pageScope[qKey]}"/></strong></p>
          <p class="faq-a"><c:out value="${pageScope[aKey]}"/></p>
        </div>
      </div>
    </c:forEach>
  </div>
</section>
<script type="application/ld+json">{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [<c:forEach var="i" begin="1" end="5" varStatus="st"><c:set var="qKey" value="q${i}"/><c:set var="aKey" value="a${i}"/>
    {"@type": "Question", "name": "<spring:escapeBody javaScriptEscape="true">${pageScope[qKey]}</spring:escapeBody>", "acceptedAnswer": {"@type": "Answer", "text": "<spring:escapeBody javaScriptEscape="true">${pageScope[aKey]}</spring:escapeBody>"}}${st.last ? '' : ','}</c:forEach>
  ]
}</script>
