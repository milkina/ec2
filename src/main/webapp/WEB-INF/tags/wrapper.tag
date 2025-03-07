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
            <%@ include file="/WEB-INF/head_common.jsp"%>
            <jsp:invoke fragment="header"/>
        </head>
        <body class="scroll-style">
           <header>
             <div class="container-fluid menu top round-border-bottom">
               <jsp:include page="/menu.jsp"/>
             </div>
           </header>
           <div class="wrapper container">
              <jsp:doBody/>
           </div>
           <%@ include file="/WEB-INF/footer.jsp"%>
        </body>
</html>