#ifndef timer_h
#define timer_h

#include "traits.h"
#include "debug.h"
#include <signal.h>
#include <sys/time.h>

__BEGIN_API

class Timer
{
public:
    typedef void (Function)(int);

    Timer(){ };

    //period in us
    Timer(const unsigned int period, const Function * handler);

    void reset();

private:
    // estrutura que define um tratador de sinal
    struct sigaction action;
    // estrutura de inicialização do timer
    struct itimerval timer;
    unsigned int _period;
    Function *_handler;
};

__END_API

#endif
