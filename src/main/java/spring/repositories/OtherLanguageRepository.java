package spring.repositories;

import model.OtherLanguage;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OtherLanguageRepository extends CrudRepository<OtherLanguage, Integer> {
}
