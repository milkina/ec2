package tags.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;
import java.io.IOException;

public class MenuVideoTag extends MenuTag {
    public int doStartTag() {
        try {
            String localeHref = getLocalHref((HttpServletRequest) pageContext.getRequest(), "menu.video");
            String href = getHref("video-java-uroki", localeHref);
            JspWriter out = pageContext.getOut();
            out.print(href);
        } catch (IOException exception) {
            System.out.println("Error in MenuVideoTag: " + exception);
        }
        return SKIP_BODY;
    }
}
