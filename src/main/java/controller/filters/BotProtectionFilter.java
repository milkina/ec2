package controller.filters;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import org.springframework.stereotype.Service;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;
import java.util.regex.Pattern;

@Service
public class BotProtectionFilter implements Filter {
    private static final Logger logger = Logger.getLogger(BotProtectionFilter.class.getName());
    
    // Rate limiting: max requests per minute per IP
    private static final int MAX_REQUESTS_PER_MINUTE = 100;
    private static final int MAX_REQUESTS_PER_HOUR = 1000;
    
    // Suspicious user agent patterns
    private static final List<String> BLOCKED_USER_AGENTS = Arrays.asList(
        "bot", "crawl", "spider", "scraper", "curl", "wget", "python", "perl", "java",
        "httpclient", "httpurlconnection", "apache-httpclient", "okhttp", "axios",
        "libwww-perl", "lwp-simple", "winhttp", "webzip", "fetch", "webcopier",
        "webstripper", "webmirror", "webcollage", "surfbot", "emailcollector",
        "emailsiphon", "emailwolf", "extractorpro", "sitesnagger", "webbandit",
        "webgoat", "webLeacher", "webreaper", "webbug", "webspider", "webvac",
        "webwasher", "webzip", "wget", "widow", "www-mechanize", "xaldon",
        "zermelo", "zeus", "a6-indexer", "acoon", "ad muncher", "adbeat",
        "adstxt", "ahrefsbot", "alexa", "amazonbot", "anthill", "apexoo",
        "applebot", "archive.org_bot", "askjeeves", "baiduspider", "barkrowler",
        "blexbot", "blekkobot", "buzzbot", "ccbot", "cherrypicker", "chilkat",
        "clamant", "cliqzbot", "coccoc", "comodo", "crawl", "crawler", "crescent",
        "curl", "daumoa", "dbpedia", "digg", "dotbot", "duckduckbot", "embedly",
        "exabot", "facebookexternalhit", "fast", "findlinks", "flamingo_searchengine",
        "fluffy", "gigabot", "gomezagent", "googlebot", "grapeshotcrawler",
        "grub", "hatena", "headlesschrome", "heritrix", "holmes", "httrack",
        "ia_archiver", "ichiro", "idmbot", "ilse", "inktomi", "integromedb",
        "jyxobot", "larbin", "leikibot", "lexibot", "lipperhey", "linkdexbot",
        "linkpadbot", "linkscan", "linkwalker", "ltx71", "magpie-crawler",
        "mediapartners-google", "megaindex", "microsoftpreview", "mj12bot",
        "moget", "msnbot", "msrbot", "naverbot", "neomo", "netcraftsurveyagent",
        "netvibes", "newrelicpinger", "nextgensearchbot", "nibbler", "nimblecrawler",
        "nutch", "nutchcvs", "ocelli", "omgilibot", "omniexplorer_bot",
        "openindexspider", "openlinkprofiler", "orangebot", "pagepeeker",
        "pagereader", "peew", "petalbot", "picmole", "pingdom", "pinterest",
        "prerender", "proximic", "psbot", "pump", "python", "queryseeker",
        "r6_feedreader", "r6_feedReader", "rankflex", "readability", "retriever",
        "rixbot", "rogerbot", "screaming", "scoutjet", "searchmetricsbot",
        "seokicks-robot", "seznambot", "shrinktheweb", "sistrix", "smtbot",
        "sogou", "spider", "sputnikbot", "sqworm", "steeler", "surveybot",
        "synthesio", "teoma", "theoldreader", "tineye", "turnitinbot",
        "tweetmemebot", "twiceler", "typhoeus", "unwindfetchor", "updownerbot",
        "urlresolver", "vagabondo", "validator", "vortex", "voyager", "w3c_validator",
        "w3c-checklink", "w3c-css-validator", "w3c-mobileok", "w3c-i18n-checker",
        "wbsearchbot", "webalta", "webauto", "webcollage", "webcopier", "webfetch",
        "webglimpse", "webis", "weblazer", "webmasterworld", "webmon", "weborama",
        "webpix", "webreaper", "webscreener", "webshag", "websquash", "webster",
        "webstripper", "webvac", "webwalk", "webwatch", "webwombat", "wget",
        "whatsapp", "wired-digital", "wmlbrowser", "wocbot", "woobot", "worio",
        "www-mechanize", "xenu", "xerka", "yacy", "yahoo", "yandexbot",
        "yandeximages", "yandexmetrika", "yandexnews", "yandexrss", "yandexvideo",
        "yioopbot", "yodao", "yooglifetchagent", "youdao", "zao", "zealbot",
        "zeus", "zillabot", "zmeu", "zoomspider", "zspider"
    );
    
    // Patterns for suspicious requests
    private static final Pattern MALFORMED_URL_PATTERN = Pattern.compile("https?://[^/]+/");
    private static final Pattern TRAILING_SLASH_PATTERN = Pattern.compile(".*/$");
    
