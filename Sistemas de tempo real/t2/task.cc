#include "task.h"

/* | inicializando atributos | */
Timer Task::_timer;

Task::Task(const unsigned int period, const unsigned int priority, const unsigned int load, string sched){
	_period = period;
	_deadline = period;
	_priority = priority;
	_load_factor = load;



	new (&_timer) Timer(_period, (Timer::Function*)exec);			//cria novo timer para tarefa
}

void Task::run(){
	while(){

	}
}

void Task::exec(){
	for (int i = 0; i < _load_factor * 1000; i++) {
		/* do nothing , keep counting */
	}
}

