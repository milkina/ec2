<%@tag description="Wrapper Tag with 2 columns" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true"%>
<%@attribute name="language" fragment="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<!DOCTYPE html>
<%
    String lang = (String) session.getAttribute("pageLanguage");
%>
<html lang="<%= lang %>">
        <head>
            <%@ include file="/WEB-INF/head-new.jsp"%>
            <jsp:invoke fragment="header"/>
        </head>
        <body>
           <jsp:include page="/WEB-INF/header.jsp"/>
           <jsp:doBody/>
           <%@ include file="/WEB-INF/footer-new.jsp"%>
        </body>
</html>