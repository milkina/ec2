<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- FAQ страницы /ru/tests (тест + вопросы для собеседования): видимый блок + FAQPage JSON-LD из одних и тех же строк.
     Числа — TestHubUtility.addTestHubToModel. Не используйте апостроф: javaScriptEscape делает из него \' — это недопустимо в JSON. --%>
<spring:message code="th.questions.${TEST_QUESTIONS_FORM}" arguments="${TEST_QUESTIONS_TOTAL}" var="testQuestionsText"/>
<spring:message code="th.questions.${QUIZ_QUESTIONS_FORM}" arguments="${QUIZ_QUESTIONS_TOTAL}" var="quizQuestionsText"/>
<spring:message code="th.modules.dat.${COVER_MODULES_FORM}" arguments="${fn:length(COVER_MODULES)}" var="modulesDatText"/>
<c:set var="q1" value="Тест по Java бесплатный?"/>
<c:set var="a1" value="Да. И тест по Java, и вопросы для собеседования бесплатны и доступны без регистрации. Если войти в аккаунт, результаты тестов сохраняются в профиле."/>
<c:set var="q2" value="Чем тест отличается от вопросов для собеседования?"/>
<c:set var="a2" value="Тест проверяет: вы отвечаете на вопросы с вариантами ответа и в конце получаете результат в процентах и разбор правильных ответов. Вопросы для собеседования помогают повторить: вы читаете вопрос, отвечаете про себя и сразу открываете ответ, без оценки."/>
<c:set var="q3" value="Сколько всего вопросов?"/>
<c:set var="a3" value="В курсе Java Core ${testQuestionsText} для тестов и ${quizQuestionsText} для собеседования по ${modulesDatText}. За один раз вы выбираете темы и проходите от 5 до 100 вопросов."/>
<c:set var="q4" value="Какие темы Java охватывают вопросы?"/>
<c:set var="a4" value="Вопросы идут по программе курса Java Core: от первой программы, синтаксиса и операций до ООП, строк, дженериков, лямбда-выражений, коллекций, Stream API, исключений, ввода-вывода и многопоточности. Полный список модулей и уроков — на этой странице."/>
<c:set var="q5" value="Подойдёт ли тест новичку и опытному разработчику?"/>
<c:set var="a5" value="Да. Новичок может проверить один урок сразу после изучения, а опытный разработчик — выбрать несколько модулей и найти пробелы перед собеседованием. Темы вы выбираете сами, поэтому сложность теста определяется выбранными модулями."/>
<c:set var="q6" value="Покажут ли правильные ответы?"/>
<c:set var="a6" value="Да. После теста видны все вопросы, ваши ответы и правильные, так что понятно, какие темы повторить. В вопросах для собеседования ответ открывается сразу."/>
<c:set var="q7" value="Поможет ли это подготовиться к тестированию на работе или собеседованию?"/>
<c:set var="a7" value="Вопросы охватывают темы Java Core, которые проверяют на большинстве технических собеседований и тестирований, включая вопросы с кодом: скомпилируется ли он, что выведет, где ошибка. Тестом найдите слабые темы, а вопросами для собеседования повторите их."/>
<section class="faq-section th-faq">
  <h2 id="faq">Часто задаваемые вопросы</h2>
  <div class="faq">
    <c:forEach var="i" begin="1" end="7">
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
  "mainEntity": [<c:forEach var="i" begin="1" end="7" varStatus="st"><c:set var="qKey" value="q${i}"/><c:set var="aKey" value="a${i}"/>
    {"@type": "Question", "name": "<spring:escapeBody javaScriptEscape="true">${pageScope[qKey]}</spring:escapeBody>", "acceptedAnswer": {"@type": "Answer", "text": "<spring:escapeBody javaScriptEscape="true">${pageScope[aKey]}</spring:escapeBody>"}}${st.last ? '' : ','}</c:forEach>
  ]
}</script>
