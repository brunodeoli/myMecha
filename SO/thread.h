#ifndef thread_h
#define thread_h

#include "cpu.h"
#include "traits.h"
#include "debug.h"
#include "list.h"
#include "timer.h"
#include <time.h>
#include <ctime>
#include <chrono>
#include <iostream>

__BEGIN_API

class Thread
{
    friend class Semaphore;

protected:
    typedef CPU::Context Context;

public:
    typedef Ordered_List<Thread> Queue;

    // Thread State
    enum State {
        RUNNING,
        READY,
        FINISHING,
        SUSPENDED,
        WAITING
    };

    Thread() { }

    template<typename ... Tn>
    Thread(void (* entry)(Tn ...), Tn ... an);

    static Thread * running() { return _running; }

    static int switch_context(Thread * prev, Thread * next);

    void thread_exit (int exit_code);

    int id();

    static void dispatcher();

    static void init(void (*main)(void *));

    static void yield();

    int join();

    void suspend();

    void resume();

    ~Thread();

    /*
     * Qualquer outro método que você achar necessário para a solução.
     */

     Context* context() { return _context; }   //método para retornar contexto da thread
     static void sleep(Queue * q);             //método para suportar sleep de semaphore
     static void wakeup(Queue * q);            //método para suportar wakeup de semaphore
     static void wakeup_all(Queue * q);        //método para suportar wakeup_all de semaphore
     static void reschedule();                 //método para realizar o reescalonamento do sistema

private:
    int _id;
    int _exit_code;
    Context * volatile _context;
    static Thread * _running;

    static Thread _main;
    static CPU::Context _main_context;
    static Thread _dispatcher;
    static Queue _ready;
    Queue::Element _link;
    volatile State _state;

    /*
     * Qualquer outro atributo que você achar necessário para a solução.
     */

    Thread * _joined;
    static Queue _suspended;                   //atributo criado para tratamento do estado SUSPENDED.
    static Timer _timer;                       //criará um novo Timer quando a preempção por tempo estiver habilitada no sistema.
    static const unsigned int quantum = Traits<Thread>::QUANTUM;  //receberá quantum definido no traits
    static const bool preemp = Traits<Thread>::PREEMP;            //receberá tipo da preempcao definido no traits
};

template<typename ... Tn>
inline Thread::Thread(void (* entry)(Tn ...), Tn ... an) /* inicialização de _link */
{
    //IMPLEMENTAÇÃO DO CONSTRUTOR
    _context = new Context(entry, an ...);  //cria e aloca contexto da thread, passando funcao(entry) e parametros (an)
    _id = clock();   //id padrão pra thread

    //iniciliza _link e adiciona a thread na fila de pronto
    _link = Queue::Element(this, std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::high_resolution_clock::now().time_since_epoch()).count());
    _ready.insert(&_link);
    _state = READY;

    _joined = nullptr;

    db<Thread>(TRC) << "Construindo Thread: " << id() << "\n";
}

__END_API

#endif
