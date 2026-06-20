package tags.questionEntry;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class CommaTag extends TagSupport {

    public int doStartTag() {
        try {
            QuestionEntryTag parent = (QuestionEntryTag)
                    findAncestorWithClass(this, QuestionEntryTag.class);
            JspWriter out = pageContext.getOut();
            if (parent.hasNext()) {
                out.print(",");
            }
        } catch (IOException ioe) {
            System.out.println("Error in CommaTag: " + ioe);
        }
        return SKIP_BODY;
    }
}
