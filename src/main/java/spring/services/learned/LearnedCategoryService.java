package spring.services.learned;

import java.util.List;

public interface LearnedCategoryService {

    List<Integer> getLearnedCategoryIds(int userId, String testPath);

    boolean isLearned(int userId, int categoryId);

    void markAsLearned(int userId, int categoryId);

    void unmarkAsLearned(int userId, int categoryId);
}
