import common.Constants;
import models.CodeItem;

import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

/**
 * This class handles input and output to the file system
 * @author costaspappus
 *
 */
public class FileUtils {

	/**
	 * Returns a list of File objects given the folder path
	 * @param parentFolder
	 * @return List<File>
	 */
    public static List<File> getFilesInFolder(String parentFolder) {
        List<File> fileList = new ArrayList<File>();
        //ClassLoader classLoader = AnalyzeCode.class.getClassLoader();
        //listf(classLoader.getResource(Constants.INPUT_FOLDER).getPath(), fileList);
        listf(parentFolder, fileList);
        System.out.println("No of files found:" + fileList.size());
        return fileList;
    }
    
    /**
     * Given a file path, this method returns a List of String with the evaluations
     * @param eFile
     * @return
     */
    public static List<String> getEvaluations(String eFile){
    	List<String> evals = new ArrayList<String>();
    	File evaluations = new File(eFile);
    	try{
    		BufferedReader br = new BufferedReader(new FileReader(evaluations));
    	    for(String line; (line = br.readLine()) != null; ) {
    	    	evals.add(line);
    	    }
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	return evals;
    }
    
    /**
     * Saves the arff file
     * @param codeItems
     * @param filenameOptTime
     * @param outputDest
     */
    public static void printArff(List<CodeItem> codeItems, HashMap<String, Double> filenameOptTime, String outputDest){
        StringBuffer result = new StringBuffer();
        
        //print the features
        result.append("@RELATION LLVMOPT");
        result.append(Constants.NEW_LINE);
        for(String k : Constants.KEYWORDS_IN_C){
        	result.append("@ATTRIBUTE " + k + " NUMERIC");
            result.append(Constants.NEW_LINE);
        }
        result.append("@ATTRIBUTE opt NUMERIC");
        result.append(Constants.NEW_LINE);
        result.append("@ATTRIBUTE class NUMERIC");
        result.append(Constants.NEW_LINE);
        result.append("@DATA");
        result.append(Constants.NEW_LINE);

        for (CodeItem item : codeItems) {
        	String fileName = item.getFileName().split("\\.")[0];
        	String features = item.getKeywordsFoundString();
        	
        	for(String filenameOpt : filenameOptTime.keySet()){
        		if(filenameOpt.startsWith(fileName+"$")){
        			String opt = filenameOpt.split(fileName)[1].substring(1);
        			Double execTime = filenameOptTime.get(filenameOpt);
        			result.append(features+","+opt+","+execTime);
                    result.append("%"+item.getFileName());
                    result.append(Constants.NEW_LINE);
        		}
        	}
        }
        try {
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outputDest), "UTF-8"));

            bw.write(result.toString());

            bw.flush();
            bw.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }
    }

    /**
     * Saves the results in csv format to {@link Constants}.OUTPUT_FILE
     *
     * @param codeItems
     */
    public static void printResults(List<CodeItem> codeItems, String outputDest) {

        StringBuffer result = new StringBuffer();
        result.append("sep=,\n"); // this is a direction for excel in order to open a csv properly http://stackoverflow.com/questions/17953679/how-correctly-to-display-csv-files-within-excel-2013
        result.append("Index,filename,");
        result.append(StringUtils.join(Constants.KEYWORDS_IN_C, ','));
        result.append(Constants.NEW_LINE);

        for (CodeItem item : codeItems) {
            result.append(item.getIndex());
            result.append(",");
            result.append(item.getFileName());
            result.append(",");
            result.append(item.getKeywordsFoundString());
            result.append(Constants.NEW_LINE);
        }
        try {
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outputDest), "UTF-8"));

            bw.write(result.toString());

            bw.flush();
            bw.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }
    }

    /**
     * Read all the files in a folder recursively.
     * file param will contain the files found in the directoryName
     *
     * @param directoryName
     * @param files
     */
    private static void listf(String directoryName, List<File> files) {
        File directory = new File(directoryName);

        // get all the files from a directory
        File[] fList = directory.listFiles();
        for (File file : fList) {
            if (file.isFile()) {
                files.add(file);
            } else if (file.isDirectory()) {
                listf(file.getAbsolutePath(), files);
            }
        }
    }

}
