package spring.services.canonical;

import model.LanguageCode;
import model.OtherLanguage;

import java.util.Map;

public interface OtherLanguageService {
    OtherLanguage createOtherLanguages(OtherLanguage otherLanguage);

    Map<LanguageCode, Map<String, String>> findAll();
}
