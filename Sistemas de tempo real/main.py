from matplotlib.ticker import PercentFormatter
from sys import argv
import matplotlib.pyplot as plt
import numpy as np
import random
import math
import argparse
import sys

TESTS = 100

parser = argparse.ArgumentParser(description='Schedulability Analysis in Uniprocessors', add_help=True)

parser.add_argument('-u',
                    action='store',
                    dest='utilization',
                    type=str, default = str("middle"),
                    help='Utilization of task. Must be "light", "middle" or "heavy"')

parser.add_argument('-p',
                    action='store',
                    dest='period',
                    type=str, default = str("moderate"),
                    help='Period of task. Must be "light", "moderate" or "long"')

args = parser.parse_args()

print('Schedulability Analysis in Uniprocessors')
print('Configuration:')
print ('>> Utilization: '+str(args.utilization))
print ('>> Period: '+str(args.period))
print ('---------------------------------------')

def check_arguments(parser, args):
    error = False

    if len(sys.argv[1:])==0:
        error = True

    if(str(args.utilization) != str("light") and str(args.utilization) != str("middle") and str(args.utilization) != str("heavy")):
        print('Incorrect parameters: Utilization must be "light", "middle" or "heavy".')
        error = True

    if(str(args.period) != str("light") and str(args.period) != str("moderate") and str(args.period) != str("long")):
        print('Incorrect parameters: Period must be "light", "moderate" or "long".')
        error = True

    if(error == True):
        parser.print_help()
        parser.exit()

    return

def print_tau(tau):
    for i in range(len(tau)):
        print(i, tau[i])
    return

def plot_UxS(x, y_ll, y_rta, y_hb): 
    plt.plot(x, y_ll, color = 'red', label = 'Liu & Layland', linewidth = 2)
    plt.plot(x, y_rta, color = 'green', label = 'RTA', linewidth = 2)
    plt.plot(x, y_hb, color = 'yellow', label = 'Hyperbolic Bound', linewidth = 2)
    plt.axis([0, 1.1, 0, 1.1])
    plt.gca().yaxis.set_major_formatter(PercentFormatter(1))
    plt.title('Schedulability Analysis in Uniprocessors\nUtilization: '+str(args.utilization)+' | Period: '+str(args.period))
    plt.xlabel("Utilization cap")
    plt.ylabel("Schedulability")
    plt.legend(loc=3)
    plt.grid(True)
    plt.savefig('utilization-'+str(args.utilization)+'_'+'period-'+str(args.period)+'.png')
    plt.show()
    return

def schedule_LL(tau):
    #Rate Monotonic (RM) by Liu & Layland
    #Sufficient schedulability test
    #Priority: Increasing period.
    Ub = 0
    tau.sort()
    for i in range(len(tau)):
        Ub = Ub + tau[i][1]
        if( Ub >= np.log(2) ):
            return False
    return True

def summ_RTA(prev, tau, j):
    s = 0
    for i in range(j-1, -1, -1):
        s = s + tau[i][2] * math.ceil(prev/tau[i][0])
        #print("Iter: ",i,"  ->  ", s,"=", tau[i][2],"*(",prev,"/",tau[i][0],")")
    return s

def schedule_RTA(tau):
    #Response Time Analysis (RTA) by Audsley
    #Exact schedulability test
    tau.sort()
    sch = len(tau)
    for i in range(1, len(tau)):          #Increasing tasks
        Ci = tau[i][2]                    #Execution time of i task
        Di = tau[i][0]                    #deadline = period
        Wprev = Ci                        #Previous window
        Wnext = 0
        while(1):
            I = summ_RTA(Wprev, tau, i)   #Interrupts
            Wnext = Ci + I                #Next window
            #Equal is schedulable / Pass the deadline is not schedulable
            if(Wprev == Wnext or Wnext > Di):
                break                     #Breaks while loop
            Wprev = Wnext
        if(Wnext > Di):
            return False                  #Breaks for loop
    return True

def schedule_HB(tau):
    #Hyperbolic Bound
    #Less pessimistic than LL
    #Tighter sufficient schedulability
    tau.sort() 
    Ui = tau[0][1]+1 
    for i in range(1, len(tau)):
        Ui = Ui*(tau[i][1]+1)
    if( Ui >= 2 ):
            return False
    return True

def task(Tau):
    #UTILIZATION [np.random.uniform(initial, final)]
    if(args.utilization == "light"):
        U  = np.random.uniform(0.0001, 0.01)
    elif(args.utilization == "middle"):
        U = np.random.uniform(0.001,  0.09)
    elif(args.utilization == "heavy"):
        U = np.random.uniform(0.09,   0.1)

    #PERIOD [np.random.randint(initial, final)]
    if(args.period == "light"):
        P  = np.random.randint(3,  33)
    elif(args.period == "moderate"):
        P = np.random.randint(10, 100)
    elif(args.period == "long"):
        P = np.random.randint(50, 250)

    #EXECUTION TIME: U = C/P    ->   C = U*P
    Tau.append([ P, round(U,6), round(P*U,6) ])
    return Tau

def u_sum(tau):
    u = 0
    for i in range(len(tau)):
        u = u + tau[i][1]
    return u

def task_set(lim):
    u_tasks = 0
    tau = []
    while(1):
        ts = task(tau)
        u_tasks = u_sum(ts)
        if(u_tasks > lim):
            if(u_tasks > 1):
                u_tasks = u_tasks - tau[len(tau)-1][1]
                tau.pop()
            break
    return tau

def sets(sysU, test):
    n_tests = 0
    test_sets = []
    for i in range(TESTS):
        test_sets.append(task_set(sysU))
    if(test == 'LL'):
        for i in range(len(test_sets)):
            if(schedule_LL(test_sets[i])):
                n_tests += 1
    elif(test == 'RTA'):
        for i in range(len(test_sets)):
            if(schedule_RTA(test_sets[i])):
                n_tests += 1
    elif(test == 'HB'):
        for i in range(len(test_sets)):
            if(schedule_HB(test_sets[i])):
                n_tests += 1
    return n_tests

def main(args):
    schedulability = [[1],[1], [1]]
    syst_utilization = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
    for i in range(1, len(syst_utilization)):
        schedulability[0].append(sets(syst_utilization[i], 'LL') / TESTS)
        schedulability[1].append(sets(syst_utilization[i], 'RTA')/ TESTS)
        schedulability[2].append(sets(syst_utilization[i], 'HB') / TESTS)
    plot_UxS(syst_utilization, schedulability[0], schedulability[1], schedulability[2])
    return

if __name__ == '__main__':
    check_arguments(parser, args)
    main(args)
