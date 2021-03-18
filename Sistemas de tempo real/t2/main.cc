#include <iostream>
#include <string>
#include <bits/stdc++.h>
#include <sched.h>
#include "task.h"
#include "timer.h"

using namespace std;

int main(int argc, char * argv[]){
    if(argc != 5){
      cout << "Please, set the arguments (period/priority/load/policy)" << endl;
      return -1;
    }

    unsigned int period   = atoi(argv[1]), 
                 priority = atoi(argv[2]),
                 load     = atoi(argv[3]);
    char *sched = argv[4];
    int sch;

    if(period < 1 || period > 999){
      cout << "Incorrect parameters: Period must be between 1 and 999" << endl;
      return -1;
    }
    if(priority < 1){
      cout << "Incorrect parameters: Priority must be more than zero" << endl;
      return -1;
    }
    if(load < 1){
      cout << "Incorrect parameters: The load factor must be more than zero" << endl;
      return -1;
    }
    if(strcmp(sched, "SCHED_RR") != 0 && strcmp(sched, "SCHED_FIFO") != 0){
      cout << "Incorrect parameters: Scheduling Policy must be SCHED_RR or SCHED_FIFO" << endl;
      return -1;
    } else if(strcmp(sched, "SCHED_RR") == 0) sch = 2;
    else sch = 1;

    cout << "------------------------------\n"
         << "Configuration"        << endl;
    cout << "Period: "             << period   << endl 
    	   << "Priority: "           << priority << endl
    	   << "Load factor: "        << load     << endl 
    	   << "Scheduling Policy: "  << sched    << endl
         << "------------------------------"   << endl << endl;

    sched_param param;
    param.sched_priority = priority;

    if(sched_setscheduler(0, sch, &param) < 0){          //pid_t pid, int policy, const struct sched_param *param
      cout << "Error in set scheduler:" << strerror(errno) << endl;
      return -1;
    }

  	Task Tn(period, priority, load);    

  	return 0;
}