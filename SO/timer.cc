#include "timer.h"

__BEGIN_API

/*******************************************************
  SIGALRM:      14       Term    Timer signal from alarm(2)

  SIGACTION: returns 0 on success and -1 on error.
  int sigaction(int signum, const struct sigaction *act, struct sigaction *oldact);

  SETITIMER: The setitimer function sets the timer specified by which according to new.
  int setitimer (int which, const struct itimerval *new, struct itimerval *old)
  On success, zero is returned. On error, -1 is returned, and errno is set appropriately.

  ITIMER_REAL: decrements in real time, and delivers SIGALRM upon expiration.
********************************************************/

Timer::Timer(const unsigned int period, const Function * handler){
  db<Timer>(TRC) << "Timer::Timer(): Inicializando Timer.\n";

  _period = period;
  _handler = handler;
  action.sa_handler =  _handler;      //inicializando tratador de sinal
  timer.it_interval.tv_usec = 0;      //inicializando timer
  timer.it_value.tv_usec = period;    //inicializando timer

  if(sigaction(SIGALRM, &action, nullptr) == -1)
    db<Timer>(ERR) << "Timer::Timer(): Erro em SIGACTION.\n";

  if(setitimer(ITIMER_REAL, &timer, nullptr) == -1)
    db<Timer>(ERR) << "Timer::Timer(): Erro em SETITIMER.\n";
}

void Timer::reset(){
  db<Timer>(TRC) << "Timer::reset(): chamada para reset do timer.\n";
  if(setitimer(ITIMER_REAL, &timer, nullptr) == -1)
    db<Timer>(ERR) << "Timer::reset(): Erro em SETITIMER.\n";
}

__END_API
