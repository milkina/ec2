package spring.services.canonical;

import model.LanguageCode;
import model.OtherLanguage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.repositories.OtherLanguageRepository;

import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
public class OtherLanguageServiceImpl implements OtherLanguageService {
    @Autowired
    private OtherLanguageRepository canonicalUrlRepository;

    @Override
    public OtherLanguage createOtherLanguages(OtherLanguage otherLanguage) {
        return canonicalUrlRepository.save(otherLanguage);
    }

    @Override
    public Map<LanguageCode, Map<String, String>> findAll() {
        Iterable<OtherLanguage> iterable = canonicalUrlRepository.findAll();
        return StreamSupport.stream(iterable.spliterator(), false)
                .collect(Collectors.groupingBy(
                        o -> o.getLanguage().getCode(),
                        Collectors.toMap(
                                OtherLanguage::getOriginal,                                // Ключи для вложенного Map
                                OtherLanguage::getUrl                          // Значения для вложенного Map
                        )
                ));

    }
}
