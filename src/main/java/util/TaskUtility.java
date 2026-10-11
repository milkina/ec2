package util;

import com.googlecode.htmlcompressor.compressor.HtmlCompressor;
import model.Category;
import model.Test;
import model.article.Article;
import model.task.Task;
import model.task.TaskProject;
import org.springframework.ui.Model;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import static util.AllConstantsAttribute.TASKS_BY_LESSON;
import static util.AllConstantsAttribute.TASKS_BY_PAGE;

/**
 * Кэш практических задач в ServletContext:
 * TASKS_BY_PAGE   — Map&lt;id категории-страницы «Задания», List&lt;Task&gt;&gt;;
 * TASKS_BY_LESSON — Map&lt;id категории-урока, List&lt;Task&gt;&gt; (по task_lesson).
 * Списки упорядочены по странице, orderId, id; оба кэша неизменяемые.
 */
public class TaskUtility extends SpringUtility {
    private static final Logger logger = Logger.getLogger(TaskUtility.class.getName());

    private static final HtmlCompressor HTML_COMPRESSOR = new HtmlCompressor();

    /** Место в article.text страницы «Задания», куда шаблон подставляет задачи из таблицы task. */
    public static final String TASKS_MARKER = "<!--TASKS-->";

    public static final String TASKS_ATTRIBUTE = "TASKS";
    public static final String ARTICLE_HEAD_ATTRIBUTE = "ARTICLE_HEAD";
    public static final String ARTICLE_TAIL_ATTRIBUTE = "ARTICLE_TAIL";
    public static final String HAS_FAQ_ATTRIBUTE = "HAS_FAQ";

    /**
     * Если у категории есть задачи и в тексте статьи стоит {@link #TASKS_MARKER}, кладёт в модель
     * TASKS, ARTICLE_HEAD (текст до маркера), ARTICLE_TAIL (после маркера) и HAS_FAQ.
     * Иначе ничего не делает — страница выводит article.text целиком, как раньше.
     */
    public static void addTasksToModel(Model model, ServletContext servletContext, Category category) {
        Article article = category.getArticle();
        String text = article == null ? null : article.getText();
        if (text == null) {
            return;
        }
        int markerIndex = text.indexOf(TASKS_MARKER);
        if (markerIndex < 0) {
            return;
        }
        List<Task> tasks = getTasksByPage(servletContext, category.getId());
        if (tasks.isEmpty()) {
            logger.warning("Article of category " + category.getId() + " has " + TASKS_MARKER + " but no tasks in cache");
            return;
        }
        String tail = text.substring(markerIndex + TASKS_MARKER.length());
        model.addAttribute(TASKS_ATTRIBUTE, tasks);
        model.addAttribute(ARTICLE_HEAD_ATTRIBUTE, text.substring(0, markerIndex));
        model.addAttribute(ARTICLE_TAIL_ATTRIBUTE, tail);
        model.addAttribute(HAS_FAQ_ATTRIBUTE, tail.contains("id=\"faq\""));
    }

    public static final String LESSON_TASKS_ATTRIBUTE = "LESSON_TASKS";
    public static final String LESSON_TASKS_TOTAL_ATTRIBUTE = "LESSON_TASKS_TOTAL";
    public static final String LESSON_TASKS_PAGE_ATTRIBUTE = "LESSON_TASKS_PAGE";
    private static final int LESSON_TASKS_LIMIT = 5;
    private static final java.util.regex.Pattern TITLE_NUMBERING = java.util.regex.Pattern.compile(
            "^\\s*(?:(?:Задание|Задача|Task|Exercise)\\s*)?\\d+\\s*[.:)]\\s*", java.util.regex.Pattern.CASE_INSENSITIVE);

    /** Задача для блока «Практика по теме» на странице урока: задача + страница «Задания», где она лежит. */
    public static class LessonTask {
        private final Task task;
        private final Category page;
        private final String href;

        LessonTask(Task task, Category page, String testPath) {
            this.task = task;
            this.page = page;
            // якорь есть, только если страница уже выводит задачи из таблицы (у старых статей сгенерированных id нет)
            this.href = "java/" + testPath + "/" + page.getPathName() + (hasMarker(page) ? "#" + task.getSlug() : "");
        }

        public Task getTask() {
            return task;
        }

        public Category getPage() {
            return page;
        }

