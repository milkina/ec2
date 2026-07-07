package spring.repositories;

import model.LearnedCategory;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LearnedCategoryRepository extends CrudRepository<LearnedCategory, Integer> {

    @Query("SELECT lc.category.id FROM LearnedCategory lc WHERE lc.user.id = :userId")
    List<Integer> findLearnedCategoryIdsByUserId(@Param("userId") int userId);

    @Query("SELECT lc.category.id FROM LearnedCategory lc " +
            "JOIN lc.category c JOIN c.tests t " +
            "WHERE lc.user.id = :userId AND t.pathName = :testPath")
    List<Integer> findLearnedCategoryIdsByUserIdAndTestPath(
            @Param("userId") int userId, @Param("testPath") String testPath);

    LearnedCategory findByUserIdAndCategoryId(int userId, int categoryId);

    @Modifying
    @Query("DELETE FROM LearnedCategory lc WHERE lc.user.id = :userId AND lc.category.id = :categoryId")
    void deleteByUserIdAndCategoryId(@Param("userId") int userId, @Param("categoryId") int categoryId);
}
