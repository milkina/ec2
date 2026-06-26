package tags.questionEntry;

import model.AbstractQuestionEntry;
import model.Category;
import model.QuestionType;
import model.person.Person;
import spring.services.category.CategoryService;
import spring.services.question.QuestionService;
import util.GeneralUtility;
import util.SpringUtility;

import javax.servlet.ServletContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.util.ArrayList;
import java.util.List;

import static util.AllConstantsAttribute.PERSON_ATTRIBUTE;
import static util.AllConstantsParam.CATEGORY_PATH;
import static util.AllConstantsParam.TYPE;

/**
 * Created by Tatyana on 05.06.2016.
 */
public class QuestionEntryListTag extends BodyTagSupport {
    private QuestionService questionService;
    private CategoryService categoryService;
    private List<AbstractQuestionEntry> questionEntries;

    public List<AbstractQuestionEntry> getQuestionEntries() {
        return questionEntries;
    }

    private QuestionService getQuestionService(ServletContext servletContext) {
        if (questionService == null) {
            questionService = SpringUtility.getService(servletContext, QuestionService.class);
        }
        return questionService;
    }

    private CategoryService getCategoryService(ServletContext servletContext) {
        if (categoryService == null) {
            categoryService = SpringUtility.getService(servletContext, CategoryService.class);
        }
        return categoryService;
    }

    public int doStartTag() {
        String type = pageContext.getRequest().getParameter(TYPE);
        questionService = getQuestionService(pageContext.getServletContext());

        String[] categoryPaths = pageContext.getRequest().getParameterValues(CATEGORY_PATH);
        if (categoryPaths != null && categoryPaths.length > 1) {
            List<Category> categories = getCategories(categoryPaths);
            Person person = (Person) pageContext.getSession().getAttribute(PERSON_ATTRIBUTE);
            if (QuestionType.QUESTION.toString().equals(type) || type == null) {
                questionEntries = questionService.getQuestions(categories, person, type);
            } else if (QuestionType.TEST.toString().equals(type)) {
                questionEntries = questionService.getAllTestQuestions(categories.get(0));
            }
        } else {
            Category category = getCategory();
            if (QuestionType.QUESTION.toString().equals(type)) {
                questionEntries = questionService.getAllQuestions(category);
            } else if (QuestionType.TEST.toString().equals(type)) {
                questionEntries = questionService.getAllTestQuestions(category);
            } else if (QuestionType.NOT_APPROVED.toString().equals(type)) {
                questionEntries = questionService.getNotApprovedQuestions();
            } else if (QuestionType.MY_QUESTIONS.toString().equals(type)) {
                Person person = (Person) pageContext.getSession().getAttribute(PERSON_ATTRIBUTE);
                questionEntries = questionService.getPersonQuestions(person.getId());
            }
        }
        return EVAL_BODY_INCLUDE;
    }

    private List<Category> getCategories(String[] categoryPaths) {
        CategoryService catService = getCategoryService(pageContext.getServletContext());
        List<Category> categories = new ArrayList<>();
        for (String path : categoryPaths) {
            Category category = catService.getCategory(path);
            if (category != null) {
                categories.add(category);
                if (category.getSubCategories() != null && !category.getSubCategories().isEmpty()) {
                    categories.addAll(category.getSubCategories());
                }
            }
        }
        return categories;
    }

    private Category getCategory() {
        String categoryPathParameter = pageContext.getRequest().getParameter(CATEGORY_PATH);
        if (!GeneralUtility.isEmpty(categoryPathParameter)) {
            return getCategoryService(pageContext.getServletContext()).getCategory(categoryPathParameter);
        } else {
            return null;
        }
    }
}
