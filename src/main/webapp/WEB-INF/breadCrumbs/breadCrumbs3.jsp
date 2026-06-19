<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/WEB-INF/tld/categoryjsp-taglib.tld" prefix="category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="/WEB-INF/tld/testjsp-taglib.tld" prefix="test"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<nav class="crumbs" aria-label="Breadcrumb">
    <a class="crumb-home" href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>"><spring:message code="home"/></a>
    <span class="sep crumb-home">›</span>
    <c:choose>
        <c:when test="${param.TEST_PATH.equals('java-core-russian')}">
            <c:set var="courseUrl" value="${pageContext.request.contextPath}/ru/java-core-russian"></c:set>
        </c:when>
        <c:otherwise>
            <c:set var="courseUrl" value="${pageContext.request.contextPath}/${TESTS[param.TEST_PATH].fullPathName}"></c:set>
        </c:otherwise>
    </c:choose>
    <a href="${courseUrl}">${TESTS[param.TEST_PATH].name}</a>
    <c:set var="parentCategoryName" value="${CATEGORY_ATTRIBUTE.parentCategory!=null && CATEGORY_ATTRIBUTE.parentCategory.roadMapName!=null && not empty CATEGORY_ATTRIBUTE.parentCategory.roadMapName ? CATEGORY_ATTRIBUTE.parentCategory.roadMapName : CATEGORY_ATTRIBUTE.parentCategory.name}"></c:set>
    <c:if test="${CATEGORY_ATTRIBUTE.parentCategory!=null}">
        <span class="sep crumb-parent">›
        ${parentCategoryName}</span>
    </c:if>
    <span class="sep">›</span>
    <span class="here">${CATEGORY_ATTRIBUTE.roadMapName!=null && not empty CATEGORY_ATTRIBUTE.roadMapName ? CATEGORY_ATTRIBUTE.roadMapName : CATEGORY_ATTRIBUTE.name}</span>
    <c:set var="bcLang" value="${TESTS[param.TEST_PATH].language.code=='ru'?'ru/':''}"/>
    <c:set var="bcCurrentName" value="${CATEGORY_ATTRIBUTE.roadMapName!=null && not empty CATEGORY_ATTRIBUTE.roadMapName ? CATEGORY_ATTRIBUTE.roadMapName : CATEGORY_ATTRIBUTE.name}"/>
    <c:set var="bcCurrentUrl" value="https://www.examclouds.com/${bcLang}java/${param.TEST_PATH}/${CATEGORY_ATTRIBUTE.pathName}"/>
    <c:set var="bcCourseUrl" value="https://www.examclouds.com/${TESTS[param.TEST_PATH].fullPathName}"/>
    <c:if test="${param.TEST_PATH.equals('java-core-russian')}">
        <c:set var="bcCourseUrl" value="https://www.examclouds.com/ru/java-core-russian"/>
    </c:if>
    <script type="application/ld+json">{
        "@context": "https://schema.org",
        "@type": "BreadcrumbList",
        "itemListElement": [
            {
                "@type": "ListItem",
                "position": 1,
                "name": "<spring:message code="home"/>",
                "item": "https://www.examclouds.com/<spring:message code="menu.home"/>"
            },
            {
                "@type": "ListItem",
                "position": 2,
                "name": "${TESTS[param.TEST_PATH].name}",
                "item": "${bcCourseUrl}"
            },
            {
                "@type": "ListItem",
                "position": 3,
                "name": "${bcCurrentName}",
                "item": "${bcCurrentUrl}"
            }
        ]
    }</script>
</nav>
