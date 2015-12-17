package common;

import java.util.Arrays;
import java.util.List;

public interface Constants {

    //String INPUT_FOLDER = "C:\\Users\\Konstantinos Pappas\\workspace\\codeAnalyser\\target\\classes\\sample";
    //String OUTPUT_FILE = System.getProperty("user.home") + "/Desktop/keywordsFreq.csv";

    List<String> KEYWORDS_IN_C = Arrays.asList("auto","double","int","struct","break","else","long","switch","case","enum",
            "register","typedef","char","extern","return","union","const","float","short","unsigned",
            "continue","for","signed","void","default","goto","sizeof","volatile","do","if","static","while");

    String NEW_LINE = System.getProperty("line.separator");
}
