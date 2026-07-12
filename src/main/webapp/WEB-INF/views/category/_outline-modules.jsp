<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="pathLanguage" value="${TESTS[param.TEST_PATH].language.code=='ru'?'ru/':''}"/>
<p class="lesson-outline-eyebrow">${TESTS[param.TEST_PATH].name}</p>
<c:set var="catStatus" value="1" />
<c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
    <c:if test="${category.value.hidden==false && category.value.parentCategory==null}">
        <c:set var="isOpen" value="${category.value.subCategories.contains(CATEGORY_ATTRIBUTE)}"/>
        <c:set var="subIds" value=""/>
        <c:set var="visibleSubCount" value="0"/>
        <c:forEach var="sub" items="${category.value.subCategories}">
            <c:if test="${sub.hidden==false}">
                <c:set var="subIds" value="${empty subIds ? '' : subIds.concat(',')}"/>
                <c:set var="subIds" value="${subIds}${sub.id}"/>
                <c:set var="visibleSubCount" value="${visibleSubCount + 1}"/>
            </c:if>
        </c:forEach>
        <details class="ol-module" ${isOpen ? 'open' : ''} data-sub-ids="${subIds}" data-sub-total="${visibleSubCount}">
            <summary class="${isOpen ? 'is-active-summary' : ''}">
                <span class="ol-num">${catStatus}.</span>
                <c:set var="catStatus" value="${catStatus + 1}" />
                <span class="ol-title">${category.value.roadMapName!=null && not empty category.value.roadMapName?category.value.roadMapName:category.value.name}</span>
                <span class="ol-chev">›</span>
                <span class="ol-counter" style="display:none;"></span>
                <div class="ol-module-bar" style="display:none;"><span></span></div>
            </summary>
            <c:if test="${fn:length(category.value.subCategories)>0}">
                <ul class="ol-lessons">
                    <c:forEach var="subCategory" items="${category.value.subCategories}">
                        <c:if test="${subCategory.hidden==false}">
                            <c:set var="isActive" value="${subCategory.equals(CATEGORY_ATTRIBUTE)}"/>
                            <li><a class="${isActive ? 'is-active' : ''}" href="${pageContext.request.contextPath}/${pathLanguage}java/${param.TEST_PATH}/${subCategory.pathName}" data-cat-id="${subCategory.id}">
                                <span class="${isActive ? 'ol-dot active' : 'ol-dot'}"></span>${subCategory.name}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
        </details>
    </c:if>
</c:forEach>
