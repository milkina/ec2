package tags.questionEntry;

import model.Answer;
import util.GeneralUtility;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class AnswerPlainTextTag extends TagSupport {

    public int doStartTag() {
        try {
            AnswerTag parent =
                    (AnswerTag) findAncestorWithClass(this, AnswerTag.class);
            Answer answer = parent.getAnswer();
            JspWriter out = pageContext.getOut();
            String text = GeneralUtility.toPlainJsonText(answer.getText());
            if (text != null) {
                out.print(text);
            }
        } catch (IOException ioe) {
            System.out.println("Error in AnswerPlainTextTag: " + ioe);
        }
        return SKIP_BODY;
    }
}
