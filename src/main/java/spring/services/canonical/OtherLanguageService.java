package spring.services.canonical;

import model.LanguageCode;
import model.OtherLanguage;

import java.util.List;
import java.util.Map;

public interface OtherLanguageService {
    OtherLanguage createOtherLanguages(OtherLanguage otherLanguage);

    void deleteOtherLanguage(OtherLanguage otherLanguage);

    Map<LanguageCode, Map<String, String>> findAll();

    List<OtherLanguage> findByUrlEndingWith(String suffix);
}
