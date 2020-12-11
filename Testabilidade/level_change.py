import csv
import redis
import json
from sys import argv
from pprint import pprint
import argparse
import time
import sys
import datetime as dt
import random

parser = argparse.ArgumentParser(description='Insert anomaly into Redis channel', add_help=True)

parser.add_argument('-a',
                    action='store',
                    dest='amplitude',
                    type=int,
                    default=20,
                    help='Amplitude desired for anomaly insertion. Suggestion: between 10 and 40. Default: 20')

parser.add_argument('-b',
                    action='store',
                    dest='reset',
                    type=int,
                    default=5,
                    help='Reset the anomaly, returns to the original values. Default: 5')

parser.add_argument('-sensors',
                    action='store',
                    dest='Sensors',
                    type=str,
                    nargs='*',
                    help='Sensors for analysis. Check the dataset')

parser.add_argument('-i',
                    action='store',
                    dest='insertion',
                    type=int,
                    default=50,
                    help='Insertion desired for anomaly. Default: 50')

parser.add_argument('-r', '--redis-host',
                    type=str, default='localhost',
                    help='address of the redis instance.')

parser.add_argument('-p', '--redis-port',
                    type=int, default=6379,
                    help='port of the redis instance.')

parser.add_argument('-s',
                    action='store',
                    dest='redis_channel_main',
                    default = 1,
                    help='Overrides redis channel to post data to.')

parser.add_argument('-d',
                    action='store',
                    dest='anomaly_channel',
                    default = 2,
                    help='Redis channel for anomaly publishing.')

parser.add_argument('--version', action='version', version='1.0')

args = parser.parse_args()

print('## Configuration: ')
print ('Redis host: '+args.redis_host)
print ('Redis port: '+str(args.redis_port))
print ('Redis Main Channel: '+str(args.redis_channel_main))
print ('Redis Anomaly Channel: '+str(args.anomaly_channel))
print ('Sensors: '+str(args.Sensors))
print ('Insertion: '+str(args.insertion))
print ('Amplitude: '+str(args.amplitude))
print ('Reset: '+str(args.reset))

def check_arguments(parser, args):
    error = False

    if len(sys.argv[1:])==0:
        error = True

    if not args.Sensors:
        print('List of sensors is empty. Please, carefully read the help below.')
        error = True

    if(int(args.insertion) < 0):
        print('Incorrect parameters: Value less than zero. Please, carefully read the help below.')
        error = True

    if(int(args.reset) < 1):
        print('Incorrect parameters: Value less than one. Please, carefully read the help below.')
        error = True

    if(error == True):
        parser.print_help()
        parser.exit()

    return

class Anomaly:
    def __init__(self, data, sensor):
        self._sensor = sensor
        self._load = data['data'][self._sensor]
        self._value = float(self._load[0])
        self._sum = 0
        self._anomaly = 0
        return

    def updateData(self, data, f, c):
        self._load = data['data'][self._sensor]        
        if (c % args.insertion == 0) and (c != 0):
            print("INSERTING ANOMALY IN ITERATION: ", c)
            self._anomaly = 1
            self._sum = self._sum + args.amplitude
        elif (c == -1):
            self._anomaly = 1
        else:
            self._anomaly = 0
        self._value = float(self._load[0]) + self._sum
        f.write(str(self._value) + "\t")        
        return

    def resetData(self):
        self._sum = 0
        return

    def getSensor(self):
        return str(self._sensor)

    def getValue(self):
        return float(self._value)

    def getAnomaly(self):
        return bool(self._anomaly)

def main(args):
    r = redis.StrictRedis(host=args.redis_host, port=args.redis_port, db=0)

    r_pubsub = r.pubsub(ignore_subscribe_messages=True)
    r_pubsub.subscribe(args.redis_channel_main)

    count = 0

    file = open('dataset_anomaly.csv','w')

    for message in r_pubsub.listen():
        if message['type'] != "message":
            continue

        output_dict = dict()

        data = json.loads(message['data'])

        file = open('dataset_anomaly.csv','a')

        #inicializa dados para canal 2
        if count == 0:
            datalist = []
            for i in range(0,len(args.Sensors)):
                datalist.append(Anomaly(data, args.Sensors[i]))
                file.write(str(args.Sensors[i])+"\t")

            file.write('Anomaly'+"\n")

            for i in range(0,len(datalist)):
                datalist[i].updateData(data, file, count)

            file.write(str(datalist[0].getAnomaly())+"\n")

        #atualizar dados
        else:
            if count == ((args.reset+1)*args.insertion):
                print("RESET ANOMALY")
                for i in range(0,len(datalist)):
                    datalist[i].resetData()
                count = -1

            for i in range(0,len(datalist)):
                datalist[i].updateData(data, file, count)
            file.write(str(datalist[0].getAnomaly())+"\n")

        # imprime no canal 2
        output_dict['timestamp'] = data['timestamp']
        output_dict['data'] = {datalist[0].getSensor():[datalist[0].getValue()]}

        for i in range(1,len(datalist)):
            output_dict['data'].update({datalist[i].getSensor():[datalist[i].getValue()]})

        anomalyIns = json.dumps(output_dict)

        r.publish(args.anomaly_channel, anomalyIns)

        file.close()

        if(count == -1):
            count = 0
        count += 1

    return

if __name__ == '__main__':
    check_arguments(parser, args)
    main(args)