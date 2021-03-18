#ifndef timer_h
#define timer_h

#include <signal.h>
#include <sys/time.h>
#include <iostream>

class Timer
{
public:
    typedef void (Function)(int);

    Timer(){ };

    //period in us
    Timer(const unsigned int period, const Function * handler);

    void reset();
    void printTime();

private:
    // estrutura de inicialização do sinal
    struct sigevent sigev;
    // estrutura que define um tratador de sinal
    struct sigaction action;
    // estrutura de inicialização do timer
    struct itimerspec its;
    timer_t timer;
    unsigned int _period;
    Function *_handler;
};

#endif