        /** Путь без ведущего слэша и без языкового префикса: java/{курс}/{страница}#{slug}. */
        public String getHref() {
            return href;
        }

        /** Заголовок без порядкового номера («13. », «Задача 1. ») — вне страницы заданий он не нужен. */
        public String getDisplayTitle() {
            return TITLE_NUMBERING.matcher(task.getTitle()).replaceFirst("");
        }
    }

    /**
     * Кладёт в модель задачи, которые закрепляют урок (task_lesson): LESSON_TASKS (не больше 5),
     * LESSON_TASKS_TOTAL и LESSON_TASKS_PAGE (страница «Задания» первой задачи — для ссылки «Все задачи»).
     * Учитываются только задачи со страниц того же курса, не скрытых.
     */
    public static void addLessonTasksToModel(Model model, ServletContext servletContext, Category lesson, Test course) {
        if (course == null || course.getCategories() == null) {
            return;
        }
        List<Task> tasks = getTasksByLesson(servletContext, lesson.getId());
        if (tasks.isEmpty()) {
            return;
        }
        Map<Integer, Category> courseCategories = new HashMap<>();
        for (Category c : course.getCategories().values()) {
            courseCategories.put(c.getId(), c);
        }
        List<LessonTask> items = new ArrayList<>();
        for (Task task : tasks) {
            Category page = courseCategories.get(task.getPageCategoryId());
            if (page != null && !page.getHidden() && !page.getId().equals(lesson.getId())) {
                items.add(new LessonTask(task, page, course.getPathName()));
            }
        }
        if (items.isEmpty()) {
            return;
        }
        model.addAttribute(LESSON_TASKS_ATTRIBUTE, items.subList(0, Math.min(LESSON_TASKS_LIMIT, items.size())));
        model.addAttribute(LESSON_TASKS_TOTAL_ATTRIBUTE, items.size());
        model.addAttribute(LESSON_TASKS_PAGE_ATTRIBUTE, items.get(0).getPage());
    }

    public static final String PROJECTS_ATTRIBUTE = "PROJECTS";
    public static final String PROJECT_BADGES_ATTRIBUTE = "PROJECT_BADGES";
    public static final String PROJECT_ANCHORS_ATTRIBUTE = "PROJECT_ANCHORS";
    public static final String FEATURED_PROJECT_ATTRIBUTE = "FEATURED_PROJECT";
    /** Кэш серий: Map&lt;курс (TESTS.pathName), Map&lt;code, TaskProject&gt;&gt;. */
    public static final String TASK_PROJECTS_ATTRIBUTE = "TASK_PROJECTS";

    /**
     * Сквозной проект (серия): задачи с task.project_code, части по project_part, тексты — из task_project.
     * Если строки в task_project нет, вместо названия и заголовка выводится код.
     */
    public static class Project {
        private final String code;
        private final TaskProject meta;
        private final List<LessonTask> parts = new ArrayList<>();

        Project(String code, TaskProject meta) {
            this.code = code;
            this.meta = meta;
        }

        public String getCode() {
            return code;
        }

        public List<LessonTask> getParts() {
            return parts;
        }

        public LessonTask getFirst() {
            return parts.get(0);
        }

        public String getName() {
            return meta == null ? code : meta.getName();
        }

        public String getTitle() {
            return meta == null ? code : meta.getTitle();
        }

        public String getDescription() {
            return meta == null ? null : meta.getDescription();
        }

        public String getNote() {
            return meta == null ? null : meta.getNote();
        }

        /** Большой блок на хабе: серия отмечена featured и в ней не меньше 3 частей. */
        public boolean isBig() {
            return meta != null && meta.isFeatured() && parts.size() >= 3;
        }

        /** Серию выводим на хабе, если в ней хотя бы 2 части. */
        public boolean isShown() {
            return parts.size() >= 2;
        }

        int getOrderId() {
            return meta == null ? Integer.MAX_VALUE : meta.getOrderId();
        }
    }

