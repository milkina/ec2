var LearnedProgress = (function() {
    var LS_KEY = 'learnedCategories';

    /* --- Core helpers --- */

    function fetchLearnedIds(ctx, testPath) {
        return fetch(ctx + '/learned-categories?TEST_PATH=' + encodeURIComponent(testPath))
            .then(function(r) { return r.json(); })
            .then(function(data) {
                return data.status === 'ok' ? new Set(data.ids || []) : new Set();
            })
            .catch(function() {
                return new Set();
            });
    }

    function lsGet() {
        try { return JSON.parse(localStorage.getItem(LS_KEY)) || []; } catch(e){ return []; }
    }

    function lsSet(arr) {
        localStorage.setItem(LS_KEY, JSON.stringify(arr));
    }

    function getLearnedSet(ctx, testPath, isLoggedIn) {
        if (isLoggedIn) {
            return fetchLearnedIds(ctx, testPath);
        } else {
            return Promise.resolve(new Set(lsGet()));
        }
    }

    function moduleProgress(lessonIds, learnedSet) {
        if (lessonIds.length === 0) return { learned: 0, total: 0, pct: 0, complete: false };
        var learned = 0;
        lessonIds.forEach(function(id) { if (learnedSet.has(id)) learned++; });
        return {
            learned: learned,
            total: lessonIds.length,
            pct: Math.round(learned * 100 / lessonIds.length),
            complete: learned === lessonIds.length
        };
    }

    /* --- Category page (show-category.jsp) --- */

    function initCategoryPage(cfg) {
        var CTX = cfg.ctx;
        var CATEGORY_ID = cfg.categoryId;
        var TEST_PATH = cfg.testPath;
        var IS_LOGGED_IN = cfg.isLoggedIn;
        var SERVER_LEARNED = cfg.serverLearned;
        var LABEL_MARK = cfg.labelMark;
        var LABEL_OF = cfg.labelOf;
        var LABEL_LEARNED_WORD = cfg.labelLearnedWord;
        var LABEL_LESSONS_LEARNED = cfg.labelLessonsLearned || '';

        var modules = [];
        var outlineRoot = document.querySelector('.lesson-outline') || document;
        outlineRoot.querySelectorAll('.ol-module').forEach(function(mod) {
            var idsStr = mod.getAttribute('data-sub-ids');
            var total = parseInt(mod.getAttribute('data-sub-total'), 10) || 0;
            if (!idsStr || total === 0) return;
            var ids = idsStr.split(',').map(function(id) { return parseInt(id, 10); });
            modules.push({ el: mod, ids: ids, total: total });
        });

        var learnedSet = new Set();

        function updateUI() {
            var btn = document.getElementById('btnLearned');
            var isLearned = learnedSet.has(CATEGORY_ID);
            if (btn) {
                btn.classList.toggle('is-learned', isLearned);
                var label = btn.querySelector('.btn-learned-label');
                if (label) label.textContent = LABEL_MARK;
                var check = btn.querySelector('.btn-learned-check');
                if (check) check.textContent = isLearned ? '\u2713' : '';
            }
            var totalModules = modules.length;
            var completedModules = 0;
            modules.forEach(function(m) {
                var mp = moduleProgress(m.ids, learnedSet);
                if (mp.complete) completedModules++;
                var summary = m.el.querySelector('summary');
              //  if (summary) summary.classList.toggle('is-completed', mp.complete);
                /* Module counter (e.g. 2/5) — hidden when 0 learned */
                var counter = m.el.querySelector('.ol-counter');
                if (counter) {
                    if (mp.learned > 0) {
                        counter.textContent = mp.learned + '/' + mp.total;
                        counter.style.display = '';
                    } else {
                        counter.style.display = 'none';
                    }
                }
                /* Thin progress bar under module title */
                var bar = m.el.querySelector('.ol-module-bar');
                if (bar) {
                    bar.querySelector('span').style.width = mp.pct + '%';
                    bar.style.display = '';
                }
                /* Summary text at bottom of expanded module */
                var summaryText = m.el.querySelector('.ol-module-summary');
                if (summaryText) {
                    if (mp.learned > 0) {
                        summaryText.textContent = mp.learned + ' ' + LABEL_OF + ' ' + mp.total + ' ' + LABEL_LESSONS_LEARNED;
                        summaryText.style.display = '';
                    } else {
                        summaryText.style.display = 'none';
                    }
                }
            });
            var pct = totalModules > 0 ? Math.round(completedModules * 100 / totalModules) : 0;
            var fill = document.getElementById('learnedBarFill');
            if (fill) fill.style.width = pct + '%';
            var stats = document.getElementById('learnedStats');
            if (stats) stats.textContent = completedModules + ' ' + LABEL_OF + ' ' + totalModules + ' ' + LABEL_LEARNED_WORD + ' \u00b7 ' + pct + '%';
            outlineRoot.querySelectorAll('.ol-lessons a[data-cat-id]').forEach(function(a) {
                var cid = parseInt(a.getAttribute('data-cat-id'), 10);
                var dot = a.querySelector('.ol-dot');
                if (dot) dot.classList.toggle('is-learned', learnedSet.has(cid));
            });
        }

        function toggleLearned() {
            var isLearned = learnedSet.has(CATEGORY_ID);
            if (IS_LOGGED_IN) {
                var url = CTX + (isLearned ? '/unmark-learned' : '/mark-learned');
                var xhr = new XMLHttpRequest();
                xhr.open('POST', url, true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function() {
                    if (isLearned) learnedSet.delete(CATEGORY_ID); else learnedSet.add(CATEGORY_ID);
                    updateUI();
                };
                xhr.send('categoryId=' + CATEGORY_ID);
            } else {
                var arr = lsGet();
                if (isLearned) {
                    arr = arr.filter(function(id) { return id !== CATEGORY_ID; });
                    learnedSet.delete(CATEGORY_ID);
                } else {
                    arr.push(CATEGORY_ID);
                    learnedSet.add(CATEGORY_ID);
                }
                lsSet(arr);
                updateUI();
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            var btn = document.getElementById('btnLearned');
            if (btn) btn.addEventListener('click', toggleLearned);

            getLearnedSet(CTX, TEST_PATH, IS_LOGGED_IN).then(function(set) {
                learnedSet = set;
                updateUI();
            }).catch(function() {
                learnedSet = SERVER_LEARNED ? new Set([CATEGORY_ID]) : new Set();
                updateUI();
            });
        });
    }

    /* --- Course page (show-course.jsp) --- */

    function initCoursePage(cfg) {
        var CTX = cfg.ctx;
        var TEST_PATH = cfg.testPath;
        var LABEL_OF = cfg.labelOf;
        var LABEL_LEARNED_WORD = cfg.labelLearnedWord;

        getLearnedSet(CTX, TEST_PATH, true).then(function(learnedSet) {
            var totalModules = 0, completedModules = 0;
            var rings = document.querySelectorAll('.module-progress-ring');
            rings.forEach(function(ring) {
                var idsStr = ring.getAttribute('data-sub-ids');
                if (!idsStr) return;
                var ids = idsStr.split(',').map(function(id) { return parseInt(id, 10); });
                var mp = moduleProgress(ids, learnedSet);
                ring.style.setProperty('--p', mp.pct);
                ring.querySelector('span').textContent = mp.pct + '%';
                ring.style.display = '';
                totalModules++;
                if (mp.complete) completedModules++;
            });

            var overallEl = document.getElementById('course-overall-progress');
            if (overallEl && totalModules > 0) {
                var overallPct = Math.round(completedModules * 100 / totalModules);
                document.getElementById('overall-pct').textContent = overallPct + '%';
                document.getElementById('overall-bar').style.width = overallPct + '%';
                var stats = document.getElementById('overall-stats');
                if (stats) stats.textContent = completedModules + ' ' + LABEL_OF + ' ' + totalModules + ' ' + LABEL_LEARNED_WORD + ' \u00b7 ' + overallPct + '%';
                overallEl.style.display = '';
            }
        });
    }

    return {
        getLearnedSet: getLearnedSet,
        lsGet: lsGet,
        lsSet: lsSet,
        moduleProgress: moduleProgress,
        initCategoryPage: initCategoryPage,
        initCoursePage: initCoursePage
    };
})();
