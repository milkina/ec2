package spring.repositories;

import model.task.Task;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskRepository extends CrudRepository<Task, Integer> {

    @Query("SELECT t FROM Task t WHERE t.hidden = false ORDER BY t.pageCategoryId, t.orderId, t.id")
    List<Task> findAllVisible();

    /** Пары [task_id, category_id] из task_lesson для видимых задач — без загрузки сущностей Category. */
    @Query("SELECT t.id, l.id FROM Task t JOIN t.lessons l WHERE t.hidden = false")
    List<Object[]> findVisibleLessonLinks();

    /** Все задачи страницы, включая скрытые (для админки). */
    @Query("SELECT t FROM Task t WHERE t.pageCategoryId = :pageId ORDER BY t.orderId, t.id")
    List<Task> findByPage(@Param("pageId") Integer pageCategoryId);

    @Query("SELECT t FROM Task t WHERE t.pageCategoryId = :pageId AND t.slug = :slug")
    List<Task> findByPageAndSlug(@Param("pageId") Integer pageCategoryId, @Param("slug") String slug);

    /** Пары [page_category_id, количество задач], включая скрытые. */
    @Query("SELECT t.pageCategoryId, COUNT(t) FROM Task t GROUP BY t.pageCategoryId")
    List<Object[]> countByPage();

    @Query("SELECT l.id FROM Task t JOIN t.lessons l WHERE t.id = :taskId")
    List<Integer> findLessonIds(@Param("taskId") Integer taskId);
}
