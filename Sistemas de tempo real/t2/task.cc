#include "task.h"

/* | inicializando atributos | */
Timer Task::_timer;

Task::Task(unsigned int period, unsigned int priority, unsigned long int load){
	_period = period;
	_deadline = period;
	_priority = priority;
	_load = load;
	_cjobs = 1;


	new (&_timer) Timer(_period, (Timer::Function*)deadline);			//cria novo timer para tarefa

	sigemptyset(&_ss);
	sigaddset(&_ss, SIGALRM);

	this->run();
}

void Task::run(){
	int signal;
	while(!sigwait(&_ss, &signal)){
		std::cout << "Response time for Job " << _cjobs << ": ";
		this->exec();
		_cjobs++;
	}
}

void Task::exec(){
	for (int i = 0; i < _load * 1000; i++) {
		/* do nothing , keep counting */
	}
	_timer.printTime();
}

void Task::deadline(){
	std::cout << "Missed the deadline for ";
}