    /**
     * Для хаба практических задач: PROJECTS — Map&lt;project_code, Project&gt; (по order_id серии),
     * PROJECT_BADGES — Map&lt;id страницы «Задания», List&lt;LessonTask&gt;&gt;,
     * PROJECT_ANCHORS — Map&lt;id страницы, List&lt;Project&gt;&gt;: блок каждой показываемой серии выводится
     * перед карточкой модуля, где начинается эта серия (несколько серий с одной стартовой страницей — по order_id),
     * FEATURED_PROJECT — серия для тизера в шапке хаба (первая с большим блоком) или null.
     */
    public static void addProjectsToModel(Model model, ServletContext servletContext, Test course) {
        Map<Integer, List<LessonTask>> badges = new HashMap<>();
        Map<String, Project> projects = buildProjects(servletContext, course, badges);
        Map<Integer, List<Project>> anchors = new HashMap<>();
        Project featured = null;
        for (Project project : projects.values()) {
            if (project.isShown()) {
                anchors.computeIfAbsent(project.getFirst().getPage().getId(), k -> new ArrayList<>()).add(project);
            }
            if (featured == null && project.isBig()) {
                featured = project;
            }
        }
        model.addAttribute(PROJECTS_ATTRIBUTE, projects);
        model.addAttribute(PROJECT_BADGES_ATTRIBUTE, badges);
        model.addAttribute(PROJECT_ANCHORS_ATTRIBUTE, anchors);
        model.addAttribute(FEATURED_PROJECT_ATTRIBUTE, featured);
    }

    public static final String TASK_SERIES_ATTRIBUTE = "TASK_SERIES";

    /** Положение задачи в сквозном проекте: «часть 3 из 11», соседние части. */
    public static class SeriesNav {
        private final Project project;
        private final int part;
        private final LessonTask prev;
        private final LessonTask next;

        SeriesNav(Project project, int part, LessonTask prev, LessonTask next) {
            this.project = project;
            this.part = part;
            this.prev = prev;
            this.next = next;
        }

        public String getCode() {
            return project.getCode();
        }

        public String getName() {
            return project.getName();
        }

        public int getPart() {
            return part;
        }

        public int getTotal() {
            return project.getParts().size();
        }

        public LessonTask getPrev() {
            return prev;
        }

        public LessonTask getNext() {
            return next;
        }
    }

    /**
     * Для страницы «Задания»: TASK_SERIES — Map&lt;id задачи, SeriesNav&gt; для задач этой страницы,
     * входящих в сквозной проект (серия считается по всем страницам курса; скрытые серии пропускаются).
     */
    public static void addSeriesNavToModel(Model model, ServletContext servletContext, Category page, Test course) {
        List<Task> pageTasks = getTasksByPage(servletContext, page.getId());
        boolean hasSeries = false;
        for (Task task : pageTasks) {
            if (task.getProjectCode() != null && task.getProjectPart() != null) {
                hasSeries = true;
                break;
            }
        }
        if (!hasSeries) {
            return;
        }
        Map<String, Project> projects = buildProjects(servletContext, course, null);
        Map<Integer, SeriesNav> navs = new HashMap<>();
        for (Task task : pageTasks) {
            Project project = task.getProjectCode() == null ? null : projects.get(task.getProjectCode());
            if (project == null) {
                continue;
            }
            List<LessonTask> parts = project.getParts();
            for (int i = 0; i < parts.size(); i++) {
                if (parts.get(i).getTask().getId().equals(task.getId())) {
                    navs.put(task.getId(), new SeriesNav(project, task.getProjectPart(),
                            i > 0 ? parts.get(i - 1) : null, i + 1 < parts.size() ? parts.get(i + 1) : null));
                    break;
                }
            }
        }
        model.addAttribute(TASK_SERIES_ATTRIBUTE, navs);
    }

    /** Серия курса по коду из кэша task_project или null. */
    @SuppressWarnings("unchecked")
    public static TaskProject getTaskProject(ServletContext servletContext, String course, String code) {
        Map<String, Map<String, TaskProject>> cache =
                (Map<String, Map<String, TaskProject>>) servletContext.getAttribute(TASK_PROJECTS_ATTRIBUTE);
        Map<String, TaskProject> byCode = cache == null ? null : cache.get(course);
        return byCode == null ? null : byCode.get(code);
    }

