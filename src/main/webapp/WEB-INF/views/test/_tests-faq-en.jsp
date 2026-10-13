<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- FAQ страницы /tests (тест + вопросы для собеседования): видимый блок + FAQPage JSON-LD из одних и тех же строк.
     Числа — TestHubUtility.addTestHubToModel. Не используйте апостроф: javaScriptEscape делает из него \' — это недопустимо в JSON. --%>
<c:set var="q1" value="Is the Java online test free?"/>
<c:set var="a1" value="Yes. Both the Java online test and the interview questions are free and work without registration. If you sign in, your test results are saved to your profile."/>
<c:set var="q2" value="What is the difference between the test and the interview questions?"/>
<c:set var="a2" value="The test checks you: you answer multiple-choice questions and get a score with a review of the correct answers at the end. The interview questions help you revise: you read a question, answer it yourself and reveal the answer right away, without a score."/>
<c:set var="q3" value="How many questions are there?"/>
<c:set var="a3" value="The Java Core course has ${TEST_QUESTIONS_TOTAL} test questions and ${QUIZ_QUESTIONS_TOTAL} interview questions across ${fn:length(COVER_MODULES)} modules. In one session you choose the topics and take from 5 to 100 questions."/>
<c:set var="q4" value="What Java topics are covered?"/>
<c:set var="a4" value="The questions follow the Java Core course: what Java is and your first program, syntax and data types, operators and control flow, arrays, OOP, the static keyword, the Object class, interfaces and enums, wrapper classes, lambdas, the Stream API, sorting algorithms, inner classes and exceptions, and Git. The full list of modules and lessons is on this page."/>
<c:set var="q5" value="Is it suitable for beginners or experienced developers?"/>
<c:set var="a5" value="Both. Beginners can test one lesson right after studying it, while experienced developers can pick several modules to find gaps before an interview. Since you choose the topics yourself, the test is as easy or as hard as the modules you select."/>
<c:set var="q6" value="Will I see the correct answers?"/>
<c:set var="a6" value="Yes. After the test you see every question, your answer and the correct answer, so you know exactly which topics to review. Interview questions show the answer as soon as you open it."/>
<c:set var="q7" value="Can it help me prepare for a Java assessment test at work?"/>
<c:set var="a7" value="It covers the Java Core topics that most technical assessments and interviews check, with code-based questions on compilation, output and errors. Use the test to find weak topics and the interview questions to revise them."/>
<section class="faq-section th-faq">
  <h2 id="faq">Frequently Asked Questions</h2>
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
