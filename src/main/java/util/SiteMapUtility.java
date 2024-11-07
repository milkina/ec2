package util;

import model.Category;
import model.LanguageCode;
import model.Test;
import model.article.Article;
import model.sitemap.UrlEntity;
import model.sitemap.UrlSet;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static tags.menu.MenuUtility.getHrefLangUrl;
import static tags.menu.MenuUtility.hasHrefLangUrl;
import static util.AllConstants.SITE_NAME;

/**
 * Created by Tatyana on 07.02.2017.
 */
public class SiteMapUtility {
    public static final double NORM_PRIORITY = 0.5;
    public static final double HIGH_PRIORITY = 0.8;
    private UrlSet links;
    private Map<String, Category> duplicateCategories;
    private Map<String, Test> testMap;
    private List<Article> articles;

    public SiteMapUtility(Map<String, Category> duplicateCategories,
                          Map<String, Test> testMap, List<Article> articles) {
        this.duplicateCategories = duplicateCategories;
        this.testMap = testMap;
        this.articles = articles;
        links = new UrlSet();
    }

    public Map<String, Category> getDuplicateCategories() {
        return duplicateCategories;
    }

    public void setDuplicateCategories(
            Map<String, Category> duplicateCategories) {
        this.duplicateCategories = duplicateCategories;
    }

    public UrlSet getLinks() {
        return links;
    }

    public void setLinks(UrlSet links) {
        this.links = links;
    }

    public UrlSet buildLinks(HttpServletRequest request) {
        setTestLinks(request);
        setArticleLinks();
        return links;
    }

    private void setArticleLinks() {
        for (Article article : articles) {
            if (article.isIndexStatus()) {
                double priority = NORM_PRIORITY;
                if (article.getUrl().trim().isEmpty()) {
                    priority = 1;
                }
                UrlEntity urlEntity = createUrlEntity(SITE_NAME + LanguageCode.ru.getPath() + article.getUrl(), priority, "monthly");
                links.addUrlEntity(urlEntity);
                if (!article.getUrl().equals("video-java-uroki") && !article.getUrl().equals("practicheskie-zadachi")) {
                    urlEntity = createUrlEntity(SITE_NAME + LanguageCode.en.getPath() + article.getUrl(), priority, "monthly");
                    links.addUrlEntity(urlEntity);
                }
            }
        }
    }

    private void setTestLinks(HttpServletRequest request) {
        for (Test test : testMap.values()) {
            setTestLink(test, request);
        }
    }

    private void setTestLink(Test test, HttpServletRequest request) {
        setTestLink(test, LanguageCode.en.getPath());
        if (!test.getPathName().equals("ocpjp8")) {
            setTestLink(test, LanguageCode.ru.getPath());
        }
        setCategoryLinks(test, request);
    }

    private void setTestLink(Test test, String languageCode) {
        String testPathName = SITE_NAME + languageCode + test.getFullPathName();
        if (!test.getPathName().equals("java-core-russian")) {
            UrlEntity urlEntity =
                    createUrlEntity(testPathName, HIGH_PRIORITY, "weekly");
            links.addUrlEntity(urlEntity);
        }
    }

    private UrlEntity createUrlEntity(String testPathName,
                                      double priority, String freq) {
        UrlEntity urlEntity = new UrlEntity();
        urlEntity.setLoc(testPathName);
        urlEntity.setChangefreq(freq);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date today = Calendar.getInstance().getTime();
        String reportDate = df.format(today);

        urlEntity.setLastmod(reportDate);
        urlEntity.setPriority(priority);
        return urlEntity;
    }

    private void setCategoryLinks(Test test, HttpServletRequest request) {
        for (Category category : test.getCategories().values()) {
            setCategoryLink(test, category, request);
        }
    }

    private void setCategoryLink(Test test, Category category, HttpServletRequest request) {
        if (isCategoryLinkable(test, category)) {
            String localAddress = "java/" + test.getPathName() + "/" + category.getPathName();
            if (test.getLanguage().getCode().equals(LanguageCode.ru)) {
                setCategoryLink(localAddress, LanguageCode.ru.getPath());
                if (!hasHrefLangUrl(request, "/" + localAddress, LanguageCode.en)) {
                    setCategoryLink(localAddress, LanguageCode.en.getPath());
                }
            } else if (test.getLanguage().getCode().equals(LanguageCode.en)) {
                setCategoryLink(localAddress, LanguageCode.en.getPath());
                if (!hasHrefLangUrl(request, "/" + localAddress, LanguageCode.ru)) {
                    setCategoryLink(localAddress, LanguageCode.ru.getPath());
                }
            }
        }
    }

    private void setCategoryLink(String path, String language) {
        UrlEntity urlEntity = createUrlEntity(SITE_NAME + language + path, NORM_PRIORITY, "weekly");
        links.addUrlEntity(urlEntity);
    }

    private boolean isCategoryLinkable(Test test, Category category) {
        if (category.getHidden() || !category.getArticle().isIndexStatus()) {
            return false;
        }
        return !isDuplicateCategory(
                duplicateCategories.get(category.getPathName()), test);
    }

    private boolean isDuplicateCategory(Category category, Test test) {
        if (category == null) {
            return false;
        }
        Test firstTest = category.getTests().get(0);
        return !firstTest.equals(test);
    }
}
