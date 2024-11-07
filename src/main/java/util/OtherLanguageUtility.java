package util;

import model.LanguageCode;

import javax.servlet.ServletContext;
import java.util.Map;

import static util.AllConstantsAttribute.ALL_OTHER_LANGUAGES_URLS;

public class OtherLanguageUtility extends SpringUtility {
    public static void loadOtherLanguagesUrls(ServletContext servletContext) {
        Map<LanguageCode, Map<String, String>> map = getCanonicalUrlService(servletContext).findAll();
        servletContext.setAttribute(ALL_OTHER_LANGUAGES_URLS, map);
    }
}
