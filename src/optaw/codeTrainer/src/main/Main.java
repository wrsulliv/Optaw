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
	//public static String arffPath = "/home/costaspappus/Desktop/583FinalFiles/train.arff";
	//public static String pathToOutput = "/home/costaspappus/Desktop/583FinalFiles/clsOpinionsConf.txt";
	public static String arffPath = "/home/costaspappus/Desktop/583FinalFiles/sourceFeat/train.arff";
	public static String pathToOutput = "/home/costaspappus/Desktop/583FinalFiles/temp.txt";
	
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
		Classifier[] classifiers = new Classifier[1];

		//46 classifiers
		/*classifiers[0] = new Stacking();
		classifiers[1] = new Vote();
		classifiers[2] = new ZeroR();
		classifiers[3] = new REPTree();
		classifiers[4] = new MultiClassClassifier();
		classifiers[5] = new MultilayerPerceptron();
		classifiers[6] = new MultiScheme();
		classifiers[7] = new NaiveBayes();
		classifiers[8] = new NaiveBayesMultinomial();
		classifiers[9] = new NaiveBayesMultinomialUpdateable();
		classifiers[10] = new NaiveBayesUpdateable();
		classifiers[11] = new OneR();
		classifiers[12] = new PART();
		classifiers[13] = new RandomCommittee();
		classifiers[14] = new RandomForest();
		classifiers[15] = new RandomSubSpace();
		classifiers[16] = new RandomTree();
		classifiers[17] = new LWL();
		classifiers[18] = new KStar();
		classifiers[19] = new DecisionTable();
		classifiers[20] = new EditableBayesNet();
		classifiers[21] = new FilteredClassifier();
		classifiers[22] = new DecisionStump();
		classifiers[23] = new CVParameterSelection();
		classifiers[24] = new BIFReader();
		classifiers[25] = new BayesNetGenerator();
		classifiers[26] = new BayesNet();
		classifiers[27] = new AttributeSelectedClassifier();
		classifiers[28] = new AdaBoostM1();
		classifiers[29] = new JRip();
		classifiers[30] = new MultiScheme();
		classifiers[31] = new SMO();
		classifiers[32] = new J48();
		classifiers[33] = new SimpleLogistic();
		classifiers[34] = new IB1();
		classifiers[35] = new IBk(2);
		classifiers[36] = new IBk(3);*/
		classifiers[0] = new IBk(4);
		/*classifiers[38] = new IBk(5);
		classifiers[39] = new IBk(6);
		classifiers[40] = new IBk(7);
		classifiers[41] = new IBk(8);
		classifiers[42] = new IBk(9);
		classifiers[43] = new IBk(10);*/
		
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
			System.out.println("Iteration: " + i + ", out of: " + instances.numInstances());
			System.out.flush();
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
		outbuilder.append("Inst\t");
		for(int i = 0; i< classifiers.length; ++i){
			String className = classifiers[i].getClass().toString();
			String classifierName = className.split("\\.")[className.split("\\.").length-1];
			classifierName = classifierName.replaceAll("[a-z]+", "");
			outbuilder.append(classifierName).append("\t");
		}
		outbuilder.append(System.lineSeparator());
	}
	
	/**
	 * Prints the inner line of the output file
	 * @param classifiers
	 * @param outbuilder
	 * @throws Exception 
	 */
	public static void printInnerLine(Classifier[] classifiers, StringBuilder outbuilder, Instances train, Instance test, int index) throws Exception{
		outbuilder.append(indexToFileName.get(index).substring(0, indexToFileName.get(index).length()-2)+"\t");
		//for each classifier
		for(int i = 0; i< classifiers.length; ++i){
			// Train the classifier
			Classifier cl = classifiers[i];
			cl.buildClassifier(train);
			
			//output the classifier here
			train.delete(5);;
			OutputStream file = new FileOutputStream("/home/costaspappus/Desktop/IB4.ser");
		    OutputStream buffer = new BufferedOutputStream(file);
		    ObjectOutput output = new ObjectOutputStream(buffer);
		    output.writeObject(cl);
		    output.close();
		    System.exit(0);
			// Get its opinion
			
			double trueClass = test.classValue();
			
			double result = cl.classifyInstance(test);

			double[] conf = cl.distributionForInstance(test);
			
			double confOfResult = conf[(int)result];
			
			/*boolean isTheHighest = true;
			
			for(int j = 0; j<conf.length; ++j){
				if(j!=result){
					if(conf[j] >= confOfResult){
						isTheHighest = false;
					}
				}
			}
			
			if(trueClass == result){
				System.out.println("Correct prediction and confidence is highest: " + isTheHighest);
				System.out.println(confOfResult);
			} else {
				System.out.println("Wrong prediction and confidence is highest: " + isTheHighest);
				System.out.println(confOfResult);
			}*/

			// we will also print the execution time of the option that the classifier selected
			String execTime = evalMap.get(indexToFileName.get(index).substring(0, indexToFileName.get(index).length()-2)+","+(int)(result));
			
			//String className = classifiers[i].getClass().toString();
			outbuilder.append(((int)result)+","+execTime+","+confOfResult).append("\t");
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
