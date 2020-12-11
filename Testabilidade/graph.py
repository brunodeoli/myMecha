import matplotlib.pyplot as plt
import numpy as np
import redis
import json
from sys import argv
from pprint import pprint
import argparse
import sys

parser = argparse.ArgumentParser(description='Graphic in Redis channel', add_help=True)

parser.add_argument('-g',
                    action='store',
                    dest='analyze',
                    type=str,
                    help='data to analyze.')

parser.add_argument('-r', '--redis-host',
                    type=str, default='localhost',
                    help='address of the redis instance.')

parser.add_argument('-p', '--redis-port',
                    type=int, default=6379,
                    help='port of the redis instance.')

parser.add_argument('-s',
                    action='store',
                    dest='redis_channel',
                    default=1,
                    help='Overrides redis channel to post data to.')

parser.add_argument('-d',
                    action='store',
                    dest='anomaly_channel',
                    default=2,
                    help='Redis channel for anomaly publishing.')

parser.add_argument('--version', action='version', version='1.0')

args = parser.parse_args()

print('## Configuration: ')
print ('Redis Main Channel: '+str(args.redis_channel))
print ('Anomaly Channel: '+str(args.anomaly_channel))
print ('Data to analyze: '+args.analyze)
print ('Redis host: '+args.redis_host)
print ('Redis port: '+str(args.redis_port))

def check_arguments(parser, args):
    error = False

    if len(sys.argv[1:])==0:
        error = True

    if(error == True):
        parser.print_help()
        parser.exit()

    return

plt.figure(figsize=(13,5))
plt.ion()
x = []
y = []
ya = []
cont = 1

def update_plot(x,y):
    plt.plot(x,y)
    plt.plot(x,ya)
    plt.draw()
    plt.pause(1)
    plt.clf()

r = redis.StrictRedis(host=args.redis_host, port=args.redis_port, db=0)

r1 = r.pubsub(ignore_subscribe_messages=True)
r1.subscribe(args.redis_channel)
r2 = r.pubsub(ignore_subscribe_messages=True)
r2.subscribe(args.anomaly_channel)

try:
    check_arguments(parser, args)

    for message in r1.listen():
        if message['type'] != "message":
            continue
        for message2 in r2.listen():
            if message2['type'] != "message":
                continue
            data = json.loads(message['data'])
            data2 = json.loads(message2['data'])
            break

        x.append(cont)
        y.append(data['data'][args.analyze])
        ya.append(data2['data'][args.analyze])
        update_plot(x,y)
        cont = cont + 1

except KeyboardInterrupt:
    pass
