#include "timer.h"

Timer::Timer(const unsigned int period, const Function * handler){
  _period = period;
  _handler = handler;

  action.sa_handler =  _handler;      //inicializando tratador de sinal
  sigev.sigev_notify = SIGEV_SIGNAL;
  sigev.sigev_signo = SIGALRM;
  sigev.sigev_value.sival_ptr = &timer;

  if(sigaction(SIGALRM, &action, nullptr) == -1)
    std::cout << "Timer::Timer(): Erro em SIGACTION.\n";

  if(timer_create(CLOCK_REALTIME, &sigev, &timer) == -1)
    std::cout << "Timer::Timer(): Erro em TIMER_CREATE.\n";  

  this->reset();
}

void Timer::reset(){
  its.it_value.tv_nsec = _period * 1000000;       //ns to ms
  its.it_interval.tv_nsec = _period * 1000000;    //ns to ms
  if(timer_settime(timer, 0, &its, NULL) == -1)
    std::cout << "Timer::Timer(): Erro em TIMER_SETTIME.\n";
}

void Timer::printTime(){
  timer_gettime(timer, &its);
  std::cout << (_period - (int)(its.it_value.tv_nsec / 1000000)) << " ms\n";
}