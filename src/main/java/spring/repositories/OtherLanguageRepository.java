package spring.repositories;

import model.OtherLanguage;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OtherLanguageRepository extends CrudRepository<OtherLanguage, Integer> {
    List<OtherLanguage> findByUrlEndingWith(String suffix);
}
