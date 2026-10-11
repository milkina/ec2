package spring.repositories;

import model.task.TaskProject;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskProjectRepository extends CrudRepository<TaskProject, Integer> {

    @Query("SELECT p FROM TaskProject p ORDER BY p.course, p.orderId, p.id")
    List<TaskProject> findAllOrdered();

    @Query("SELECT p FROM TaskProject p WHERE p.code = :code AND p.course = :course")
    List<TaskProject> findByCodeAndCourse(@Param("code") String code, @Param("course") String course);
}
