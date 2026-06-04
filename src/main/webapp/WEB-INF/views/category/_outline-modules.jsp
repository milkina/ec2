<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<p class="lesson-outline-eyebrow">${TESTS[param.TEST_PATH].name}</p>
<c:set var="catStatus" value="1" />
<c:forEach var="category" items="${TESTS[param.TEST_PATH].categories}">
    <c:if test="${category.value.hidden==false && category.value.parentCategory==null}">
        <c:set var="isOpen" value="${category.value.subCategories.contains(CATEGORY_ATTRIBUTE)}"/>
        <details class="ol-module" ${isOpen ? 'open' : ''}>
            <summary class="${isOpen ? 'is-active-summary' : ''}">
                <span class="ol-num">${catStatus}.</span>
                <c:set var="catStatus" value="${catStatus + 1}" />
                <span class="ol-title">${category.value.roadMapName!=null && not empty category.value.roadMapName?category.value.roadMapName:category.value.name}</span>
                <span class="ol-chev">›</span>
            </summary>
            <c:if test="${fn:length(category.value.subCategories)>0}">
                <ul class="ol-lessons">
                    <c:forEach var="subCategory" items="${category.value.subCategories}">
                        <c:if test="${subCategory.hidden==false}">
                            <c:set var="isActive" value="${subCategory.equals(CATEGORY_ATTRIBUTE)}"/>
                            <li><a class="${isActive ? 'is-active' : ''}" href="${pageContext.request.contextPath}/${pathLanguage}java/${param.TEST_PATH}/${subCategory.pathName}">
                                <span class="${isActive ? 'ol-dot active' : 'ol-dot'}"></span>${subCategory.name}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
        </details>
    </c:if>
</c:forEach>
