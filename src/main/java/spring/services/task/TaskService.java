package spring.services.task;

import model.task.Task;

import java.util.List;
import java.util.Map;

public interface TaskService {

    /**
     * Все видимые задачи, отсортированные по странице, orderId и id,
     * с заполненным {@link Task#getLessonIds()}.
     */
    List<Task> getVisibleTasks();

    /** Все задачи страницы «Задания», включая скрытые. */
    List<Task> getTasksOfPage(int pageCategoryId);

    Task getTask(int taskId);

    List<Integer> getLessonIds(int taskId);

    /** id страницы → количество задач (включая скрытые). */
    Map<Integer, Long> countTasksByPage();

    boolean isSlugTaken(int pageCategoryId, String slug, Integer exceptTaskId);

    /**
     * Создаёт (data.id == null) или обновляет задачу: копирует редактируемые поля из data,
     * привязывает к странице pageCategoryId и урокам lessonIds.
     */
    Task save(Task data, int pageCategoryId, List<Integer> lessonIds);

    void delete(int taskId);

    // ---------- серии (task_project) ----------

    /** Все серии, по курсу, order_id, id. */
    List<model.task.TaskProject> getProjects();

    model.task.TaskProject getProject(int projectId);

    boolean isProjectCodeTaken(String code, String course, Integer exceptProjectId);

    /** Создаёт (data.id == null) или обновляет серию, копируя редактируемые поля из data. */
    model.task.TaskProject saveProject(model.task.TaskProject data);

    void deleteProject(int projectId);
}
