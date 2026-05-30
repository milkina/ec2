<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:wrapper2>
<jsp:attribute name="language">lang="<spring:message code='lang'/>"</jsp:attribute>
 <jsp:attribute name="header">
    <title>ExamClouds</title>
    <meta name="description" content="${message} ${param.message} - ExamClouds">
 </jsp:attribute>
 <jsp:body>
   <main style="height:200px">
      <h1>ExamClouds</h1>
      <BR><BR>
      <span id="message">${message} ${param.message}</span>
   </main>
 </jsp:body>
</t:wrapper2>