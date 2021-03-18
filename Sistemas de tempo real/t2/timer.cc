#include "timer.h"

Timer::Timer(const unsigned int period, const Function * handler){
  std::cout << "Timer::Timer(): Inicializando Timer.\n";

  _period = period;
  _handler = handler;
  action.sa_handler =  _handler;      //inicializando tratador de sinal
  timer.it_interval.tv_usec = 0;      //inicializando timer
  timer.it_value.tv_usec = period;    //inicializando timer


  if(timer_create(CLOCK_REALTIME) == -1)
    std::cout << "Timer::Timer(): Erro em TIMER_CREATE.\n";
  if(timer_settime(timerid, 0, &timer, NULL) == -1)
    std::cout << "Timer::Timer(): Erro em TIMER_SETTIME.\n";
  if(sigaction(SIGALRM, &action, nullptr) == -1)
    std::cout << "Timer::Timer(): Erro em SIGACTION.\n";
  if(sigwait(NULL, SIGALRM) != 0)
    std::cout << "Timer::Timer(): Erro em SIGACTION.\n";

}

void Timer::reset(){

}