    // Rate limiting caches
    private LoadingCache<String, Integer> minuteRequestCounts;
    private LoadingCache<String, Integer> hourRequestCounts;
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialize rate limiting caches with expiration
        minuteRequestCounts = CacheBuilder.newBuilder()
            .expireAfterWrite(1, TimeUnit.MINUTES)
            .build(new CacheLoader<String, Integer>() {
                @Override
                public Integer load(String key) {
                    return 0;
                }
            });
        
        hourRequestCounts = CacheBuilder.newBuilder()
            .expireAfterWrite(1, TimeUnit.HOURS)
            .build(new CacheLoader<String, Integer>() {
                @Override
                public Integer load(String key) {
                    return 0;
                }
            });
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String clientIp = getClientIp(httpRequest);
        String userAgent = httpRequest.getHeader("User-Agent");
        String requestUri = httpRequest.getRequestURI();
        
        // Skip filtering for static resources
        if (isStaticResource(requestUri)) {
            chain.doFilter(request, response);
            return;
        }
        
        // Check user agent blocking
        if (shouldBlockUserAgent(userAgent)) {
            logger.warning("Blocked request from IP: " + clientIp + " with suspicious User-Agent: " + userAgent);
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied");
            return;
        }
        
        // Check for malformed URLs
        if (isMalformedUrl(requestUri)) {
            logger.warning("Blocked malformed URL from IP: " + clientIp + " URI: " + requestUri);
            httpResponse.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request");
            return;
        }
        
        // Rate limiting check
        if (isRateLimited(clientIp)) {
            logger.warning("Rate limit exceeded for IP: " + clientIp);
            httpResponse.sendError(429, "Too many requests");
            return;
        }
        
        // Increment request counters
        incrementRequestCount(clientIp);
        
        chain.doFilter(request, response);
    }
    
    @Override
    public void destroy() {
        if (minuteRequestCounts != null) {
            minuteRequestCounts.invalidateAll();
        }
        if (hourRequestCounts != null) {
            hourRequestCounts.invalidateAll();
        }
    }
    
    private String getClientIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        // Handle multiple IPs in X-Forwarded-For (take the first one)
        if (ip != null && ip.contains(",")) {
            ip = ip.split(",")[0].trim();
        }
        return ip;
    }
    
    private boolean shouldBlockUserAgent(String userAgent) {
        if (userAgent == null || userAgent.isEmpty()) {
            return true; // Block requests without user agent
        }
        
        String userAgentLower = userAgent.toLowerCase();
        
        // Check against blocked patterns
        for (String blocked : BLOCKED_USER_AGENTS) {
            if (userAgentLower.contains(blocked.toLowerCase())) {
                // Allow legitimate bots (Googlebot, Bingbot, etc.) - you can customize this
                if (isLegitimateBot(userAgentLower)) {
                    return false;
                }
                return true;
            }
        }
        
        return false;
    }
    
    private boolean isLegitimateBot(String userAgent) {
        // Allow major search engine crawlers
        return userAgent.contains("googlebot") || 
               userAgent.contains("bingbot") ||
               userAgent.contains("slurp") || // Yahoo
               userAgent.contains("duckduckbot") ||
               userAgent.contains("baiduspider");
    }
    
    private boolean isMalformedUrl(String requestUri) {
        // Check for external URLs in request path
        if (MALFORMED_URL_PATTERN.matcher(requestUri).find()) {
            return true;
        }
        
        // Check for suspicious trailing slashes on non-resource paths
        if (TRAILING_SLASH_PATTERN.matcher(requestUri).matches() && !requestUri.equals("/")) {
            // Allow trailing slashes for certain paths if needed
            return false;
        }
        
        return false;
    }
    
    private boolean isStaticResource(String requestUri) {
        return requestUri.endsWith(".css") || 
               requestUri.endsWith(".js") || 
               requestUri.endsWith(".png") || 
               requestUri.endsWith(".jpg") || 
               requestUri.endsWith(".jpeg") || 
               requestUri.endsWith(".gif") || 
               requestUri.endsWith(".ico") || 
               requestUri.endsWith(".svg") || 
               requestUri.endsWith(".woff") || 
               requestUri.endsWith(".woff2") ||
               requestUri.endsWith(".ttf") ||
               requestUri.endsWith(".eot");
    }
    
    private boolean isRateLimited(String clientIp) {
        try {
            int minuteCount = minuteRequestCounts.get(clientIp);
            int hourCount = hourRequestCounts.get(clientIp);
            
            return minuteCount >= MAX_REQUESTS_PER_MINUTE || hourCount >= MAX_REQUESTS_PER_HOUR;
        } catch (Exception e) {
            logger.warning("Error checking rate limit: " + e.getMessage());
            return false;
        }
    }
    
    private void incrementRequestCount(String clientIp) {
        try {
            minuteRequestCounts.put(clientIp, minuteRequestCounts.get(clientIp) + 1);
            hourRequestCounts.put(clientIp, hourRequestCounts.get(clientIp) + 1);
        } catch (Exception e) {
            logger.warning("Error incrementing request count: " + e.getMessage());
        }
    }
}
