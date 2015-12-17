package models;

import common.Constants;

import java.util.LinkedHashMap;
import java.util.Map;

public class CodeItem {

    private Integer index;
    private String fileName;
    private Map<String, Integer> keywordsFound;

    public CodeItem(Integer index, String fileName) {
        this.index = index;
        this.fileName = fileName;
        keywordsFound = new LinkedHashMap<String, Integer>();
        for (String keyword : Constants.KEYWORDS_IN_C) {
            keywordsFound.put(keyword, 0);
        }
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public void addKeyword(String keyword) {
        if (this.keywordsFound.containsKey(keyword)) {
            this.keywordsFound.put(keyword, this.keywordsFound.get(keyword) + 1);
        }
    }

    public String getKeywordsFoundString() {
        StringBuffer result = new StringBuffer();
        for (Map.Entry<String, Integer> entry : this.keywordsFound.entrySet()) {
            /*result.append(entry.getKey());
            result.append(" ");*/
            result.append(entry.getValue());
            result.append(",");
        }
        result.deleteCharAt(result.lastIndexOf(","));
        return result.toString();
    }
}
