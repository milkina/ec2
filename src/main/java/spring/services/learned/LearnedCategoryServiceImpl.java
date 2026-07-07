package spring.services.learned;

import model.Category;
import model.LearnedCategory;
import model.person.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.repositories.CategoryRepository;
import spring.repositories.LearnedCategoryRepository;
import spring.repositories.PersonRepository;

import java.util.List;

@Service
public class LearnedCategoryServiceImpl implements LearnedCategoryService {

    @Autowired
    private LearnedCategoryRepository learnedCategoryRepository;

    @Autowired
    private PersonRepository personRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public List<Integer> getLearnedCategoryIds(int userId, String testPath) {
        return learnedCategoryRepository.findLearnedCategoryIdsByUserIdAndTestPath(userId, testPath);
    }

    @Override
    public boolean isLearned(int userId, int categoryId) {
        return learnedCategoryRepository.findByUserIdAndCategoryId(userId, categoryId) != null;
    }

    @Override
    @Transactional
    public void markAsLearned(int userId, int categoryId) {
        if (learnedCategoryRepository.findByUserIdAndCategoryId(userId, categoryId) != null) {
            return;
        }
        Person person = personRepository.findOne(userId);
        Category category = categoryRepository.findOne(categoryId);
        if (person != null && category != null) {
            learnedCategoryRepository.save(new LearnedCategory(person, category));
        }
    }

    @Override
    @Transactional
    public void unmarkAsLearned(int userId, int categoryId) {
        learnedCategoryRepository.deleteByUserIdAndCategoryId(userId, categoryId);
    }
}
