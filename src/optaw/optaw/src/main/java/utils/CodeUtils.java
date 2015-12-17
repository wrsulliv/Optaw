package utils;

import common.Constants;
import java.io.IOException;
import java.io.StreamTokenizer;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

public class CodeUtils {

    /**
     * Removes the comments out of a String program.
     * Removes the single line and the multiline comments
     * @param code
     * @return
     */
    public static String removeCodeComments(String code) {
    	return code.replaceAll("(?s)/\\*.*?\\*/", "");
    	//return code.replaceAll("/\\*(?:.|[\\n\\r])*?\\*/", "");
    	//code = code.replaceAll("(?://.*)","");
        //return code.replaceAll("(?:/\\*(?:[^*]|(?:\\*+[^*/]))*\\*+/)","");
        //return code.replaceAll("(?:/\\*(?:[^*]|(?:\\*+[^*/]))*\\*+/)|(?://.*)","");
    }

    /**
     * Removes the #include directives
     * @param codeStr
     * @return
     */
    public static String removeCodeInstructions(String codeStr) {
        String[] lines = null;
        if(codeStr.contains(Constants.NEW_LINE)){
        	lines = codeStr.split(Constants.NEW_LINE);
        } else if(codeStr.contains("\n")){
        	lines = codeStr.split("\n");
        }
        StringBuilder builder = new StringBuilder();
        List<String> linesOfCode = new ArrayList<String>();
        for (String lineOfCode : lines) {
            if(!lineOfCode.trim().startsWith("#") && lineOfCode.trim().length() > 0) {
            	builder.append(lineOfCode.trim()).append(Constants.NEW_LINE);
            }
        }
        return builder.toString().substring(0, builder.toString().length()-Constants.NEW_LINE.length());
        //return String.join(Constants.NEW_LINE, linesOfCode);
    }

    /**
     * Removes the string
     * @param codeStr
     * @return
     */
    public static String removeCodeStringLiterals(String codeStr) {
        return codeStr.replaceAll("\\\".*?\\\"", "");
    }

    /**
     * Identifies only the words in a program and returns only those
     * @param codeStr
     * @return
     */
    public static List<String> getCodeTokens(String codeStr) {
        List<String> tokenList = new ArrayList<String>();
        StringReader rd = new StringReader(codeStr);
        StreamTokenizer st = new StreamTokenizer(rd);

        st.parseNumbers();
        st.wordChars('_', '_');
        st.eolIsSignificant(true);
        st.ordinaryChars(0, ' ');
        st.slashSlashComments(true);
        st.slashStarComments(true);

        try {
            int token = st.nextToken();
            while (token != StreamTokenizer.TT_EOF) {
                token = st.nextToken();
                if (token == StreamTokenizer.TT_WORD) {
                    String word = st.sval;
                    tokenList.add(word);
                }
            }
        } catch (IOException ex) {
        } finally {
            rd.close();
        }
        return tokenList;
    }
    
    /**
     * This method removes the ending of the filename
     * @param filename
     * @return
     */
    public static String removeEnding(String filename){
    	return filename.substring(0, filename.length()-2);
    }
}
