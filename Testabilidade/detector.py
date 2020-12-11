from sklearn.tree import DecisionTreeClassifier, export_graphviz
from sklearn.model_selection import train_test_split
from sklearn import metrics
from sys import argv
from pprint import pprint
import csv
import redis
import json
import argparse
import time
import sys
import datetime as dt
import random
import statistics as st
import numpy as np
import pandas as pd
import pydot
import graphviz

parser = argparse.ArgumentParser(description='Anomaly Detector into Redis channel', add_help=True)

parser.add_argument('-ch1',
                    action='store',
                    dest='anomaly_channel',
                    default=2,
                    help='Overrides redis channel to post data to.')

parser.add_argument('-ch2',
                    action='store',
                    dest='detector_channel',
                    default=3,
                    help='Redis channel for anomaly detectorection.')

parser.add_argument('-crit',
                    action='store',
                    dest='criterion',
                    type=str, default = str("gini"),
                    help='Criterion of tree. Must be "entropy" or "gini"')

parser.add_argument('-df',
                    action='store',
                    dest='dataframe',
                    type=str, default = str("dataset_anomaly.csv"),
                    help='Dataframe to training/test.')


parser.add_argument('-mdepth',
                    action='store',
                    dest='depth',
                    type=int, default = None,
                    help='The maximum depth of the tree in Machine Learning Method.')

parser.add_argument('-mleaf',
                    action='store',
                    dest='ms_leaf',
                    type=int, default = 1,
                    help='The minimum number of samples required to be at a leaf node.')

parser.add_argument('-msplit',
                    action='store',
                    dest='ms_split',
                    type=int, default = 2,
                    help='The minimum number of samples required to split an internal node.')

parser.add_argument('-samp',
                    action='store',
                    dest='n_samples',
                    type=int, default = 300,
                    help='Number of samples to train/test in Machine Learning Method.')

parser.add_argument('-sens',
                    action='store',
                    dest='sens',
                    type=int, default = 5,
                    help='Sensitivity Index. Must be bigger than one')

parser.add_argument('-sensors',
                    action='store',
                    dest='Sensors',
                    type=str,
                    nargs='*',
                    help='Sensors for analysis. Check the dataset')

parser.add_argument('-size',
                    action='store',
                    dest='testsize',
                    type=float, default = 0.25,
                    help ='Percentage of split between training and testing. Must be between zero and one')

parser.add_argument('-p', '--redis-port',
                    type=int, default=6379,
                    help='port of the redis instance.')

parser.add_argument('-r', '--redis-host',
                    type=str, default='localhost',
                    help='address of the redis instance.')

parser.add_argument('-tgt',
                    action='store',
                    dest='target',
                    type=str, default = 'Anomaly',
                    help='Target of the dataset')

parser.add_argument('--version', action='version', version='1.0')

args = parser.parse_args()

print('## Configuration: ')
print ('Redis host: '+args.redis_host)
print ('Redis port: '+str(args.redis_port))
print ('Redis Anomaly Channel: '+str(args.anomaly_channel))
print ('Detector Channel: '+str(args.detector_channel))
print ('Sensors: '+str(args.Sensors))
print ('Sensitivity Index: '+str(args.sens))
print ('Minimum samples training/test: '+str(args.n_samples))
print ('Target data for analysis: '+str(args.target))
print ('Split quality criteria: '+str(args.criterion))
print ('Split training/test [%]: '+str(args.testsize))
print ('Minimum samples leaf: '+str(args.ms_leaf))
print ('Minimum samples split: '+str(args.ms_split))
print ('Maximum depth of the tree: '+str(args.depth))
print ('---------------------------------------')

def check_arguments(parser, args):
    error = False

    if len(sys.argv[1:])==0:
        error = True

    if not args.Sensors:
        print('List of sensors is empty. Please, carefully read the help below.')
        error = True

    if(int(args.sens) < 1):
        print('Incorrect parameters: Value less than one. Please, carefully read the help below.')
        error = True

    if(int(args.n_samples) < 1):
        print('Incorrect parameters: Value less than one. Please, carefully read the help below.')
        error = True

    if(str(args.criterion) != str("entropy") and str(args.criterion) != str("gini")):
        print('Incorrect parameters: Criterion are “gini” for the Gini impurity and “entropy” for the information gain. Please, carefully read the help below.')
        error = True

    if(float(args.testsize) < 0 or float(args.testsize) > 1):
        print('Incorrect parameters: Value must be between 0 and 1. Please, carefully read the help below.')
        error = True

    if(int(args.ms_leaf) < 1):
        print('Incorrect parameters: Value less than one. Please, carefully read the help below.')
        error = True

    if(int(args.ms_split) < 2):
        print('Incorrect parameters: Value less than two. Please, carefully read the help below.')
        error = True

    if(args.depth != None):
        if(args.depth < int(args.ms_split)):
            print('Incorrect parameters: Value less than min. samples split. Please, carefully read the help below.')
            error = True

    if(error == True):
        parser.print_help()
        parser.exit()

    return

####################################################################

