#include <iostream>
#include "timer.h"

class Task
{
public:

    Task(){ };
    Task(unsigned int period, unsigned int priority, unsigned long int load);
    void run();
    void exec();
    static void deadline();

private:

	unsigned int _period;						//periodo em ms (1~999)
	unsigned int _deadline;						//deadline = periodo
	unsigned int _priority;						//prioridade da tarefa/thread
	unsigned int _cjobs;						//contador de jobs
	volatile int _load;							//fator de carga da CPU
	static Timer _timer;						//criará um novo Timer (usar new)
	sigset_t _ss;							 	//configurar sinal do sigalrm
};