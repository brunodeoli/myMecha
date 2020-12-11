#!/usr/bin/python3
#
# Script that gets data from a csv file and publishes into Redis
#
import csv
import redis
import json
from sys import argv
from pprint import pprint
import argparse
import time
import sys

parser = argparse.ArgumentParser(description='Take data from a csv file and publishes into Redis. The csv data file must have two columns at least: channel and timestamp (in milliseconds).', add_help=True)

parser.add_argument('-n',
                    action='store',
                    dest='number_samples',
                    type=int,
                    default=0,
                    help='Number of samples to be replayed. 0 mean the entire file. (default 0)')

parser.add_argument('-r', '--redis-host',
                    type=str, default='localhost',
                    help='address of the redis instance')

parser.add_argument('-p', '--redis-port',
                    type=int, default=6379,
                    help='port of the redis instance')

parser.add_argument('-s',
                    action='store',
                    dest='publish_speed',
                    type=float,
                    default=1,
                    help='Replay speed. 0 means fast as possible. 1 means recorded speed (as in the csv file). "k" means k-times speedup (default 0)')

parser.add_argument('-v', '--verbose',
                    action='store',
                    dest='verbose',
                    type=int,
                    default=0,
                    help='Increase verbosity of program')

parser.add_argument('-c',
                    action='store',
                    dest='redis_channel',
                    help='Overrides redis channel to post data to. If not specified, use channel given in the csv file.')

parser.add_argument('-f',
                    action='store',
                    dest='filename',
                    help='The csv filename used as input.')

parser.add_argument('--version', action='version', version='1.0')

args = parser.parse_args()

print('## Configuration: ')
print ('Redis host: '+args.redis_host)
print ('Redis port: '+str(args.redis_port))
print ('Sample #  : '+str(args.number_samples))
print ('Speedup   : '+str(args.publish_speed))
print ('Verbose   : '+str(args.verbose))

#print(args.db_info[0])

#################################

def check_arguments(parser, args):
    error = False

    if len(sys.argv[1:])==0:
        error = True

    if(args.number_samples < 0):
        print('Incorrect parameters: Negative number of samples. Please, carefully read the help below.')
        error = True

    if(args.publish_speed < 0):
        print('Incorrect parameters: Publish speed must be >= 0. Please, carefully read the help below.')
        error = True

    if(args.filename == None):
        print('Incorrect parameters: csv filename not given. Please, carefully read the help below.')
        error = True

    if(error == True):
        parser.print_help()
        parser.exit()

    return

#################################

def csv_to_redis(redis_con, args):
    reader = csv.DictReader(open(args.filename, 'r'))
    samples = 0
    first_row = True
    for row in reader:
        if args.verbose: print(row)

        output_dict = dict()

        if(args.publish_speed != 0):
            if first_row == False:
                sleep_period = float(row['Timestamp']) - last_timestamp
                if args.verbose: print('sleep timer: ', sleep_period)
                if sleep_period > 0: time.sleep((sleep_period / args.publish_speed) / 1000) 
        channel = row['channel'] if args.redis_channel == None else args.redis_channel

        output_dict['timestamp'] = float(row['Timestamp'])

        #O dicionario "data" deve ser adaptado conforme estipulado no formato de dados da disciplina
        #Aqui mudei o formato do data para o nosso .csv
        output_dict['data'] = {'D0':[float(row['D0'])],   #D0: Delta da tecla 0
        'S0':(row['S0']),                                 #S0: Status da tecla 0
        'D1':[float(row['D1'])],
        'S1':(row['S1']),
        'D2':[float(row['D2'])],
        'S2':(row['S2']),
        'D3':[float(row['D3'])],
        'S3':(row['S3']),
        'D4':[float(row['D4'])],
        'S4':(row['S4']),
        'D5':[float(row['D5'])],
        'S5':(row['S5']),
        'D6':[float(row['D6'])],
        'S6':(row['S6']),
        'D7':[float(row['D7'])],
        'S7':(row['S7']),
        'D8':[float(row['D8'])],
        'S8':(row['S8']),
        'D9':[float(row['D9'])],
        'S9':(row['S9']),
        'D10':[float(row['D10'])],
        'S10':(row['S10']),
        'D11':[float(row['D11'])],
        'S11':(row['S11']),
        'D12':[float(row['D12'])],
        'S12':(row['S12']),
        'D13':[float(row['D13'])],
        'S13':(row['S13']),
        'D14':[float(row['D14'])],
        'S14':(row['S14']),
        'D15':[float(row['D15'])],
        'S15':(row['S15']),
        'D16':[float(row['D16'])],
        'S16':(row['S16']),
        'D17':[float(row['D17'])],
        'S17':(row['S17'])}   
		
        data = json.dumps(output_dict)
        first_row = False
        last_timestamp = float(row['Timestamp'])

        redis_con.publish(channel, data)  #canal a ser publicado
        print('.',end='')
        sys.stdout.flush()
        if(args.number_samples != 0): 
            samples += 1
            if(samples == args.number_samples):
                break
    print('done')
        
#################################

def main(args):
    redis_con = redis.StrictRedis( host=args.redis_host,
                                   port=args.redis_port,
                                   db=0)
    csv_to_redis(redis_con, args)

################################

if __name__ == '__main__':
    check_arguments(parser, args)
    main(args)
