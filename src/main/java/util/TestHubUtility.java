package util;

import model.Category;
import model.Test;
import org.springframework.ui.Model;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static util.AllConstantsAttribute.TESTS;

/**
 * Данные для объединённой страницы «тесты + вопросы для собеседования» (/tests, /ru/tests):
 * сколько тестовых вопросов (tcount) и вопросов с ответами (qcount) в курсе и какие модули/уроки они покрывают.
 */
public class TestHubUtility {

    public static final String HUB_COURSE_PATH_ATTRIBUTE = "HUB_COURSE_PATH";
    public static final String TEST_QUESTIONS_TOTAL_ATTRIBUTE = "TEST_QUESTIONS_TOTAL";
    public static final String QUIZ_QUESTIONS_TOTAL_ATTRIBUTE = "QUIZ_QUESTIONS_TOTAL";
    public static final String COVER_MODULES_ATTRIBUTE = "COVER_MODULES";
    public static final String COVER_MODULES_FORM_ATTRIBUTE = "COVER_MODULES_FORM";
    public static final String TEST_QUESTIONS_FORM_ATTRIBUTE = "TEST_QUESTIONS_FORM";
    public static final String QUIZ_QUESTIONS_FORM_ATTRIBUTE = "QUIZ_QUESTIONS_FORM";

    /** Модуль курса и его уроки, по которым есть тестовые вопросы или вопросы для собеседования. */
    public static class CoverModule {
        private final Category module;
        private final int number;
        private final List<Category> lessons = new ArrayList<>();
        private int testQuestions;
        private int quizQuestions;

        CoverModule(Category module, int number) {
            this.module = module;
            this.number = number;
        }

        public Category getModule() {
            return module;
        }

        /** Номер модуля в курсе (как в форме выбора тем). */
        public int getNumber() {
            return number;
        }

        public List<Category> getLessons() {
            return lessons;
        }

        public int getTestQuestions() {
            return testQuestions;
        }

        public int getQuizQuestions() {
            return quizQuestions;
        }
    }

    @SuppressWarnings("unchecked")
    public static void addTestHubToModel(Model model, ServletContext servletContext, String coursePath) {
        Map<String, Test> courses = (Map<String, Test>) servletContext.getAttribute(TESTS);
        Test course = courses == null ? null : courses.get(coursePath);
        List<CoverModule> modules = new ArrayList<>();
        int tests = 0;
        int quiz = 0;
        if (course != null && course.getCategories() != null) {
            int number = 0;
            for (Category module : course.getCategories().values()) {
                if (module.getParentCategory() != null || module.getHidden()) {
                    continue;
                }
                number++;
                List<Category> children = module.getSubCategories() == null
                        ? Collections.emptyList() : module.getSubCategories();
                CoverModule cover = new CoverModule(module, number);
                for (Category lesson : children) {
                    if (lesson.getHidden() || (lesson.getQuestionsCount() < 1 && lesson.getTestsCount() < 1)) {
                        continue;
                    }
                    cover.lessons.add(lesson);
                    cover.testQuestions += lesson.getTestsCount();
                    cover.quizQuestions += lesson.getQuestionsCount();
                }
                if (!cover.lessons.isEmpty()) {
                    modules.add(cover);
                    tests += cover.testQuestions;
                    quiz += cover.quizQuestions;
                }
            }
        }
        model.addAttribute(HUB_COURSE_PATH_ATTRIBUTE, coursePath);
        model.addAttribute(TEST_QUESTIONS_TOTAL_ATTRIBUTE, tests);
        model.addAttribute(QUIZ_QUESTIONS_TOTAL_ATTRIBUTE, quiz);
        model.addAttribute(COVER_MODULES_ATTRIBUTE, modules);
        model.addAttribute(COVER_MODULES_FORM_ATTRIBUTE, TaskUtility.pluralForm(modules.size()));
        model.addAttribute(TEST_QUESTIONS_FORM_ATTRIBUTE, TaskUtility.pluralForm(tests));
        model.addAttribute(QUIZ_QUESTIONS_FORM_ATTRIBUTE, TaskUtility.pluralForm(quiz));
    }
}
