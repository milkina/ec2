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

        return contextPath + "/ru" + localAddress;
    }

    public static String createUrl(HttpServletRequest request, LanguageCode languageCode) {
        String localAddress = new UrlPathHelper().getOriginatingRequestUri(request);
        String contextPath = request.getServletContext().getContextPath();

        localAddress = localAddress.replaceAll(contextPath, "");
        localAddress = localAddress.replaceAll("/ru", "");
        return getHrefLangUrl(request, localAddress, languageCode);
    }

    public static String createEnUrl(HttpServletRequest request) {
        String localAddress = createUrl(request, LanguageCode.en);
        String contextPath = request.getServletContext().getContextPath();

        return contextPath + localAddress;
    }
}

