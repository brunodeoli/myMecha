#include "timer.h"

Timer::Timer(const unsigned int period, const Function * handler){
  std::cout << "Timer::Timer(): Inicializando Timer.\n";

  _period = period;
  _handler = handler;
  action.sa_handler =  _handler;      //inicializando tratador de sinal
  timer.it_interval.tv_usec = 0;      //inicializando timer
  timer.it_value.tv_usec = period;    //inicializando timer

  if(sigaction(SIGALRM, &action, nullptr) == -1)
    std::cout << "Timer::Timer(): Erro em SIGACTION.\n";

  if(setitimer(ITIMER_REAL, &timer, nullptr) == -1)
    std::cout << "Timer::Timer(): Erro em SETITIMER.\n";
}

void Timer::reset(){
  std::cout << "Timer::reset(): chamada para reset do timer.\n";
  if(setitimer(ITIMER_REAL, &timer, nullptr) == -1)
    std::cout << "Timer::reset(): Erro em SETITIMER.\n";
}