    /**
     * Сквозные проекты курса по project_code (части по project_part), упорядоченные по order_id серии;
     * badges (если не null) — части по страницам.
     */
    private static Map<String, Project> buildProjects(ServletContext servletContext, Test course,
                                                      Map<Integer, List<LessonTask>> badges) {
        Map<String, Project> found = new HashMap<>();
        if (course != null && course.getCategories() != null) {
            for (Category page : course.getCategories().values()) {
                if (page.getHidden()) {
                    continue;
                }
                for (Task task : getTasksByPage(servletContext, page.getId())) {
                    if (task.getProjectCode() == null || task.getProjectPart() == null) {
                        continue;
                    }
                    TaskProject meta = getTaskProject(servletContext, course.getPathName(), task.getProjectCode());
                    LessonTask part = new LessonTask(task, page, course.getPathName());
                    found.computeIfAbsent(task.getProjectCode(), code -> new Project(code, meta)).parts.add(part);
                    if (badges != null) {
                        badges.computeIfAbsent(page.getId(), k -> new ArrayList<>()).add(part);
                    }
                }
            }
        }
        List<Project> ordered = new ArrayList<>(found.values());
        for (Project project : ordered) {
            project.parts.sort(java.util.Comparator.comparing(p -> p.getTask().getProjectPart()));
        }
        ordered.sort(java.util.Comparator.comparingInt(Project::getOrderId).thenComparing(Project::getCode));
        Map<String, Project> projects = new java.util.LinkedHashMap<>();
        for (Project project : ordered) {
            projects.put(project.getCode(), project);
        }
        return projects;
    }

    public static final String PAGE_STATS_ATTRIBUTE = "PAGE_STATS";

    /** Сводка по задачам страницы «Задания» для карточки модуля на хабе. */
    public static class PageStats {
        private int count;
        private int minutes;
        private final Map<model.task.TaskDifficulty, Integer> levels = new java.util.EnumMap<>(model.task.TaskDifficulty.class);

        void add(Task task) {
            count++;
            if (task.getEstimatedMinutes() != null) {
                minutes += task.getEstimatedMinutes();
            }
            levels.merge(task.getDifficulty(), 1, Integer::sum);
        }

        void addAll(PageStats other) {
            count += other.count;
            minutes += other.minutes;
            other.levels.forEach((level, n) -> levels.merge(level, n, Integer::sum));
        }

        public int getCount() {
            return count;
        }

        /** Форма слова для числа задач: one / few / many. */
        public String getCountForm() {
            return pluralForm(count);
        }

        /** Сумма estimated_minutes задач страницы (0 — оценок нет). */
        public int getMinutes() {
            return minutes;
        }

        /** Время, округлённое до получаса: целые часы. */
        public int getWholeHours() {
            return roundedHalfHours() / 2;
        }

        /** Время, округлённое до получаса: есть ли ещё полчаса. */
        public boolean isPlusHalfHour() {
            return roundedHalfHours() % 2 == 1;
        }

        private int roundedHalfHours() {
            return Math.max(2, Math.round(minutes / 30f));
        }

        /** Самый частый уровень задач страницы; при равенстве — более высокий. */
        public model.task.TaskDifficulty getDifficulty() {
            model.task.TaskDifficulty best = null;
            int bestCount = -1;
            for (Map.Entry<model.task.TaskDifficulty, Integer> e : levels.entrySet()) {
                if (e.getValue() >= bestCount) {
                    best = e.getKey();
                    bestCount = e.getValue();
                }
            }
            return best;
        }
    }

    public static final String HUB_GROUPS_ATTRIBUTE = "HUB_GROUPS";
    public static final String HUB_COURSE_ATTRIBUTE = "HUB_COURSE";

    /** Группа карточек хаба: страницы «Задания» одного уровня в порядке курса + сводка по их задачам. */
    public static class HubGroup {
        private final model.task.TaskDifficulty difficulty;
        private final List<Category> pages = new ArrayList<>();
        private final PageStats stats = new PageStats();

        HubGroup(model.task.TaskDifficulty difficulty) {
            this.difficulty = difficulty;
        }

        /** Уровень группы; null — страницы, у которых пока нет задач в таблице. */
        public model.task.TaskDifficulty getDifficulty() {
            return difficulty;
        }

        /** Ключ для подписей и якоря: beginner / intermediate / advanced / other. */
        public String getKey() {
            return difficulty == null ? "other" : difficulty.name().toLowerCase();
        }

        public List<Category> getPages() {
            return pages;
        }

        public PageStats getStats() {
            return stats;
        }

        public String getPagesForm() {
            return pluralForm(pages.size());
        }
    }

