from operator import itemgetter

def main():
    #Load ground truth
    trainTimes = loadTrainRuntimes()

    #Load -O1, -O2, and -O3 runtimes
    o1 = findOn(trainTimes, 1)
    o2 = findOn(trainTimes, 2)
    o3 = findOn(trainTimes, 3)

    #Only use ONE of the functions on lines 14 & 15 at a time.
    #The dictionary keys will collide and overwrite some output
    #testTimes = loadTestRuntimes(o3) #Test classifiers
    testTimes = loadRegressTimes(trainTimes, o3) #Test regressors

    classifiers = testTimes.keys()
    for classifier in classifiers:
        evaluateClassifier(classifier, testTimes[classifier], o3)

def evaluateClassifier(classifier, results, o3, variance):
    """
    Evaluates one classifier against o3 performance.
    Writes the result to './<classifier_name>Result.csv'

    Also prints how often a classifier is better than O3 in a binary
    sense (yes or no).
    """
    F = open(classifier + 'Result.csv', 'w')
    F.write('File,Gain,O3 Runtime,Confidence\n')
    gain = 0
    count = 0
    positive = 0
    for fname in results:
        if 1:#fname != 'objinst' and fname != 'lowercase':
            if o3[fname][1] != None:
                percGain = (((o3[fname][1] - float(results[fname][1])) /\
                        o3[fname][1]) * 100)
                try:
                    F.write(fname + ',%d,%f,%f\n' % (percGain,
                        variance[fname][results[fname][0]],
                        variance[fname][2], o3[fname][1],
                        results[fname][2]))
                except:
                    F.write(fname + ',%d,%f\n' % (percGain,
                        variance[fname][results[fname][0]],
                        variance[fname][2], o3[fname][1],))
                    
                gain += percGain
                positive += (percGain > 0)
                count += 1
    if count != 0:
        print classifier, gain / float(count), '|',
        print positive / float(count), 'better than O3'
    F.close()

def findOn(trainTimes, n):
    """
    Plucks out the runtimes for programs in the ground truth for -On
    Mostly useful when n == 3

    Returns a dictionary on[benchmark] = [n - 1, runtime]
    """
    on = {}
    count = 0
    for fname in trainTimes:
        try:
            on[fname] = [n - 1, trainTimes[fname][n-1]]
        except:
            count += 1
            on[fname] = [None, None]
    print count, '-O' + str(n) + ' optimizations do not compile'
    return on

def loadRegressTimes(trainTimes, o3):
    """
    Loads the predictions of the regressors - file from Konstantinos
    This function also determines the lowest-predicted-runtime pass
    for a (benchmark, classifier) pair

    Format is: benchmark,pass#,regressor1_prediction,regressor2_pred,etc.

    Returns a nested dictionary:
        regressTimes[regressor][benchmark] = [best_pass#, best_time]
        best_pass# and best_time are the predicted values.
    """
    F = open('../rgsOpins.txt', 'r')
    header = F.readline()
    data = F.readlines()
    F.close()
    modelChoices = {}
    regressTimes = {}
    count = 0
    classifiers = header.strip().split(',')[2:]
    for classifier in classifiers:
        modelChoices[classifier] = {}
        regressTimes[classifier] = {}
    for line in data:
        if len(line.strip()) == 0:
            break
        line = line.strip().split(',')
        fname = line[0]
        opt = line[1]
        classifierResults = line[2:]
        for i in range(len(classifierResults)):
            result = classifierResults[i].strip()
            if fname not in modelChoices[classifier]:
                modelChoices[classifiers[i]][fname] = {}
            if opt not in modelChoices[classifiers[i]][fname]:
                modelChoices[classifiers[i]][fname][opt] = float(result)
    for classifier in classifiers:
        regressTimes[classifier] = {}
        for fname in modelChoices[classifier]:
            bestOpt = sorted(modelChoices[classifier][fname].iteritems(),
                             key=itemgetter(1))[0][0]
            bestOpt = int(bestOpt)
            try:
                regressTimes[classifier][fname] = [bestOpt,
                                               trainTimes[fname][bestOpt]]
            except:
                try:
                    regressTimes[classifier][fname] = [2, trainTimes[fname][2]]
                except:
                    regressTimes[classifier][fname] = [None, None]
    return regressTimes

def loadTestRuntimes(o3):
    """
    Loads the predictions of the classifiers - file from Konstantinos

    Format is: filename\tclassifier1_result\tclassifier2_result\tetc.
    classifier1_result = predicted_pass,runtime,confidence

    Returns a nested dictionary:
        testTimes[<classifier>][<fname>] = [classifier1_result]
    """
    F = open('../clsOpinionsConf.txt', 'r')
    header = F.readline()
    data = F.readlines()
    F.close()
    testTimes = {}
    count = 0
    classifiers = header.strip().split('\t')[1:]
    for classifier in classifiers:
        testTimes[classifier] = {}
    for line in data:
        line = line.strip().split('\t')
        fname = line[0]
        classifierResults = line[1:]
        for i in range(len(classifierResults)):
            result = classifierResults[i].strip().split(',')
            if result[1] == 'null':
                count += 1
                result = o3[fname] + [float(result[2])]
            try:
                testTimes[classifiers[i]][fname] = [int(result[0]), 
                                                    float(result[1]),
                                                    float(result[2])]
            except TypeError:
                continue
    print count,'predicted optimizations do not compile'
    return testTimes

def loadTrainRuntimes():
    """
    Loads the ground truth calculated by Will

    Expected format:benchmark\tpass#\truntime1\truntime2\runtime3\n

    Returns a nested dictionary:
        trainTimes[<benchmark>][<pass #>] = runtime
    """
    F = open('../runtime_stats.csv', 'r')
    header = F.readline()
    lines = F.readlines()
    F.close()
    trainTimes = {}
    for line in lines:
        line = line.strip().split(',')[1:]
        fname = line[0]
        config = int(line[1])
        #Calc average runtime
        runtime = sum([float(t) for t in line[2:]]) / 3
        if fname not in trainTimes:
            trainTimes[fname] = {}
        if config not in trainTimes[fname]:
            trainTimes[fname][config] = runtime
    return trainTimes


if __name__ == '__main__':
    main()
