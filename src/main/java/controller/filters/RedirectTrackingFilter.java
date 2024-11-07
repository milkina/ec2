package controller.filters;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.LocaleResolver;
import tags.menu.MenuUtility;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;

public class RedirectTrackingFilter implements Filter {
    private LocaleResolver localeResolver;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        WebApplicationContext context = WebApplicationContextUtils
                .getWebApplicationContext(filterConfig.getServletContext());
        this.localeResolver = context.getBean("localeResolver", LocaleResolver.class);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (response instanceof HttpServletResponse && request instanceof HttpServletRequest) {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpSession session = httpRequest.getSession();
            String language = httpRequest.getRequestURI().contains("/ru/") ? "ru" : "en";
            session.setAttribute("pageLanguage", language);

            Locale newLocale = new Locale(language);
            localeResolver.setLocale(httpRequest, (HttpServletResponse) response, newLocale);

            httpRequest.setAttribute("ruUrl", MenuUtility.createRuUrl(httpRequest));
            httpRequest.setAttribute("enUrl", MenuUtility.createEnUrl(httpRequest));
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup code, if needed
    }
}
