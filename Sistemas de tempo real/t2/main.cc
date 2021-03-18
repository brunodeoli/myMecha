#include "task.cc"
#include "timer.cc"
#include <iostream>
#include <string>
#include <bits/stdc++.h>

using namespace std;

int main(int argc, char * argv[]){
    if(argc <= 4){
        cout << "Please, set the arguments (period/priority/load/policy)" << endl;
        return 0;
    }
    unsigned int period   = atoi(argv[1]), 
                 priority = atoi(argv[2]),
                 load     = atoi(argv[3]);
    string sched = argv[4];
    cout << "Configuration" << endl;
    cout << "Period:" << period << endl 
    	 << "Priority:" << priority << endl
    	 << "Load factor:" << load << endl 
    	 << "Scheduling Policy:" << sched << endl;

  	Task(period, priority, load, sched);

  	return 0;
}
