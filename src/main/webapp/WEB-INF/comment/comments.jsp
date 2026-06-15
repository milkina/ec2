<%@taglib uri="/WEB-INF/tld/commentjsp-taglib.tld" prefix="comment"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page trimDirectiveWhitespaces="true"%>
<div class="container">
<section class="comments-section">
  <h2 class="comments-heading">
    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
    <spring:message code="comments"/>
  </h2>
  <div class="comments-list" id="commentDiv">
   <comment:commentList type="${param.commentType}" referenceId="${param.referenceId}">
       <comment:comment>
           <article class="comment-card">
              <div class="comment-card-header">
                <span class="comment-avatar">
                  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                </span>
                <span class="comment-author"><comment:author/></span>
                <span class="comment-date"><comment:createdDate/></span>
              </div>
              <div class="comment-body"><comment:body/></div>
           </article>
       </comment:comment>
   </comment:commentList>
   </div>
   <form action="<%=request.getContextPath()%>/save-comment" name="addCommentForm" id="addCommentForm" class="comment-form">
      <input type="hidden" name="COMMENT_TYPE" value="${param.commentType}">
      <input type="hidden" name="REFERENCE_ID" value="${param.referenceId}">
      <textarea class="comment-textarea" name="commentText" id="commentText"
         placeholder="<spring:message code="leave.comment"/>" rows="3"></textarea>
      <button type="button" id="save" class="btn btn-primary btn-sm" data-comment-submit data-ctx="<%=request.getContextPath()%>">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
        <spring:message code="add.comment"/>
      </button>
   </form>
   <dialog class="comment-dialog" id="commentModal">
     <div class="comment-dialog-body">
       <p><spring:message code="comment.not.added"/></p>
       <button type="button" class="btn btn-primary btn-sm" data-comment-dialog-close>Ok</button>
     </div>
   </dialog>
</section>
</div>