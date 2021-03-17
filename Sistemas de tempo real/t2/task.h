#include "timer.h"


class Task
{
public:

    Task(){ };
    Task(const unsigned int period, const unsigned int priority, const unsigned int load);
    void run();    
    void exec();

private:

	unsigned int _period;
	unsigned int _deadline;
	unsigned int _priority;
	volatile unsigned int _load_factor;
	static Timer _timer;                       //criará um novo Timer (usar new)
	// sigset???? (configurar sinal do sigalrm)

};