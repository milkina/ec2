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
                   </ul>
               </div>
               <div class="footer-section social">
                   <h2><spring:message code="follow.us"/></h2>
                   <div class="social-icons">
                       <div id="sprite-icon_vkontakte" class="socialIcon" onclick="window.location.href='http://vk.com/club44323672'"></div>
                       <div id="sprite-icon_twitter" class="socialIcon" onclick="window.location.href='http://twitter.com/ExamClouds'"></div>
                       <div id="sprite-icon_facebook" class="socialIcon" onclick="window.location.href='http://www.facebook.com/Examclouds'"></div>
                   </div>
                   <div class="patreon-class">
                      <a href="https://www.patreon.com/bePatron?u=71601793" data-patreon-widget-type="become-patron-button">Become a Patron!</a><script async src="https://c6.patreon.com/becomePatronButton.bundle.js"></script>
                   </div>
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
<script>
+function($){
  $(document).ready(function(){
    $('.external-reference').replaceWith (function (){return'<a onclick="return !window.open(this.href)" href="'+$(this).data('link')+'" title="'+$(this).text()+'" >'+$(this).html()+'</a>';});
  });
}(jQuery);
</script>
