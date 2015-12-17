package main;

import utils.CodeUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import models.CodeItem;

import org.apache.commons.io.IOUtils;

import common.Constants;
import weka.core.*;

public class ArffCreator {

	/**
	 * Given a c program file path, compute the respective arff file.
	 * @param filePath
	 * @return
	 * @throws IOException 
	 */
	public static Instance getInstanceFromFile(String filePath) throws IOException{
		//break the program into pieces
        File file = new File(filePath);
        FileInputStream fisTargetFile = new FileInputStream(file);
        String codeStr = IOUtils.toString(fisTargetFile, "UTF-8");

        // remove unnecessary parts from the code
        codeStr = CodeUtils.removeCodeComments(codeStr);
        codeStr = CodeUtils.removeCodeInstructions(codeStr);
        codeStr = CodeUtils.removeCodeStringLiterals(codeStr);

        CodeItem cItem = new CodeItem(0, file.getName());
        List<String> tokens = CodeUtils.getCodeTokens(codeStr);
        for(String token : tokens) {
            cItem.addKeyword(token);
        }

        //now create the instance
        double attValues[] = new double[Constants.KEYWORDS_IN_C.size()+1];
        int index = 0;
        for(String keywordValue : cItem.getKeywordsFoundString().split(",")){
        	 attValues[index] = Double.parseDouble(keywordValue);
        	 index++;
        }
        //attValues[index] = 0.0;
        
        //create the instances set
        FastVector atts = new FastVector();
        for(String keyword : Constants.KEYWORDS_IN_C){
        	atts.addElement(new Attribute(keyword));
        }
        //add the class
        FastVector classAttVals = new FastVector(27);
        classAttVals.addElement("0");
        classAttVals.addElement("1");
        classAttVals.addElement("2");
        classAttVals.addElement("3");
        classAttVals.addElement("4");
        classAttVals.addElement("5");
        classAttVals.addElement("6");
        classAttVals.addElement("7");
        classAttVals.addElement("8");
        classAttVals.addElement("9");
        classAttVals.addElement("10");
        classAttVals.addElement("11");
        classAttVals.addElement("12");
        classAttVals.addElement("13");
        classAttVals.addElement("14");
        classAttVals.addElement("15");
        classAttVals.addElement("16");
        classAttVals.addElement("17");
        classAttVals.addElement("18");
        classAttVals.addElement("19");
        classAttVals.addElement("20");
        classAttVals.addElement("21");
        classAttVals.addElement("22");
        classAttVals.addElement("23");
        classAttVals.addElement("24");
        classAttVals.addElement("25");
        classAttVals.addElement("26");

        // Create nominal attribute "position"
        //Attribute classAttribute = new Attribute("class", classAttVals);
        atts.addElement(new Attribute("class", classAttVals));

        Instance inst = new Instance(1.0, attValues);
        
        
        Instances test = new Instances("c programs", atts, 1);
        test.add(inst);
        inst.setDataset(test);
        test.setClassIndex(test.numAttributes()-1);
        //inst.setClassValue("?");
        
		return inst;
	}
	
}
