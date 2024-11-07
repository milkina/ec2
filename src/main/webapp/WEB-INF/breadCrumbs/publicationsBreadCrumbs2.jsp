<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="breadCrumbs">
<ol>
  <li>
    <a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>">
         <span><spring:message code="home"/></span></a>
  </li>
  <li><spring:message code="articles"/></li>
 </ol>
 </div>
 <script type="application/ld+json">{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {
        "@type": "ListItem",
        "position": 1,
        "name": "<spring:message code="home"/>",
        "item": "https://www.examclouds.com/<spring:message code="menu.home"/>"
      }
    ]
  }</script>