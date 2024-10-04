<%@ taglib uri="/WEB-INF/tld/testjsp-taglib.tld" prefix="test"%>
<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
     <c:choose>
        <c:when test="${param.TEST_PATH.equals('java-core-russian')}">
            <a itemprop="item" href="${pageContext.request.contextPath}/ru/#start-course">
        </c:when>
        <c:otherwise>
            <a itemprop="item" href="${pageContext.request.contextPath}/${TESTS[param.TEST_PATH].fullPathName}">
        </c:otherwise>
     </c:choose>
      <span itemprop="name">${TESTS[param.TEST_PATH].name}</span></a>
    <meta itemprop="position" content="2">
</li>