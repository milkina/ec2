package util;

import model.Category;
import model.Test;
import model.task.Task;
import org.springframework.ui.Model;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static util.AllConstantsAttribute.TESTS;

/**
 * Данные для главной страницы курса: реальные числа (уроки, видео, задачи, тестовые вопросы)
 * и программа курса по модулям — вместо захардкоженных «240+» / «200+» в шаблоне.
 */
public class HomeUtility {

    public static final String HOME_LESSONS_ATTRIBUTE = "HOME_LESSONS";
    public static final String HOME_VIDEOS_ATTRIBUTE = "HOME_VIDEOS";
    public static final String HOME_TASKS_ATTRIBUTE = "HOME_TASKS";
    public static final String HOME_MODULES_ATTRIBUTE = "HOME_MODULES";
    public static final String HOME_STUDY_HOURS_ATTRIBUTE = "HOME_STUDY_HOURS";
    public static final String HOME_STUDY_MONTHS_ATTRIBUTE = "HOME_STUDY_MONTHS";
    /** Средняя длительность урока для оценки общего времени (уроки по 5–15 минут). */
    private static final int MINUTES_PER_LESSON = 10;

    /** Модуль курса для блока «Программа курса»: первый урок, число уроков и задач. */
    public static class ProgramModule {
        private final Category module;
        private final int number;
        private Category firstLesson;
        private Category tasksPage;
        private int lessons;
        private int tasks;

        ProgramModule(Category module, int number) {
            this.module = module;
            this.number = number;
        }

        public Category getModule() {
            return module;
        }

        public int getNumber() {
            return number;
        }

        public Category getFirstLesson() {
            return firstLesson;
        }

        public Category getTasksPage() {
            return tasksPage;
        }

        public int getLessons() {
            return lessons;
        }

        public int getTasks() {
            return tasks;
        }

        public String getLessonsForm() {
            return TaskUtility.pluralForm(lessons);
        }

        public String getTasksForm() {
            return TaskUtility.pluralForm(tasks);
        }
    }

    private static boolean isTaskPage(Category c) {
        return "Задания".equals(c.getName()) || "Tasks".equals(c.getName());
    }

    @SuppressWarnings("unchecked")
    public static void addHomeToModel(Model model, ServletContext servletContext, String coursePath) {
        Map<String, Test> courses = (Map<String, Test>) servletContext.getAttribute(TESTS);
        Test course = courses == null ? null : courses.get(coursePath);
        List<ProgramModule> modules = new ArrayList<>();
        int lessons = 0;
        int videos = 0;
        int tasks = 0;
        int taskMinutes = 0;
        if (course != null && course.getCategories() != null) {
            int number = 0;
            for (Category module : course.getCategories().values()) {
                if (module.getParentCategory() != null || module.getHidden()) {
                    continue;
                }
                List<Category> children = module.getSubCategories() == null
                        ? Collections.emptyList() : module.getSubCategories();
                ProgramModule pm = new ProgramModule(module, number + 1);
                for (Category child : children) {
                    if (child.getHidden()) {
                        continue;
                    }
                    if (isTaskPage(child)) {
                        pm.tasksPage = child;
                        for (Task task : TaskUtility.getTasksByPage(servletContext, child.getId())) {
                            pm.tasks++;
                            if (task.getEstimatedMinutes() != null) {
                                taskMinutes += task.getEstimatedMinutes();
                            }
                        }
                        continue;
                    }
                    if (child.getSubCategories() != null && !child.getSubCategories().isEmpty()) {
                        continue;
                    }
                    if (pm.firstLesson == null) {
                        pm.firstLesson = child;
                    }
                    pm.lessons++;
                    if (child.getVideoPath() != null && !child.getVideoPath().trim().isEmpty()) {
                        videos++;
                    }
                }
                if (pm.lessons > 0) {
                    number++;
                    modules.add(pm);
                    lessons += pm.lessons;
                    tasks += pm.tasks;
                }
            }
        }
        int studyHours = Math.round((lessons * MINUTES_PER_LESSON + taskMinutes) / 60f);
        model.addAttribute(HOME_MODULES_ATTRIBUTE, modules);
        model.addAttribute(HOME_LESSONS_ATTRIBUTE, lessons);
        model.addAttribute(HOME_VIDEOS_ATTRIBUTE, videos);
        model.addAttribute(HOME_TASKS_ATTRIBUTE, tasks);
        model.addAttribute(HOME_STUDY_HOURS_ATTRIBUTE, studyHours);
        // формы слова для подписей home.lessons.* / home.videos.* / home.tasks.* / hub.modules.*
        model.addAttribute("HOME_LESSONS_FORM", TaskUtility.pluralForm(lessons));
        model.addAttribute("HOME_VIDEOS_FORM", TaskUtility.pluralForm(videos));
        model.addAttribute("HOME_TASKS_FORM", TaskUtility.pluralForm(tasks));
        model.addAttribute("HOME_MODULES_FORM", TaskUtility.pluralForm(modules.size()));
        // при занятиях около часа в день, ~30 дней в месяце
        model.addAttribute(HOME_STUDY_MONTHS_ATTRIBUTE, Math.max(1, Math.round(studyHours / 30f)));
        TestHubUtility.addTestHubToModel(model, servletContext, coursePath);
    }
}