    private static boolean isTaskPage(Category c) {
        return c.getParentCategory() != null && !c.getHidden()
                && ("Задания".equals(c.getName()) || "Tasks".equals(c.getName()));
    }

    /** Страницы «Задания» курса, сгруппированные по уровню (порядок групп — BEGINNER, INTERMEDIATE, ADVANCED, без задач). */
    private static List<HubGroup> buildHubGroups(Test course, Map<Integer, PageStats> stats) {
        Map<model.task.TaskDifficulty, HubGroup> byLevel = new java.util.EnumMap<>(model.task.TaskDifficulty.class);
        HubGroup other = new HubGroup(null);
        if (course != null && course.getCategories() != null) {
            for (Category page : course.getCategories().values()) {
                if (!isTaskPage(page)) {
                    continue;
                }
                PageStats pageStats = stats.get(page.getId());
                HubGroup group = pageStats == null ? other
                        : byLevel.computeIfAbsent(pageStats.getDifficulty(), HubGroup::new);
                group.pages.add(page);
                if (pageStats != null) {
                    group.stats.addAll(pageStats);
                }
            }
        }
        List<HubGroup> groups = new ArrayList<>(byLevel.values());
        if (!other.pages.isEmpty()) {
            groups.add(other);
        }
        return groups;
    }

    public static final String TASKS_TOTAL_ATTRIBUTE = "TASKS_TOTAL";
    /** Сумма estimated_minutes видимых задач курса, в часах (округление); 0 — оценок нет. */
    public static final String TASKS_TOTAL_HOURS_ATTRIBUTE = "TASKS_TOTAL_HOURS";
    public static final String TASKS_TOTAL_FORM_ATTRIBUTE = "TASKS_TOTAL_FORM";
    public static final String MODULES_TOTAL_ATTRIBUTE = "MODULES_TOTAL";
    public static final String MODULES_TOTAL_FORM_ATTRIBUTE = "MODULES_TOTAL_FORM";

