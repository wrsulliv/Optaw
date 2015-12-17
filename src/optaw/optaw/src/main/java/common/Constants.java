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
    
    String codeModificationFlags = " -argpromotion -constprop -constmerge -globalopt -ipsccp -correlated-propagation -ipconstprop -lower-expect -loweratomic -lowerinvoke -lowerswitch -mem2reg -prune-eh -mergereturn -reassociate -reg2mem -scalarrepl -sccp -scalarrepl-ssa -simplify-libcalls -tailcallelim ";

    String codeMotionFlags = " -block-placement -always-inline -inline -jump-threading -partial-inliner -sink ";

    String codeEliminationFlags = " -adce -dce -deadargelim -die -dse -early-cse -globaldce -gvn -instcombine -instsimplify -memcpyopt -mergefunc -simplifycfg ";
    
    String loopOptimizationFlags = " -indvars -lcssa -licm -loop-idiom -loop-deletion -loop-instsimplify -loop-reduce -loop-rotate -loop-simplify -loop-unswitch ";

    String[] opts = {
    "-O1",//0
    "-O2",//1
    "-O3",//2
    codeModificationFlags + codeMotionFlags + codeEliminationFlags + loopOptimizationFlags,//3
    codeModificationFlags + codeMotionFlags + loopOptimizationFlags + codeEliminationFlags,//4
    codeModificationFlags + codeEliminationFlags + codeMotionFlags + loopOptimizationFlags,//5
    codeModificationFlags + loopOptimizationFlags + codeMotionFlags + codeEliminationFlags,//6
    codeModificationFlags + codeEliminationFlags + loopOptimizationFlags + codeMotionFlags,//7
    codeModificationFlags + loopOptimizationFlags + codeEliminationFlags + codeMotionFlags,//8
    codeMotionFlags + codeModificationFlags + codeEliminationFlags + loopOptimizationFlags,//9
    codeMotionFlags + codeModificationFlags + loopOptimizationFlags + codeEliminationFlags,//10
    codeEliminationFlags + codeModificationFlags + codeMotionFlags + loopOptimizationFlags,//11
    loopOptimizationFlags + codeModificationFlags + codeMotionFlags + codeEliminationFlags,//12
    codeEliminationFlags + codeModificationFlags + loopOptimizationFlags + codeMotionFlags,//13
    loopOptimizationFlags + codeModificationFlags + codeEliminationFlags + codeMotionFlags,//14
    codeMotionFlags + codeEliminationFlags + codeModificationFlags + loopOptimizationFlags,//15
    codeMotionFlags + loopOptimizationFlags + codeModificationFlags + codeEliminationFlags,//16
    codeEliminationFlags + codeMotionFlags + codeModificationFlags + loopOptimizationFlags,//17
    loopOptimizationFlags + codeMotionFlags + codeModificationFlags + codeEliminationFlags,//18
    codeEliminationFlags + loopOptimizationFlags + codeModificationFlags + codeMotionFlags,//19
    loopOptimizationFlags + codeEliminationFlags + codeModificationFlags + codeMotionFlags,//20
    codeMotionFlags + codeEliminationFlags + loopOptimizationFlags + codeModificationFlags,//21
    codeMotionFlags + loopOptimizationFlags + codeEliminationFlags + codeModificationFlags,//22
    codeEliminationFlags + codeMotionFlags + loopOptimizationFlags + codeModificationFlags,//23
    loopOptimizationFlags + codeMotionFlags + codeEliminationFlags + codeModificationFlags,//24
    codeEliminationFlags + loopOptimizationFlags + codeMotionFlags + codeModificationFlags,//25
    loopOptimizationFlags + codeEliminationFlags + codeMotionFlags + codeModificationFlags};//26
    
    String o3 = " -O3 ";

}
