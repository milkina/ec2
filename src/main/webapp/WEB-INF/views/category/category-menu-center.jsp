<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script>
function toggleDropdown(header) {
  const contentItem = header.closest('.content-item');
  contentItem.classList.toggle('expanded');
}
</script>

<div class="two-column-layout">
  <!-- Section 1: Course Content -->
  <div class="section-left card">
    <h3><spring:message code="course.content"/></h3>
   <!-- <div class="course-progress">
      <div class="progress-text">9 out of 29 lessons completed</div>
      <div class="progress-bar">
        <div class="progress-fill" style="width: 31%"></div>
      </div>
      <div class="progress-percent">31%</div>
    </div>-->
    <ul class="course-content-list">
    <c:set var="catStatus" value="1" />
         <c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
            <c:if test="${category.value.hidden==false && category.value.parentCategory==null}">
              <li class="content-item">
                <div class="content-header" onclick="toggleDropdown(this)">
                  <div class="content-title">📘${catStatus}. ${category.value.roadMapName!=null && not empty category.value.roadMapName?category.value.roadMapName:category.value.name}</div>
                   <c:set var="catStatus" value="${catStatus + 1}" />
                      <c:if test="${fn:length(category.value.subCategories)>0}">
                         <div class="content-status">${fn:length(category.value.subCategories)}</div>
                         <div class="dropdown-arrow">▼</div>
                      </c:if>
                </div>
                <ul class="content-dropdown">
                  <c:forEach var="subCategory" items="${category.value.subCategories}">
                    <c:if test="${subCategory.hidden==false}">
                      <li class="sub-content-item"   onclick="window.location.href='${pageContext.request.contextPath}/${pageLanguage=='ru'?'ru/':''}java/${param.TEST_PATH}/${subCategory.pathName}'">
                        <div class="sub-content-title">

                                        ${subCategory.name}
                        </div>
                      </li>
                    </c:if>
                  </c:forEach>
                </ul>
              </li>
            </c:if>

          </c:forEach>
    </ul>
  </div>

  <!-- Section 2: Existing content -->
  <div class="section-right">
       <c:set var="lessonCount" value="0"/>
       <c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
         <c:if test="${category.value.hidden==false && category.value.parentCategory==null}">
           <c:set var="lessonCount" value="${lessonCount + 1}"/>
         </c:if>
       </c:forEach>
       <c:set var="hoursCount" value="${(lessonCount * 7 + 9) / 10}"/>

       <div class="grid">
          <div class="card">
            ${TESTS[param.TEST_PATH].article.text}
                      <div class="mt-3 grid grid-3 course-stats">
                         <div class="card card-horizontal stat-card">
                           <div class="card-icon-circle"><span>🎓</span></div>
                           <div class="card-horizontal-content">
                             <div class="stat-value">${lessonCount}&nbsp;<spring:message code="lessons"/></div>
                             <div class="stat-label"><spring:message code="lessons.subtitle"/></div>
                           </div>
                         </div>
                         <div class="card card-horizontal stat-card">
                           <div class="card-icon-circle"><span>⏱️</span></div>
                           <div class="card-horizontal-content">
                             <div class="stat-value">~<fmt:formatNumber value="${hoursCount}" maxFractionDigits="0"/>&nbsp;<spring:message code="hours"/></div>
                             <div class="stat-label"><spring:message code="hours.subtitle"/></div>
                           </div>
                         </div>
                         <div class="card card-horizontal stat-card">
                           <div class="card-icon-circle"><span>🏆</span></div>
                           <div class="card-horizontal-content">
                             <div class="stat-value"><spring:message code="free"/></div>
                             <div class="stat-label"><spring:message code="free.subtitle"/></div>
                           </div>
                         </div>
                      </div>
         </div>
       </div>
    <ul id="categories">
      <c:set var="pathLanguage" value="${TESTS[param.TEST_PATH].language.code=='ru'?'ru/':''}"/>
      <c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
        <c:if test="${category.value.hidden==false && category.value.parentCategory==null}">
          <li class="category-li"
              onclick="window.location.href='${pageContext.request.contextPath}/${pageLanguage=='ru'?'ru/':''}java/${param.TEST_PATH}/${category.value.pathName}'">
            <span class="lesson-badge">${TESTS[param.TEST_PATH].name}</span>
            <div class="category-name">${category.value.name}</div>
            <div class="category-desc">${category.value.article.description}</div>
          </li>
        </c:if>
      </c:forEach>
    </ul>
  </div>
</div>