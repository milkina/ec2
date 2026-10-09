package spring.controllers.task;

import model.Category;
import model.OtherLanguage;
import model.Test;
import model.person.Person;
import model.task.Task;
import model.task.TaskDifficulty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import spring.services.task.TaskService;
import util.TaskUtility;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import static util.AllConstantsAttribute.CATEGORY_LISTS;
import static util.AllConstantsAttribute.PERSON_ATTRIBUTE;
import static util.AllConstantsAttribute.TESTS;

/**
 * Админка практических задач (таблица task): список по страницам «Задания»/«Tasks», добавление,
 * редактирование, удаление. Доступ — только sysadmin (проверяется в каждом обработчике).
 */
@Controller
public class TaskAdminController {
    private static final String RU_COURSE = "java-core-russian";
    private static final String EN_COURSE = "java-core";
    private static final Pattern SLUG = Pattern.compile("^[a-z0-9][a-z0-9-]{0,99}$");
    private static final Pattern UID = Pattern.compile("^[A-Za-z0-9_-]{1,80}$");
    private static final Pattern PROJECT_CODE = Pattern.compile("^[a-z0-9-]{1,40}$");

    @Autowired
    private TaskService taskService;

    @Autowired
    private ServletContext servletContext;

    @RequestMapping(value = "/admin-tasks")
    public String showTasks(@RequestParam(value = "page", required = false) Integer pageId,
                            Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!isAdmin(request)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }
        model.addAttribute("TASK_PAGES_RU", getTaskPages(RU_COURSE));
        model.addAttribute("TASK_PAGES_EN", getTaskPages(EN_COURSE));
        model.addAttribute("TASK_COUNTS", taskService.countTasksByPage());
        if (pageId != null) {
            Category page = findTaskPage(pageId);
            if (page != null) {
                model.addAttribute("PAGE", page);
                model.addAttribute("PAGE_COURSE", courseOf(page));
                model.addAttribute("PAGE_TASKS", taskService.getTasksOfPage(pageId));
                model.addAttribute("HAS_MARKER", hasMarker(page));
            }
        }
        return "task/admin-tasks";
    }

    @RequestMapping(value = "/admin-edit-task")
    public String showEditTask(@RequestParam(value = "id", required = false) Integer taskId,
                               @RequestParam(value = "page", required = false) Integer pageId,
                               Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!isAdmin(request)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }
        Task task;
        List<Integer> lessonIds;
        if (taskId != null) {
            task = taskService.getTask(taskId);
            if (task == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return null;
            }
            pageId = task.getPageCategoryId();
            lessonIds = taskService.getLessonIds(taskId);
        } else {
            if (pageId == null || findTaskPage(pageId) == null) {
                return "redirect:/admin-tasks";
            }
            task = newTask(pageId);
            lessonIds = Collections.emptyList();
        }
        fillFormModel(model, task, pageId, lessonIds, Collections.emptyList());
        return "task/admin-edit-task";
    }

    @RequestMapping(value = "/admin-save-task", method = RequestMethod.POST)
    public String saveTask(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!isAdmin(request)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }
        setUtf8(request);
        List<String> errors = new ArrayList<>();

        Integer pageId = parseInt(request.getParameter("page"), "Страница", errors, true);
        Category page = pageId == null ? null : findTaskPage(pageId);
        if (pageId != null && page == null) {
            errors.add("Страница " + pageId + " не найдена среди страниц «Задания»/«Tasks».");
        }

        Task data = new Task();
        data.setId(parseInt(request.getParameter("id"), "id", errors, false));
        data.setUid(trimToNull(request.getParameter("uid")));
        data.setSlug(trimToNull(request.getParameter("slug")));
        data.setTitle(trimToNull(request.getParameter("title")));
        data.setBodyHtml(trimToNull(request.getParameter("bodyHtml")));
        data.setHintTitle(trimToNull(request.getParameter("hintTitle")));
        data.setHintHtml(trimToNull(request.getParameter("hintHtml")));
        data.setSolutionUrl(trimToNull(request.getParameter("solutionUrl")));
        data.setVideoUrl(trimToNull(request.getParameter("videoUrl")));
        data.setEstimatedMinutes(parseInt(request.getParameter("estimatedMinutes"), "Время", errors, false));
        data.setProjectCode(trimToNull(request.getParameter("projectCode")));
        data.setProjectPart(parseInt(request.getParameter("projectPart"), "Часть проекта", errors, false));
        Integer orderId = parseInt(request.getParameter("orderId"), "Порядок", errors, true);
        data.setOrderId(orderId == null ? 0 : orderId);
        data.setHidden(request.getParameter("hidden") != null);
        try {
            data.setDifficulty(TaskDifficulty.valueOf(request.getParameter("difficulty")));
        } catch (RuntimeException e) {
            errors.add("Неизвестный уровень сложности.");
        }

        List<Integer> lessonIds = new ArrayList<>();
        String[] lessonParams = request.getParameterValues("lessons");
        if (lessonParams != null) {
            for (String lesson : lessonParams) {
                Integer id = parseInt(lesson, "Урок", errors, false);
                if (id != null) {
                    lessonIds.add(id);
                }
            }
        }

        validate(data, pageId, errors);

        if (!errors.isEmpty()) {
            fillFormModel(model, data, pageId, lessonIds, errors);
            return "task/admin-edit-task";
        }
        Task saved = taskService.save(data, pageId, lessonIds);
        TaskUtility.loadTasksToServletContext(servletContext);
        return "redirect:/admin-tasks?page=" + pageId + "&saved=" + saved.getId() + "#task-" + saved.getId();
    }

    @RequestMapping(value = "/admin-delete-task", method = RequestMethod.POST)
    public String deleteTask(@RequestParam("id") int taskId,
                             HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!isAdmin(request)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }
        Task task = taskService.getTask(taskId);
        if (task == null) {
            return "redirect:/admin-tasks";
        }
        Integer pageId = task.getPageCategoryId();
        taskService.delete(taskId);
        TaskUtility.loadTasksToServletContext(servletContext);
        return "redirect:/admin-tasks?page=" + pageId + "&deleted=1";
    }

    // ---------- форма ----------

    private void validate(Task data, Integer pageId, List<String> errors) {
        if (data.getTitle() == null) {
            errors.add("Заголовок обязателен.");
        } else if (data.getTitle().length() > 255) {
            errors.add("Заголовок длиннее 255 символов.");
        }
        if (data.getSlug() == null || !SLUG.matcher(data.getSlug()).matches()) {
            errors.add("Slug: только латиница в нижнем регистре, цифры и дефис, до 100 символов (например, scanner-sum).");
        } else if (pageId != null && taskService.isSlugTaken(pageId, data.getSlug(), data.getId())) {
            errors.add("Slug «" + data.getSlug() + "» уже занят другой задачей этой страницы.");
        }
        if (data.getUid() == null || !UID.matcher(data.getUid()).matches()) {
            errors.add("uid: латиница, цифры, дефис или подчёркивание, до 80 символов (например, t287-7).");
        }
        if (data.getBodyHtml() == null) {
            errors.add("Условие задачи обязательно.");
        }
        if (data.getHintTitle() != null && data.getHintTitle().length() > 100) {
            errors.add("Заголовок подсказки длиннее 100 символов.");
        }
        checkUrl(data.getSolutionUrl(), "Ссылка на решение", errors);
        checkUrl(data.getVideoUrl(), "Ссылка на видео", errors);
        if (data.getEstimatedMinutes() != null && (data.getEstimatedMinutes() < 1 || data.getEstimatedMinutes() > 600)) {
            errors.add("Время — от 1 до 600 минут.");
        }
        if (data.getProjectCode() != null && !PROJECT_CODE.matcher(data.getProjectCode()).matches()) {
            errors.add("Код проекта: латиница в нижнем регистре, цифры и дефис (например, online-shop).");
        }
        if (data.getProjectPart() != null && data.getProjectPart() < 1) {
            errors.add("Номер части проекта — положительное число.");
        }
        if ((data.getProjectCode() == null) != (data.getProjectPart() == null)) {
            errors.add("Код проекта и номер части заполняются вместе.");
        }
    }

    private void fillFormModel(Model model, Task task, Integer pageId, List<Integer> lessonIds, List<String> errors) {
        Category page = pageId == null ? null : findTaskPage(pageId);
        String course = page == null ? RU_COURSE : courseOf(page);
        model.addAttribute("TASK", task);
        model.addAttribute("PAGE", page);
        model.addAttribute("PAGE_COURSE", course);
        model.addAttribute("SELECTED_LESSONS", lessonIds);
        model.addAttribute("LESSONS", getLessons(course));
        model.addAttribute("DIFFICULTIES", TaskDifficulty.values());
        model.addAttribute("ERRORS", errors);
        model.addAttribute("HAS_MARKER", page != null && hasMarker(page));
        // для EN-страницы — задачи RU-пары, чтобы взять их uid
        Category pair = page == null ? null : findPairPage(page);
        model.addAttribute("PAIR_PAGE", pair);
        model.addAttribute("PAIR_TASKS", pair == null ? Collections.emptyList() : taskService.getTasksOfPage(pair.getId()));
    }

    private Task newTask(int pageId) {
        List<Task> existing = taskService.getTasksOfPage(pageId);
        int maxOrder = 0;
        for (Task t : existing) {
            maxOrder = Math.max(maxOrder, t.getOrderId());
        }
        Task task = new Task();
        task.setOrderId(maxOrder + 10);
        Category page = findTaskPage(pageId);
        if (page != null && RU_COURSE.equals(courseOf(page))) {
            task.setUid(nextUid(pageId, existing));
        }
        return task;
    }

    /** Следующий свободный uid вида t{pageId}-{n} для RU-страницы. */
    private String nextUid(int pageId, List<Task> existing) {
        String prefix = "t" + pageId + "-";
        int max = 0;
        for (Task t : existing) {
            if (t.getUid() != null && t.getUid().startsWith(prefix)) {
                try {
                    max = Math.max(max, Integer.parseInt(t.getUid().substring(prefix.length())));
                } catch (NumberFormatException ignored) {
                    // uid нестандартного вида — пропускаем
                }
            }
        }
        return prefix + (max + 1);
    }

    // ---------- страницы и уроки из кэша ----------

    @SuppressWarnings("unchecked")
    private Map<String, Test> tests() {
        return (Map<String, Test>) servletContext.getAttribute(TESTS);
    }

    @SuppressWarnings("unchecked")
    private List<Category> orderedCategories(String course) {
        Map<String, List<Category>> lists = (Map<String, List<Category>>) servletContext.getAttribute(CATEGORY_LISTS);
        List<Category> list = lists == null ? null : lists.get(course);
        return list == null ? Collections.emptyList() : list;
    }

    private static boolean isTaskPage(Category c) {
        return c.getParentCategory() != null && ("Задания".equals(c.getName()) || "Tasks".equals(c.getName()));
    }

    private List<Category> getTaskPages(String course) {
        List<Category> pages = new ArrayList<>();
        for (Category c : orderedCategories(course)) {
            if (isTaskPage(c)) {
                pages.add(c);
            }
        }
        return pages;
    }

    private List<Category> getLessons(String course) {
        List<Category> lessons = new ArrayList<>();
        for (Category c : orderedCategories(course)) {
            if (c.getParentCategory() != null && !c.getHidden() && !isTaskPage(c)
                    && (c.getSubCategories() == null || c.getSubCategories().isEmpty())) {
                lessons.add(c);
            }
        }
        return lessons;
    }

    private Category findTaskPage(int pageId) {
        for (String course : new String[]{RU_COURSE, EN_COURSE}) {
            for (Category c : getTaskPages(course)) {
                if (c.getId() == pageId) {
                    return c;
                }
            }
        }
        return null;
    }

    private String courseOf(Category page) {
        Map<String, Test> tests = tests();
        Test en = tests == null ? null : tests.get(EN_COURSE);
        return en != null && en.getCategories().containsKey(page.getPathName())
                && en.getCategories().get(page.getPathName()).getId().equals(page.getId()) ? EN_COURSE : RU_COURSE;
    }

    /** Страница-пара на другом языке (по other_language), если она тоже страница задач. */
    private Category findPairPage(Category page) {
        if (page.getCanonicalUrls() == null) {
            return null;
        }
        String otherCourse = RU_COURSE.equals(courseOf(page)) ? EN_COURSE : RU_COURSE;
        String prefix = "/java/" + otherCourse + "/";
        for (OtherLanguage other : page.getCanonicalUrls().values()) {
            if (other != null && other.getUrl() != null && other.getUrl().startsWith(prefix)) {
                Test test = tests() == null ? null : tests().get(otherCourse);
                Category pair = test == null ? null : test.getCategories().get(other.getUrl().substring(prefix.length()));
                return pair != null && isTaskPage(pair) ? pair : null;
            }
        }
        return null;
    }

    private static boolean hasMarker(Category page) {
        return page.getArticle() != null && page.getArticle().getText() != null
                && page.getArticle().getText().contains(TaskUtility.TASKS_MARKER);
    }

    // ---------- утилиты ----------

    private static boolean isAdmin(HttpServletRequest request) {
        Person person = (Person) request.getSession().getAttribute(PERSON_ATTRIBUTE);
        return person != null && Boolean.TRUE.equals(person.isSysadmin());
    }

    private static void setUtf8(HttpServletRequest request) {
        try {
            if (request.getCharacterEncoding() == null) {
                request.setCharacterEncoding("UTF-8");
            }
        } catch (UnsupportedEncodingException ignored) {
            // UTF-8 поддерживается всегда
        }
    }

    private static String trimToNull(String s) {
        if (s == null) {
            return null;
        }
        String t = s.trim();
        return t.isEmpty() ? null : t;
    }

    private static Integer parseInt(String s, String field, List<String> errors, boolean required) {
        String t = trimToNull(s);
        if (t == null) {
            if (required) {
                errors.add(field + ": обязательное поле.");
            }
            return null;
        }
        try {
            return Integer.valueOf(t);
        } catch (NumberFormatException e) {
            errors.add(field + ": нужно целое число.");
            return null;
        }
    }

    private static void checkUrl(String url, String field, List<String> errors) {
        if (url == null) {
            return;
        }
        if (url.length() > 500) {
            errors.add(field + " длиннее 500 символов.");
        } else if (!url.startsWith("https://")) {
            errors.add(field + " должна начинаться с https://");
        }
    }
}