    /**
     * Форма существительного при числе n для подписей вида key.one / key.few / key.many
     * (правила русского: 1 задача, 2 задачи, 5 задач; в EN few и many совпадают).
     */
    public static String pluralForm(int n) {
        int mod10 = n % 10;
        int mod100 = n % 100;
        if (mod10 == 1 && mod100 != 11) {
            return "one";
        }
        if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) {
            return "few";
        }
        return "many";
    }

    /**
     * Для хаба: PAGE_STATS — Map&lt;id страницы «Задания», PageStats&gt; по видимым задачам курса;
     * TASKS_TOTAL / MODULES_TOTAL (страниц с задачами) и их формы слова *_FORM — для description и текста.
     */
    public static void addPageStatsToModel(Model model, ServletContext servletContext, Test course) {
        Map<Integer, PageStats> stats = new HashMap<>();
        int total = 0;
        int totalMinutes = 0;
        if (course != null && course.getCategories() != null) {
            for (Category page : course.getCategories().values()) {
                if (page.getHidden()) {
                    continue;
                }
                for (Task task : getTasksByPage(servletContext, page.getId())) {
                    stats.computeIfAbsent(page.getId(), k -> new PageStats()).add(task);
                    total++;
                    if (task.getEstimatedMinutes() != null) {
                        totalMinutes += task.getEstimatedMinutes();
                    }
                }
            }
        }
        model.addAttribute(TASKS_TOTAL_HOURS_ATTRIBUTE, Math.round(totalMinutes / 60f));
        model.addAttribute(PAGE_STATS_ATTRIBUTE, stats);
        model.addAttribute(HUB_GROUPS_ATTRIBUTE, buildHubGroups(course, stats));
        model.addAttribute(HUB_COURSE_ATTRIBUTE, course == null ? null : course.getPathName());
        model.addAttribute(TASKS_TOTAL_ATTRIBUTE, total);
        model.addAttribute(TASKS_TOTAL_FORM_ATTRIBUTE, pluralForm(total));
        model.addAttribute(MODULES_TOTAL_ATTRIBUTE, stats.size());
        model.addAttribute(MODULES_TOTAL_FORM_ATTRIBUTE, pluralForm(stats.size()));
    }

    private static boolean hasMarker(Category page) {
        Article article = page.getArticle();
        return article != null && article.getText() != null && article.getText().contains(TASKS_MARKER);
    }

    public static void loadTasksToServletContext(ServletContext servletContext) {
        loadTaskProjectsToServletContext(servletContext);
        List<Task> tasks;
        try {
            tasks = getTaskService(servletContext).getVisibleTasks();
        } catch (RuntimeException e) {
            // Задачи не критичны для работы сайта: при ошибке оставляем прежний кэш (или пустой при старте).
            logger.log(Level.SEVERE, "Failed to load tasks, keeping previous cache", e);
            if (servletContext.getAttribute(TASKS_BY_PAGE) == null) {
                servletContext.setAttribute(TASKS_BY_PAGE, Collections.emptyMap());
                servletContext.setAttribute(TASKS_BY_LESSON, Collections.emptyMap());
            }
            return;
        }

        Map<Integer, List<Task>> byPage = new HashMap<>();
        Map<Integer, List<Task>> byLesson = new HashMap<>();
        for (Task task : tasks) {
            compressHtml(task);
            byPage.computeIfAbsent(task.getPageCategoryId(), k -> new ArrayList<>()).add(task);
            for (Integer lessonId : task.getLessonIds()) {
                byLesson.computeIfAbsent(lessonId, k -> new ArrayList<>()).add(task);
            }
        }
        servletContext.setAttribute(TASKS_BY_PAGE, freeze(byPage));
        servletContext.setAttribute(TASKS_BY_LESSON, freeze(byLesson));
    }

    /** Кэш серий TASK_PROJECTS: Map&lt;курс, Map&lt;code, TaskProject&gt;&gt;. При ошибке оставляем прежний (или пустой). */
    private static void loadTaskProjectsToServletContext(ServletContext servletContext) {
        List<TaskProject> projects;
        try {
            projects = getTaskService(servletContext).getProjects();
        } catch (RuntimeException e) {
            logger.log(Level.SEVERE, "Failed to load task projects, keeping previous cache", e);
            if (servletContext.getAttribute(TASK_PROJECTS_ATTRIBUTE) == null) {
                servletContext.setAttribute(TASK_PROJECTS_ATTRIBUTE, Collections.emptyMap());
            }
            return;
        }
        Map<String, Map<String, TaskProject>> byCourse = new HashMap<>();
        for (TaskProject project : projects) {
            byCourse.computeIfAbsent(project.getCourse(), k -> new HashMap<>()).put(project.getCode(), project);
        }
        Map<String, Map<String, TaskProject>> frozen = new HashMap<>();
        byCourse.forEach((course, byCode) -> frozen.put(course, Collections.unmodifiableMap(byCode)));
        servletContext.setAttribute(TASK_PROJECTS_ATTRIBUTE, Collections.unmodifiableMap(frozen));
    }

    @SuppressWarnings("unchecked")
    public static List<Task> getTasksByPage(ServletContext servletContext, Integer pageCategoryId) {
        return getTasks((Map<Integer, List<Task>>) servletContext.getAttribute(TASKS_BY_PAGE), pageCategoryId);
    }

    @SuppressWarnings("unchecked")
    public static List<Task> getTasksByLesson(ServletContext servletContext, Integer lessonCategoryId) {
        return getTasks((Map<Integer, List<Task>>) servletContext.getAttribute(TASKS_BY_LESSON), lessonCategoryId);
    }

    private static List<Task> getTasks(Map<Integer, List<Task>> cache, Integer categoryId) {
        if (cache == null || categoryId == null) {
            return Collections.emptyList();
        }
        List<Task> tasks = cache.get(categoryId);
        return tasks == null ? Collections.emptyList() : tasks;
    }

    private static void compressHtml(Task task) {
        if (task.getBodyHtml() != null) {
            task.setBodyHtml(HTML_COMPRESSOR.compress(task.getBodyHtml()));
        }
        if (task.getHintHtml() != null) {
            task.setHintHtml(HTML_COMPRESSOR.compress(task.getHintHtml()));
        }
    }

    private static Map<Integer, List<Task>> freeze(Map<Integer, List<Task>> map) {
        Map<Integer, List<Task>> frozen = new HashMap<>(map.size() * 2);
        map.forEach((key, list) -> frozen.put(key, Collections.unmodifiableList(list)));
        return Collections.unmodifiableMap(frozen);
    }
}
