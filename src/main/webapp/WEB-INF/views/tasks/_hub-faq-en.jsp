<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- FAQ EN-хаба практических задач: видимый блок + FAQPage JSON-LD из одних и тех же строк.
     Числа (задачи, модули, часы) — из TaskUtility.addPageStatsToModel.
     В текстах не используйте апостроф: javaScriptEscape превращает его в \' — это недопустимо в JSON. --%>
<c:set var="q1" value="Where can I practice Java for free?"/>
<c:set var="a1" value="Right here: all ${TASKS_TOTAL} exercises on ExamClouds are free and need no registration. They follow the free Java Core course, and every task page links to the lessons it practices. Write and run the code in your own IDE, for example IntelliJ IDEA: the tasks are not tied to an online editor."/>
<c:set var="q2" value="Which Java exercises should a beginner start with?"/>
<c:set var="a2" value="Start with the Java tasks for beginners group: your first application, syntax, operators, control flow and arrays. Then move on to OOP and the standard library, and finish with lambdas, the Stream API and algorithms. Every module card shows its level, the number of tasks and the estimated time."/>
<c:set var="q3" value="Can I use these tasks as Java assignments or lab work?"/>
<c:set var="a3" value="Yes. The tasks are grouped by course module and go from simple to advanced, so a module works as a ready set of Java assignments or homework. The mini projects on this page grow from module to module and work well as a running lab assignment."/>
<c:set var="q4" value="Are there solutions to the Java exercises?"/>
<c:set var="a4" value="Many tasks include a hint right under the condition, and some come with a solution on Patreon and a video walkthrough. Try to solve each task on your own first, then compare your code with the solution."/>
<c:set var="q5" value="How long does it take to finish all the tasks?"/>
<c:choose>
  <c:when test="${TASKS_TOTAL_HOURS > 0}">
    <c:set var="a5" value="Each module card shows an estimated time, from about an hour to several hours. All ${TASKS_TOTAL} exercises across ${MODULES_TOTAL} modules take roughly ${TASKS_TOTAL_HOURS} hours of focused practice."/>
  </c:when>
  <c:otherwise>
    <c:set var="a5" value="Each module card shows an estimated time, from about an hour to several hours, so you can plan your practice module by module."/>
  </c:otherwise>
</c:choose>
<section class="faq-section hub-faq">
  <h2 id="faq">Frequently Asked Questions</h2>
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
