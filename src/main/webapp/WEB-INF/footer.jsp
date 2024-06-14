<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid footer menu round-border-top">
  	<div class="container">
       <footer class="footer">
           <div class="footer-container">
               <div class="footer-section about">
                   <h2><spring:message code="about.us"/></h2>
                   <p><spring:message code="about.us.text"/></p>
               </div>
               <div class="footer-section links">
                   <h2><spring:message code="quick.links"/></h2>
                   <ul>
                       <li><a href="<menu:homeTag/>"><spring:message code="home"/></a></li>
                       <li><a href="<menu:privacyTag/>"><spring:message code="privacy"/></a></li>
                       <c:forEach var="test" items="${TESTS}">
                         <c:if test="${test.value.language.code==pageLanguage}">
                            <li><a href="${pageContext.request.contextPath}/<spring:message code="menu.home"/>${test.value.fullPathName}">
                                ${test.value.name}</a></li>
                         </c:if>
                       </c:forEach>
                   </ul>
               </div>
               <div class="footer-section social">
                   <h2><spring:message code="follow.us"/></h2>
                   <ul class="social-icons">
                           <li><a href="https://www.patreon.com/bePatron?u=71601793" target="_blank" rel="nofollow"><i class="fab fa-patreon"></i> Patreon</a></li>
                           <li><a href="https://www.youtube.com/c/tatyanamilkina" target="_blank" rel="nofollow"><i class="fab fa-youtube"></i> YouTube</a></li>
                           <li><a href="http://vk.com/club44323672" target="_blank" rel="nofollow"><i class="fab fa-vk"></i> VKontakte</a></li>
                           <li><a href="http://www.facebook.com/Examclouds" target="_blank" rel="nofollow"><i class="fab fa-facebook"></i> Facebook</a></li>
                           <li><a href="http://twitter.com/ExamClouds" target="_blank" rel="nofollow"><i class="fab fa-twitter"></i> Twitter</a></li>
                    </ul>
                    <div class="contactUsEmail footerItem">
                                <address class="glyphicon glyphicon-envelope">
                       		  <a href="mailto:tatyana.milkina@gmail.com">tatyana.milkina@gmail.com</a>
                       		 </address>
                    </div>
               </div>
           </div>
           <div class="footer-bottom">
               &copy; 2024 ExamClouds. All Rights Reserved.
           </div>
       </footer>
    </div>
</div>

