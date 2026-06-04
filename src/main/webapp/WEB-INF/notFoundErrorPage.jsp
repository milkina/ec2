<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:wrapper2>
    <jsp:attribute name="language"> lang="<spring:message code="lang"/>"</jsp:attribute>
    <jsp:attribute name="header">
        <title>Not Found Error Page | ExamClouds</title>
    </jsp:attribute>
    <jsp:body>
      <main>
        <div style="height:200px">Page is removed or does not exist.</div>
      </main>
    </jsp:body>
</t:wrapper2>

