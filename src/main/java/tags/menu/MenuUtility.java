package tags.menu;

import model.LanguageCode;
import org.springframework.web.util.UrlPathHelper;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

import static util.AllConstantsAttribute.ALL_OTHER_LANGUAGES_URLS;

public class MenuUtility {
    public static String getHrefLangUrl(HttpServletRequest request, String localAddress, LanguageCode languageCode) {
        Map<LanguageCode, Map<String, String>> map = (Map<LanguageCode, Map<String, String>>) request.getServletContext().getAttribute(ALL_OTHER_LANGUAGES_URLS);
        if (map != null) {
            Map<String, String> collection = map.get(languageCode);
            if (collection != null) {
                String url = collection.get(localAddress);
                if (url != null && !url.isEmpty()) {
                    localAddress = url;
                }
            }
        }
        return localAddress;
    }

    public static boolean hasHrefLangUrl(HttpServletRequest request, String localAddress, LanguageCode languageCode) {
        Map<LanguageCode, Map<String, String>> map = (Map<LanguageCode, Map<String, String>>) request.getServletContext().getAttribute(ALL_OTHER_LANGUAGES_URLS);
        if (map != null) {
            Map<String, String> collection = map.get(languageCode);
            if (collection != null) {
                return collection.get(localAddress) != null;
            }
        }
        return false;
    }

    public static String createRuUrl(HttpServletRequest request) {
        String contextPath = request.getServletContext().getContextPath();
        String localAddress = createUrl(request, LanguageCode.ru);

        // If no translation exists, fall back to Russian homepage
        if (localAddress.isEmpty()) {
            return contextPath + "/ru/";
        }
        return contextPath + "/ru" + localAddress;
    }

    public static String createUrl(HttpServletRequest request, LanguageCode languageCode) {
        String originalUri = new UrlPathHelper().getOriginatingRequestUri(request);
        String contextPath = request.getServletContext().getContextPath();

        String localAddress = originalUri.replaceAll(contextPath, "");
        localAddress = localAddress.replaceAll("/ru", "");

        // If no translation exists, return empty string to indicate homepage fallback
        if (!hasHrefLangUrl(request, localAddress, languageCode)) {
            return "";
        }

        String translatedUrl = getHrefLangUrl(request, localAddress, languageCode);
        return translatedUrl;
    }

    public static String createEnUrl(HttpServletRequest request) {
        String contextPath = request.getServletContext().getContextPath();
        String localAddress = createUrl(request, LanguageCode.en);

        // If no translation exists, fall back to English homepage
        if (localAddress.isEmpty()) {
            return contextPath + "/";
        }
        return contextPath + localAddress;
    }
}

