
import models.CodeItem;
import org.apache.commons.io.IOUtils;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class AnalyzeCode {

	/**
	 * Three argument required
	 * 1. the path of the folder with the c files
	 * 2. the evaluations csv (each line has filename, configuration id, execution time)
	 * 3. the output destination to write the arff file
	 * @param args
	 * @throws IOException
	 */
	
	public static String pathToEvals = "/home/costaspappus/Desktop/583FinalFiles/evaluations.txt";
	public static String pathToBenchmarks = "/home/costaspappus/Desktop/583FinalFiles/benchmarks/";
	public static String outputPath = "/home/costaspappus/Desktop/583FinalFiles/trainReg.arff";
	
    public static void main(String[] args) throws IOException {
    	//handle input parameters
    	/*if(args.length != 3){
    		throw new IllegalArgumentException("Incorrect number of arguments. Three are expected: 1. c programs folder, 2. evaluation csv, 3. output destination");
    	}
    	String cFolder = args[0];
    	String eFile = args[1];
    	String outputDest = args[2];*/
    	
    	String cFolder = pathToBenchmarks;
    	String eFile = pathToEvals;
    	String outputDest = outputPath;
    	
        System.out.println("Parsing source code...");
        List<File> fileList = FileUtils.getFilesInFolder(cFolder);
        List<CodeItem> codeItems = new ArrayList<CodeItem>();

        for (int i = 0; i < fileList.size(); i++) {
            File file = fileList.get(i);
            FileInputStream fisTargetFile = new FileInputStream(file);
            
            //read the source code as a String
            String codeStr = IOUtils.toString(fisTargetFile, "UTF-8");

            // remove unnecessary parts from the code
            //remove the comments from the code
            codeStr = CodeUtils.removeCodeComments(codeStr);
            //remove #include directives
            codeStr = CodeUtils.removeCodeInstructions(codeStr);
            //removes all strings in the code
            codeStr = CodeUtils.removeCodeStringLiterals(codeStr);

            CodeItem cItem = new CodeItem(i, file.getName());
            //tokenize the code
            List<String> tokens = CodeUtils.getCodeTokens(codeStr);
            //increase the counter for the reserved word if one is found
            for(String token : tokens) {
                cItem.addKeyword(token);
            }

            codeItems.add(cItem);
            System.out.println(i+1 +". File \"" + cItem.getFileName() + "\" has been processed");
        }

        System.out.println("Discovering optimizations and times...");
        
        // now we need to find all available optimizations and also the best optimization for each benchmark
        
        //<filenameOpt, execTime>
        HashMap<String, Double> filenameOptTime = new HashMap<String, Double>();
        //classes set
        Set<Integer> classes = new HashSet<Integer>();
        List<String> lines = FileUtils.getEvaluations(eFile);
        for(String line : lines){
        	String filename = line.split(",")[0];
        	Integer opt = Integer.parseInt(line.split(",")[1]);
        	Double time = Double.parseDouble(line.split(",")[2]);
        	classes.add(opt);
        	filenameOptTime.put(filename+"$"+opt, time);
        }
        
        // after having analyzed the source code and having found the best optimization for each benchmark
        // we create an arff file that can be passed in the WEKA platform to train ML classifiers
        FileUtils.printArff(codeItems, filenameOptTime, outputDest);
        //FileUtils.printResults(codeItems, outputDest);
        System.out.println("Finished analysing");
        System.out.println("Arff file available in destination folder: " + outputDest);
    }
}
