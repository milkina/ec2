<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="/WEB-INF/tld/menu-jsp-taglib.tld" prefix="menu"%>
<div class="nav-courses">
        <button class="nav-courses-btn" type="button" data-courses-toggle aria-expanded="false" aria-haspopup="true">
          <spring:message code="courses"/>
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
        </button>
        <div class="mega-menu" data-courses-panel hidden>
          <div class="container mega-grid">
            <div class="mega-col">
              <h4>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
                Java Basics
              </h4>
              <a href="${pageContext.request.contextPath}/java-core"><b>Java Core</b><span>Full Java Course</span></a>
              <a href="${pageContext.request.contextPath}/java/java-core/language-lexicon"><b>Java Syntax</b><span>Variables, methods, data types</span></a>
              <a href="${pageContext.request.contextPath}/java/java-core/procedural-vs-object-oriented-programming"><b>OOP in Java</b><span>Classes, objects, inheritance</span></a>
              <a href="${pageContext.request.contextPath}/java/java-core/array-declaration-initialization"><b>Arrays</b><span>Explore arrays of different dimensions</span></a>
              <a href="${pageContext.request.contextPath}/java/java-core/inner-classes"><b>Inner Classes</b><span>Regular, local, anonymous, static</span></a>
            </div>
            <div class="mega-col">
              <h4>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>
                Tasks
              </h4>
              <a href="${pageContext.request.contextPath}/practical-java-tasks""><b>Practical tasks</b><span>Tasks of different levels</span></a>
              <a href="${pageContext.request.contextPath}/tests"><b>Tests</b><span>Test your knowledge</span></a>
              <a href="${pageContext.request.contextPath}/questions"><b>Quizzes</b><span>Revise your knowledge</span></a>
            </div>
            <div class="mega-col">
              <h4>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M22 10v6M2 10l10-5 10 5-10 5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg>
                Advanced
              </h4>
              <a href="${pageContext.request.contextPath}/java/java-core/lambda-expression"><b>Lambda in Java</b><span>Lambda expressions, method references</span></a>
              <a href="${pageContext.request.contextPath}/java/java-core/create-stream-api"><b>Stream API</b><span>Functional programming</span></a>
              <a href="${pageContext.request.contextPath}/web-services"><b>Web Services</b><span>REST, SOAP, XML</span></a>
              <a href="${pageContext.request.contextPath}/java/java-core/version-control-system"><b>Git and GitHub</b><span>Version control systems, GitHub, git</span></a>
            </div>
            <aside class="mega-promo">
              <div class="mega-promo-icon" aria-hidden="true">
                <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M4.5 16.5c-1.5 1.26-2 5-2 5s3.74-.5 5-2c.71-.84.7-2.13-.09-2.91a2.18 2.18 0 0 0-2.91-.09z"/><path d="M12 15l-3-3a22 22 0 0 1 2-3.95A12.88 12.88 0 0 1 22 2c0 2.72-.78 7.5-6 11a22.35 22.35 0 0 1-4 2z"/><path d="M9 12H4s.55-3.03 2-4c1.62-1.08 5 0 5 0"/><path d="M12 15v5s3.03-.55 4-2c1.08-1.62 0-5 0-5"/></svg>
              </div>
              <h5>Make your first step to Java Developer</h5>
              <p>Step by step learning</p>
              <a class="btn btn-primary btn-sm mega-cta" href="${pageContext.request.contextPath}/java-core">Start learning →</a>
              <a class="btn btn-outline btn-sm mega-cta-outline" href="${pageContext.request.contextPath}/java-core">See full path</a>
            </aside>
          </div>
          <!-- Feature strip -->
          <div class="mega-feats">
            <div class="container mega-feats-grid">
              <div class="mega-feat">
                <span class="mega-feat-ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 2 7 12 12 22 7 12 2"/><polyline points="2 17 12 22 22 17"/><polyline points="2 12 12 17 22 12"/></svg></span>
                <div><b>Free</b><span>All materials free of charge</span></div>
              </div>
              <div class="mega-feat">
                <span class="mega-feat-ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg></span>
                <div><b>Step by step</b><span>Simple to complex</span></div>
              </div>
              <div class="mega-feat">
                <span class="mega-feat-ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg></span>
                <div><b>Tasks and tests</b><span>Improve your skills</span></div>
              </div>
              <div class="mega-feat">
                <span class="mega-feat-ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M22 10v6M2 10l10-5 10 5-10 5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg></span>
                <div><b>Suitable for beginners</b><span>Start from scratch</span></div>
              </div>
            </div>
          </div>
        </div>
      </div>
