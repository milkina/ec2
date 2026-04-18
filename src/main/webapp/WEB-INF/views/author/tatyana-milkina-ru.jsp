<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri = "http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<t:wrapper>
  <jsp:attribute name="header">
    <title><spring:message code="my.profile.label"/> | ExamClouds</title>
    <meta name="robots" content="noindex">
 </jsp:attribute>
 <jsp:body>
    <div class="mainArea">
      <h1>Об авторе</h1>
      <div class="author-box">
          <img src="https://img.examclouds.com/general/tatyana-milkina.jpg" alt="Tatyana Milkina Java Developer" />
          <h2>Tatyana Milkina</h2>
          <p><strong>Senior Java Developer & Java Instructor</strong></p>
          <p>
              I am a Java developer with over 10 years of experience in software engineering and education.
              I have worked on enterprise systems in healthcare, telecom, and HR domains using Java, Spring Framework and Hibernate.
          </p>
          <h3>Experience</h3>
          <ul>
              <li>10+ years in software development</li>
              <li>7 years as Java Developer</li>
              <li>3+ years teaching Java Core and OOP</li>
          </ul>
          <h3>Topics I write about</h3>
          <ul>
              <li>Java Core</li>
              <li>OOP Principles</li>
          </ul>
      </div>
    </div>
    <BR>
 </jsp:body>
 </t:wrapper>