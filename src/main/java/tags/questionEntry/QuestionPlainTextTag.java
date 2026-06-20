package tags.questionEntry;

import model.AbstractQuestionEntry;
import util.GeneralUtility;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class QuestionPlainTextTag extends TagSupport {

    public int doStartTag() {
        try {
            QuestionEntryTag parent = (QuestionEntryTag)
                    findAncestorWithClass(this, QuestionEntryTag.class);
            AbstractQuestionEntry questionEntry = parent.getQuestionEntry();
            JspWriter out = pageContext.getOut();
            String text = GeneralUtility.toPlainJsonText(questionEntry.getQuestion().getText());
            if (text != null) {
                out.print(text);
            }
        } catch (IOException ioe) {
            System.out.println("Error in QuestionPlainTextTag: " + ioe);
        }
        return SKIP_BODY;
    }
}
