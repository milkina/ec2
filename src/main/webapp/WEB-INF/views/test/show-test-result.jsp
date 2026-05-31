<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:wrapper2>
    <jsp:attribute name="language">lang="${TESTS[param.TEST_PATH].language.code}"</jsp:attribute>
    <jsp:attribute name="header">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/test-result.css?v=1" />
        <meta name="robots" content="noindex">
        <title><spring:message code="test.result"/>&nbsp;${pageLanguage=='en'?'Java Core':'Java Программирование'} | ExamClouds</title>
   </jsp:attribute>
    <jsp:body>
        <main class="quiz-bg">
            <div class="container quiz-wrap">
                <!-- Summary card -->
                <section class="quiz-card results-card">
                    <header class="results-head">
                        <p class="results-eyebrow"><spring:message code="test.result"/></p>
                        <h1 class="results-title">${pageLanguage=='en'?'Java Core':'Java Программирование'}</h1>
                        <p class="quiz-sub">${person.login} · <spring:message code="completed.just.now"/></p>
                    </header>
                    <div class="results-summary">
                        <!-- Score ring -->
                        <fmt:parseNumber var="percent" integerOnly="true" type="number" value="${CURRENT_EXAM_ATTRIBUTE.percent}"/>
                        <div class="score-ring" role="img" aria-label="Score ${percent} percent" style="--pct:${percent};--ring:var(--warning, #f59e0b);">
                            <div class="score-ring-inner">
                                <span class="score-pct">${percent}%</span>
                                <span class="score-label"><spring:message code="score"/></span>
                            </div>
                        </div>

                        <!-- Status + stats -->
                        <div class="results-meta">
                            <c:choose>
                                <c:when test="${percent>=70}">
                                    <span class="status-badge status-pass">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
                                        <spring:message code="test.passed"/>
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-badge status-fail">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/></svg>
                                        <spring:message code="not.passed"/>
                                    </span>
                                    <p class="results-tagline"><spring:message code="test.not.passed"/></p>
                                </c:otherwise>
                            </c:choose>

                            <div class="results-stats">
                                <div class="stat-cell stat-correct">
                                    <span class="stat-ic">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
                                    </span>
                                    <div>
                                        <div class="stat-val"><fmt:parseNumber var="intValue" integerOnly="true" type="number" value="${CURRENT_EXAM_ATTRIBUTE.rightQuestionsCount}"/>
                                            <c:out value="${intValue}"/></div>
                                        <div class="stat-name"><spring:message code="right.answers"/></div>
                                    </div>
                                </div>
                                <div class="stat-cell stat-wrong">
                                    <span class="stat-ic">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
                                    </span>
                                    <div>
                                        <div class="stat-val">${fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)-intValue}</div>
                                        <div class="stat-name"><spring:message code="wrong.answers"/></div>
                                    </div>
                                </div>
                                <div class="stat-cell stat-total">
                                    <span class="stat-ic">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
                                    </span>
                                    <div>
                                        <div class="stat-val">${CURRENT_EXAM_ATTRIBUTE.questionEntries.size()}</div>
                                        <div class="stat-name"><spring:message code="total"/></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Actions -->
                      <footer class="results-actions">
                          <div style="display:flex;align-items:center;gap:12px;flex-wrap:wrap;">
                            <a href="${pageContext.request.contextPath}/retake-test?TEST_PATH=${param.TEST_PATH}" class="btn btn-primary btn-sm">
                              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="1 4 1 10 7 10"/><path d="M3.51 15a9 9 0 1 0 2.13-9.36L1 10"/></svg>
                              <spring:message code="retake.test"/>
                            </a>
                            <a href="${pageContext.request.contextPath}/${pageLanguage=='en'?'java-core':'/ru/java-core-russian'}" class="btn btn-outline btn-sm"><spring:message code="go.to.course"/> &rarr;</a>
                            <c:if test="${percent>=70}">
                            <a href="https://www.trustpilot.com/evaluate/examclouds.com" target="_blank" rel="noopener noreferrer" class="btn btn-sm" style="background-color:#00b67a;color:#fff;border:none;">
                              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                              <spring:message code="rate.us.on.trustpilot"/>
                            </a>
                            <span style="color:#888;font-size:0.85em;">
                              <svg width="12" height="12" viewBox="0 0 24 24" fill="#f5a623" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                              <spring:message code="rated"/>&nbsp;<strong><spring:message code="excellent"/></strong> &middot; 4.8 / 5
                            </span>
                            </c:if>
                          </div>
                        </footer>
                </section>
                <c:if test="${pageLanguage=='ru' && percent<70}">
                <!-- Udemy RU promo banner (failed test) -->
                <section class="udemy-banner udemy-banner--fail">
                    <div>
                        <p class="udemy-banner__eyebrow">💡 Есть пробелы в знаниях?</p>
                        <h3 class="udemy-banner__title">Пройдите полный курс</h3>
                        <p class="udemy-banner__desc">С нуля до уверенного Java-разработчика — на русском языке.</p>
                        <p class="udemy-banner__features">
                            ⭐ 4.8 рейтинг &nbsp;&nbsp; 🎓 Сертификат &nbsp;&nbsp; ♾️ Пожизненный доступ
                        </p>
                    </div>
                    <div class="udemy-banner__price-wrap">
                        <p class="udemy-banner__price-label">Специальная цена</p>
                        <p class="udemy-banner__price">&euro;12.99 <span class="udemy-banner__price-old">&euro;59.99</span></p>
                        <a href="https://www.udemy.com/course/java-bup/?couponCode=ADF90A412F85133F9778" target="_blank" rel="noopener noreferrer sponsored" class="udemy-banner__cta">
                            Начать на Udemy &rarr;
                        </a>
                        <p class="udemy-banner__guarantee">30-дневная гарантия возврата</p>
                    </div>
                </section>
                </c:if>

                <!-- Review section -->
                <section class="results-review">
                    <header class="review-head">
                        <h2 class="review-title"><spring:message code="review.your.answers"/></h2>
                        <div class="review-filters" role="tablist">
                            <button type="button" class="pill pill-active" id="filter-all"><spring:message code="all"/> (${CURRENT_EXAM_ATTRIBUTE.questionEntries.size()})</button>
                            <button type="button" class="pill" id="filter-correct"><spring:message code="right.answers"/> (<fmt:parseNumber var="intValue" integerOnly="true" type="number" value="${CURRENT_EXAM_ATTRIBUTE.rightQuestionsCount}"/>
                                <c:out value="${intValue}"/>)</button>
                            <button type="button" class="pill" id="filter-wrong"><spring:message code="wrong.answers"/> (${fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)-intValue})</button>
                        </div>
                    </header>
                    <c:set var="letters" value="${['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']}"/>
                    <c:forEach var="number" begin="1" end="${fn:length(CURRENT_EXAM_ATTRIBUTE.questionEntries)}">
                        <c:set var="isCorrect" value="${CURRENT_EXAM_ATTRIBUTE.questionEntries[number-1].isCorrectAnswered()}"/>
                        <c:set var="answers" value="${CURRENT_EXAM_ATTRIBUTE.questionEntries[number-1].answers}"></c:set>
                        <c:set var="userAnswers" value="${CURRENT_EXAM_ATTRIBUTE.questionEntries[number-1].userAnswers}"></c:set>
                        <c:set var="totalCorrect" value="0"/>
                        <c:set var="userSelectedCorrect" value="0"/>
                        <c:forEach var="j" begin="0" end="${fn:length(answers)-1}">
                            <c:if test="${answers[j].correct}">
                                <c:set var="totalCorrect" value="${totalCorrect + 1}"/>
                                <c:if test="${userAnswers[j].correct}">
                                    <c:set var="userSelectedCorrect" value="${userSelectedCorrect + 1}"/>
                                </c:if>
                            </c:if>
                        </c:forEach>
                        <article class="result-q ${isCorrect?'is-correct':'is-wrong'}">
                            <header class="result-q-head">
                                <span class="result-q-num"><spring:message code="question"/>&nbsp;${number} </span>
                                <c:if test="${isCorrect}">
                                    <span class="result-tag tag-correct">
                                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
                                        <spring:message code="right.answers"/>
                                    </span>
                                </c:if>
                                <c:if test="${not isCorrect}">
                                    <span class="result-tag tag-wrong">
                                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
                                        <spring:message code="wrong.answers"/>
                                    </span>
                                </c:if>
                            </header>
                            <h3 class="result-q-title">${CURRENT_EXAM_ATTRIBUTE.questionEntries[number-1].question.text}</h3>
                            <c:if test="${not isCorrect && userSelectedCorrect > 0 && totalCorrect > 1}">
                                <div class="result-hint hint-box">
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 14c.2-1 .7-1.7 1.5-2.5 1-.9 1.5-2.2 1.5-3.5A6 6 0 0 0 6 8c0 1.3.5 2.6 1.5 3.5.8.7 1.3 1.5 1.5 2.5"/><path d="M9 18h6"/><path d="M10 22h4"/></svg>
                                    <spring:message code="selected.correct.of" arguments="${userSelectedCorrect},${totalCorrect}"/>
                                </div>
                            </c:if>
                            <div class="result-row">
                                <span class="result-row-label"><spring:message code="your.answer"/></span>
                                <c:forEach var="j" begin="0" end="${fn:length(answers)-1}">
                                    <c:if test="${userAnswers[j].correct}">
                                        <div class="result-ans ${answers[j].correct?'ans-correct':'ans-wrong'}">
                                            <span class="ans-letter">${letters[j]}</span>
                                            <span class="ans-text">${userAnswers[j].text}</span>
                                            <span class="ans-mark" aria-hidden="true">
                                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
                                            </span>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <c:if test="${not isCorrect}">
                                <div class="result-row">
                                    <span class="result-row-label"><spring:message code="right.answer"/></span>
                                    <c:forEach var="j" begin="0" end="${fn:length(answers)-1}">
                                        <c:if test="${answers[j].correct}">
                                            <div class="result-ans ans-correct">
                                                <span class="ans-letter">${letters[j]}</span>
                                                <span class="ans-text">${answers[j].text}</span>
                                                <span class="ans-mark" aria-hidden="true">
                                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
                                                </span>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </article>
                    </c:forEach>
                </section>

                <script>
                    document.addEventListener('DOMContentLoaded', function() {
                        const filterAll = document.getElementById('filter-all');
                        const filterCorrect = document.getElementById('filter-correct');
                        const filterWrong = document.getElementById('filter-wrong');
                        const questions = document.querySelectorAll('.result-q');
                        const buttons = document.querySelectorAll('.review-filters .pill');

                        function setActiveButton(activeButton) {
                            buttons.forEach(btn => btn.classList.remove('pill-active'));
                            activeButton.classList.add('pill-active');
                        }

                        function showAllQuestions() {
                            questions.forEach(q => q.style.display = 'block');
                        }

                        function showCorrectQuestions() {
                            questions.forEach(q => {
                                if (q.classList.contains('is-correct')) {
                                    q.style.display = 'block';
                                } else {
                                    q.style.display = 'none';
                                }
                            });
                        }

                        function showWrongQuestions() {
                            questions.forEach(q => {
                                if (q.classList.contains('is-wrong')) {
                                    q.style.display = 'block';
                                } else {
                                    q.style.display = 'none';
                                }
                            });
                        }

                        filterAll.addEventListener('click', function() {
                            setActiveButton(filterAll);
                            showAllQuestions();
                        });

                        filterCorrect.addEventListener('click', function() {
                            setActiveButton(filterCorrect);
                            showCorrectQuestions();
                        });

                        filterWrong.addEventListener('click', function() {
                            setActiveButton(filterWrong);
                            showWrongQuestions();
                        });
                    });
                </script>


                <c:if test="${pageLanguage=='ru' && percent>=70}">
                <!-- Udemy RU promo banner -->
                <section class="udemy-banner">
                    <div>
                        <p class="udemy-banner__eyebrow">🎉 Отличный результат!</p>
                        <h3 class="udemy-banner__title">Готовы идти дальше?</h3>
                        <p class="udemy-banner__desc">Углубите знания с полным курсом Java SE на русском языке.</p>
                        <p class="udemy-banner__features">
                            ⭐ 4.8 рейтинг &nbsp;&nbsp; 🎓 Сертификат &nbsp;&nbsp; ♾️ Пожизненный доступ
                        </p>
                    </div>
                    <div class="udemy-banner__price-wrap">
                        <p class="udemy-banner__price-label">Специальная цена</p>
                        <p class="udemy-banner__price">&euro;12.99 <span class="udemy-banner__price-old">&euro;59.99</span></p>
                        <a href="https://www.udemy.com/course/java-bup/?couponCode=ADF90A412F85133F9778" target="_blank" rel="noopener noreferrer sponsored" class="udemy-banner__cta">
                            Начать на Udemy &rarr;
                        </a>
                        <p class="udemy-banner__guarantee">30-дневная гарантия возврата</p>
                    </div>
                </section>
                </c:if>

            </div>
        </main>
    </jsp:body>
</t:wrapper2>