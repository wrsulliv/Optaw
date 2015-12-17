package main;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import common.Constants;
import weka.classifiers.Classifier;
import weka.core.Instance;

public class Optaw {

	public static String testPath = "./test.c";
	
	public static boolean debug = true;
	
	public static void main(String[] args) throws Exception{
		
		if(args.length != 1){
			throw new IllegalArgumentException("'c program' expected");
		}
		
		//TODO activate here for real system
		String programName = args[0];
		
		//load the trained model
		Classifier classifier = null;
	    ObjectInput input;
		//load the classifier.ser file from the resources file
		//File clFile = new File((new Optaw()).getClass().getClassLoader().getResource("classifier.ser").getFile());
		File clFile = new File("./IB4.ser");
		input = new ObjectInputStream (new BufferedInputStream(new FileInputStream(clFile)));
		classifier = (Classifier)input.readObject();
		
		String programNoEnding = programName.substring(2, programName.length()-2);
				
		Instance test = null;
		
		test = ArffCreator.getInstanceFromFile(programName);
		
		//get opt prediction from model
		double prediction = -1;
		boolean useO3 = false;
		prediction = classifier.classifyInstance(test);
		//if the classifier is not very confident, fall back to -o3
		double confidence = classifier.distributionForInstance(test)[(int)prediction];
/*		if(confidence<=0.4){
			useO3 = true;
			System.out.println("DEBUG: Confidence: " + confidence + ", using -O3");
		} else {
			System.out.println("DEBUG: Confidence: " + confidence + ", not using -O3");
		}*/
		
		String passes = Constants.opts[(int) prediction];
		if(useO3){
			passes = Constants.o3;
		}
		
		String cmdPart1 = "clang -emit-llvm -o " + programNoEnding + ".bc -c " + programName;
		String cmdPart2 = "opt " + passes + " " + programNoEnding + ".bc -o " + programNoEnding + ".awesome.bc";
		String cmdPart3 = "llc " + programNoEnding + ".awesome.bc -o " + programNoEnding + ".awesome.s";
		String cmdPart4 = "g++ -o " + programNoEnding + ".awesome " + programNoEnding + ".awesome.s";
		
		if(debug){
			System.out.println("DEBUG: " + cmdPart1);
			System.out.println("DEBUG: " + cmdPart2);
			System.out.println("DEBUG: " + cmdPart3);
			System.out.println("DEBUG: " + cmdPart4);
		}
		
		//run commands
		Process p1 = Runtime.getRuntime().exec(new String[]{"bash","-c",cmdPart1});
		p1.waitFor();
		Process p2 = Runtime.getRuntime().exec(new String[]{"bash","-c",cmdPart2});
		p2.waitFor();
		Process p3 = Runtime.getRuntime().exec(new String[]{"bash","-c",cmdPart3});
		p3.waitFor();
		Process p4 = Runtime.getRuntime().exec(new String[]{"bash","-c",cmdPart4});
		p4.waitFor();
	}
	
}



