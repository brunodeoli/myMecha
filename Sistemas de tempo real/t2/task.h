#include "timer.h"
#include <string>

class Task
{
public:

    Task(){ };
    Task(const unsigned int period, const unsigned int priority, const unsigned int load, string sched);
    void run();    
    void exec();

private:

	unsigned int _period;						//periodo em ms (1~999)
	unsigned int _deadline;						//deadline = periodo
	unsigned int _priority;						//prioridade da tarefa/thread
	volatile unsigned int _load_factor;			//fator de carga da CPU
	static Timer _timer;						//criará um novo Timer (usar new)
	// sigset???? (configurar sinal do sigalrm)

};