class Statistic:
    def __init__(self, data, sensor):
        self._sensor = sensor
        self._load = data['data'][self._sensor]
        self._value = float(self._load[0])
        self._list = []
        self._avg = 0
        self._stdev = 0
        self._uppercl = 0
        self._lowercl = 0
        self._anomaly = 0

    def updateData(self,data,r):
        if not isinstance(data, dict):
            raise TypeError("Invalid type of data value to updateData.")
        prev_upper = self._uppercl
        prev_lower = self._lowercl
        self._load = data['data'][self._sensor]
        self._value = float(self._load[0])
        self._list.append(self._value)
        if len(self._list) > 2:
            self._avg = st.mean(self._list)
            self._stdev = st.stdev(self._list, xbar = self._avg)
            self._uppercl = self._avg + args.sens*self._stdev
            self._lowercl = self._avg - args.sens*self._stdev
        if prev_upper != 0 and prev_lower != 0:
            self.checkAnomaly(prev_upper, prev_lower)
            if self._anomaly == 1:
                print('ANOMALY DETECTED BY THE STATISTICAL METHOD')
                r.publish(args.detector_channel, 'ANOMALY DETECTED BY THE STATISTICAL METHOD')
                self.resetData()
        return

    def checkAnomaly(self, upper, lower):
        if not isinstance(upper, (int, float)):
            raise TypeError("Invalid type of upper value to checkAnomaly.")
        if not isinstance(lower, (int, float)):
            raise TypeError("Invalid type of lower value to checkAnomaly.")
        if self._stdev == 0 or self._avg == 0 or self._uppercl == 0 or self._lowercl == 0:
            self._anomaly = 0
            return
        elif self._value > upper or self._value < lower:
            self._anomaly = 1
        else:
            self._anomaly = 0
        return

    def resetData(self):
        self._list = [self._value]
        self._avg = 0
        self._stdev = 0
        self._uppercl = 0
        self._lowercl = 0
        self._anomaly = 0

    def printStat(self):
        print("Sensor: ", self._sensor)
        print("Value: ", self._value)
        print("List: ", self._list)
        print("Average: {:f}".format(self._avg))
        print("StdDeviation: {:f}".format(self._stdev))
        print("UpperCL: {:f}".format(self._uppercl))
        print("LowerCL: {:f}".format(self._lowercl))
        print("---------------------------------------")
        return

####################################################################

class DecisionTree:
    def __init__(self, dataset):
        self._dataset = pd.read_csv(str(dataset), sep = '\t')  # dataset
        self._dTree = DecisionTreeClassifier(criterion = args.criterion, 
                                             max_depth = args.depth,
                                             min_samples_split = args.ms_split,
                                             min_samples_leaf = args.ms_leaf)
        self._Xtrain, self._Xtest, self._ytrain, self._ytest = train_test_split(self._dataset.drop(str(args.target),axis=1),
                                                                                self._dataset[str(args.target)],
                                                                                test_size = float(args.testsize))
        return

    def fitTree(self):
        #treinamento do dataset para arvore de decisão        
        return self._dTree.fit(self._Xtrain, self._ytrain)

    def resultTree(self):
        #resultado da arvore de decisão
        result = self._dTree.predict(self._Xtest)
        print('Metrics of decision tree:')
        print(metrics.classification_report(self._ytest, result))
        return

    def predictTree(self, data, r):
        if not isinstance(data, dict):
            raise TypeError("Invalid type of data value to predictTree.")
        x = pd.DataFrame(data)
        if self._dTree.predict(x) == True:
            print('ANOMALY DETECTED BY THE MACHINE LEARNING METHOD')
            r.publish(args.detector_channel, 'ANOMALY DETECTED BY THE MACHINE LEARNING METHOD')
        return

    def classTree(self):
        #verifica as features mais importantes para o dataset treinado
        print('Importance level of sensors:')
        for feat,important in zip(self._dataset.columns, self._dTree.feature_importances_):
            print("     {}: {:f}".format(feat,important))
        return

    def plotTree(self):
        #plota grafico da arvore de decisão
        dot_data = export_graphviz(self._dTree, 
                                   out_file = None,
                                   feature_names = self._dataset.drop(str(args.target),axis = 1).columns,
                                   class_names=['0','1'],  
                                   filled=True, rounded=True,  
                                   special_characters=True)
        graph = graphviz.Source(dot_data)
        graph.render("Tree_Result")
        return

####################################################################

def main(args):

    r = redis.StrictRedis(host=args.redis_host, port=args.redis_port, db=0)

    r_pubsub = r.pubsub(ignore_subscribe_messages=True)
    r_pubsub.subscribe(args.anomaly_channel)

    status_s = False
    status_t = 0

    for message in r_pubsub.listen():
        if message['type'] != "message":
            continue

        output_dict = dict()

        data = json.loads(message['data'])

        ## ------ STATISTIC ------ ##
        if status_s == False:
            datalist = []
            for i in range(0,len(args.Sensors)):
                datalist.append(Statistic(data, args.Sensors[i]))
            status_s = True

        #atualiza Dados
        for i in range(0,len(datalist)):
            datalist[i].updateData(data,r)
        
        ## ------ M. LEARNING ------ ##

        if(status_t == 2):
            detector.predictTree(data['data'], r)
        elif(status_t == 0):
            ds = pd.read_csv(str(args.dataframe), sep = '\t')
            count = int(ds.shape[0])
            status_t = 1

        if(count > args.n_samples) and (status_t == 1):
            detector = DecisionTree(str(args.dataframe))
            detector.fitTree()
            detector.resultTree()
            detector.classTree()
            detector.plotTree()
            status_t = 2

        count += 1

    return

if __name__ == '__main__':
    check_arguments(parser, args)
    main(args)
