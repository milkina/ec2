<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="pathLanguage" value="${pageLanguage=='ru'?'ru/':''}"/>
<!-- Author mini-card -->
<div class="panel lac-card">
  <p class="lesson-side-eyebrow author-snippet"><spring:message code="about.the.author"/></p>
  <div class="lac-head">
    <div class="lac-photo-wrap">
      <img src="https://img.examclouds.com/general/tatyana-milkina.png" alt="<spring:message code="tatyana.milkina"/>" class="lac-photo" loading="lazy" />
      <span class="lac-badge"><svg class="lac-star" width="10" height="10" viewBox="0 0 24 24" fill="currentColor" stroke="none" aria-hidden="true"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg> 4.8</span>
    </div>
    <div class="lac-meta">
      <p class="lac-name"><spring:message code="tatyana.milkina"/></p>
      <p class="lac-role">Senior Java Developer &middot; <spring:message code="instructor"/></p>
    </div>
  </div>
  <p class="lac-bio"><spring:message code="about.author"/></p>
  <div class="lac-actions">
    <a class="lac-btn lac-btn-primary" href="${pageContext.request.contextPath}/${pathLanguage}tatyana-milkina">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
      <spring:message code="about.the.author"/>
    </a>
  </div>
  <div class="lac-stats">
    <div><strong>20k+</strong><span><spring:message code="students"/></span></div>
    <div><strong>200+</strong><span><spring:message code="lessons"/></span></div>
    <div><strong>10 <spring:message code="yrs"/></strong><span><spring:message code="experience.java"/></span></div>
  </div>
</div>
