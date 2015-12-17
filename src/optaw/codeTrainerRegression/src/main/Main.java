package main;

import java.io.*;
import java.util.HashMap;

import weka.core.*;
import weka.core.converters.ConverterUtils.DataSource;
import weka.classifiers.*;
import weka.classifiers.bayes.*;
import weka.classifiers.bayes.net.BIFReader;
import weka.classifiers.bayes.net.BayesNetGenerator;
import weka.classifiers.bayes.net.EditableBayesNet;
import weka.classifiers.functions.*;
import weka.classifiers.lazy.*;
import weka.classifiers.meta.*;
import weka.classifiers.rules.*;
import weka.classifiers.trees.*;

/**
 * This class gets an arff file, does leave-one-out iterations, and trains WEKA models while asking them their opinion for the left out instance.
 * @author costaspappus
 *
 */
public class Main {

	public static HashMap<Integer, String> indexToFileName = new HashMap<Integer, String>();
	public static HashMap<String, String> evalMap = new HashMap<String, String>();
	
	public static String pathToEvals = "/home/costaspappus/Desktop/583FinalFiles/evaluations.txt";
	public static String arffPath = "/home/costaspappus/Desktop/ir_and_source__regressor.arff";
	public static String pathToOutput = "/home/costaspappus/Desktop/rgsIRAndSourceOpins.txt";
	
	/**
	 * The main function takes three arguments:
	 * 1. The arff file
	 * 2. The output location
	 * 3. The evaluations location
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception{
		
		/*if(args.length != 3){
			throw new IllegalArgumentException("'arff path', 'output location', and 'evaluations' expected");
		}
		
		String arffLoc = args[0];
		String outputLoc = args[1];
		String evalLoc = args[2];*/
		
		String arffLoc = arffPath;
		String outputLoc = pathToOutput;
		String evalLoc = pathToEvals;
		
		//in the arff file we have passed the file names as comment from the previous step in the codeAnalyser
		//read these filenames and their index
		buildIndexToFileName(arffLoc);
		//evalMap will hold keys like fileName+opt and values will be the respective execution time
		buildEvalMap(evalLoc);
		
		StringBuilder outbuilder = new StringBuilder();
		
		// Define the classifiers
		Classifier[] classifiers = new Classifier[15];

		//the following are too slow to evaluate
		//classifiers[0] = new RBFNetwork();
		//classifiers[0] = new KStar();
		//classifiers[0] = new ConjunctiveRule();
		//classifiers[0] = new M5P();
		//classifiers[0] = new LeastMedSq();
		//classifiers[0] = new IsotonicRegression();//slow
		//classifiers[0] = new M5Rules();//takes seconds to train
		
		
		//16 regressors
		classifiers[0] = new LinearRegression();
		classifiers[1] = new REPTree();
		classifiers[2] = new PaceRegression();
		classifiers[3] = new IBk(2);
		classifiers[4] = new IBk(3);
		classifiers[5] = new IBk(4);
		classifiers[6] = new IBk(5);
		classifiers[7] = new IBk(6);
		classifiers[8] = new IBk(7);
		classifiers[9] = new IBk(8);
		classifiers[10] = new IBk(9);
		classifiers[11] = new IBk(10);
		classifiers[12] = new SimpleLinearRegression();
		classifiers[13] = new LWL();
		classifiers[14] = new DecisionStump();
		//classifiers[15] = new PLSClassifier();
		
		/*
		 * no VotedPerceptron
		 * no RegressionByDiscretization
		 */
		
		// Print first line
		printIntro(classifiers, outbuilder);
		
		// Read all the instances in the file (ARFF)
		DataSource source = new DataSource(arffLoc);
		Instances instances = source.getDataSet();
		
		// Make the last attribute be the class
		instances.setClassIndex(instances.numAttributes() - 1);
		 
		// For each instance, make it the leave-one-out, and train all the classifiers with the new selection
		for(int i=0; i< instances.numInstances(); ++i){
			Instances train = new Instances(instances);
			Instance test = train.instance(i);
			train.delete(i);
			 
			// print line for all classifiers
			printInnerLine(classifiers, outbuilder, train, test, i+1);
			if(i%5==0){
				System.out.println("Iteration: " + i + ", out of: " + instances.numInstances());
				System.out.flush();
			}
		}
		 
		// Write to the output file
		PrintWriter writer = new PrintWriter(outputLoc, "UTF-8");
		writer.println(outbuilder.toString());
		writer.close();
		 
	}
	
	/**
	 * Prints the first line of the output file
	 * @param classifiers
	 * @param outbuilder
	 */
	public static void printIntro(Classifier[] classifiers, StringBuilder outbuilder){
		outbuilder.append("Inst,Opt");
		for(int i = 0; i< classifiers.length; ++i){
			outbuilder.append(",");
			String className = classifiers[i].getClass().toString();
			String classifierName = className.split("\\.")[className.split("\\.").length-1];
			classifierName = classifierName.replaceAll("[a-z]+", "");
			outbuilder.append(classifierName);
		}
		outbuilder.append(System.lineSeparator());
	}
	
	/**
	 * Prints the inner line of the output file
	 * @param classifiers
	 * @param outbuilder
	 * @throws Exception 
	 */
	public static void printInnerLine(Classifier[] classifiers, StringBuilder outbuilder, Instances train, Instance test, int index) throws Exception {
		//print file name
		outbuilder.append(indexToFileName.get(index).substring(0, indexToFileName.get(index).length()-2)+",");
		//for each classifier
		for(int i = 0; i< classifiers.length; ++i){
			// Train the classifier
			Classifier cl = classifiers[i];
			cl.buildClassifier(train);
			
			/*OutputStream file = new FileOutputStream("/home/costaspappus/Desktop/NB.ser");
		    OutputStream buffer = new BufferedOutputStream(file);
		    ObjectOutput output = new ObjectOutputStream(buffer);
		    output.writeObject(cl);
		    output.close();*/
			
			// Get its opinion
			double result = cl.classifyInstance(test);
			
			//double[] conf = cl.distributionForInstance(test);
			
			//double confOfResult = conf[(int)result];
			
			//print the opt and the prediction time
			outbuilder.append(test.toString().split(",")[test.toString().split(",").length-2]+","+result);
		}
		outbuilder.append(System.lineSeparator());
	}
	
	/**
	 * Reads the arff file and grabs the filenames in order
	 * @param arffLoc
	 * @throws Exception 
	 */
	public static void buildIndexToFileName(String arffLoc) throws Exception{
		int index = 1;
		BufferedReader br = new BufferedReader(new FileReader(arffLoc));
		for(String line; (line = br.readLine()) != null; ) {
			if(line.contains("%")){
				indexToFileName.put(index, line.split("%")[line.split("%").length-1]);
				index++;
			}
		}
	}
	
	/**
	 * Reads the evaluation file and creates the mapping to the execution time
	 * @param evalLoc
	 * @throws Exception 
	 */
	public static void buildEvalMap(String evalLoc) throws Exception{
		BufferedReader br = new BufferedReader(new FileReader(evalLoc));
		for(String line; (line = br.readLine()) != null; ) {
			String fileNameAndOpt = line.split(",")[0]+","+line.split(",")[1];
			String execTime = line.split(",")[2];
			evalMap.put(fileNameAndOpt, execTime);
		}
	}
	
}
