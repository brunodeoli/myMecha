#ifndef cpu_h
#define cpu_h

#include <ucontext.h>
#include <iostream>
#include "traits.h"

__BEGIN_API

class CPU
{
    public:

        class Context
        {
        private:
            static const unsigned int STACK_SIZE = Traits<CPU>::STACK_SIZE;
        public:
            Context() { _stack = 0; }

            template<typename ... Tn>

            //variadic template

            Context(void (* func)(Tn ...), Tn ... an){
                //alocar memória p pilha do novo contexto
                _stack = new char[STACK_SIZE];
                //inicializar campos da estrutura ucontext_t
                getcontext(&_context);
                //uc_link is a pointer to another context. When the function associated
                //with the current context completes its execution, the control
                //transfers to the context pointed to by uc_link pointer.
                _context.uc_link=0;
                //ss_sp, which points to the stack memory.
                //We dynamically allocate some finite amount of memory for this pointer.
                _context.uc_stack.ss_sp = _stack;
                //ss_size is an integer type that stores the amount of memory
                //that you allocated previously to the void pointer.
                //Both values should match else your program may go wrong.
                _context.uc_stack.ss_size=STACK_SIZE;
                //ss_flags is the flags associated with the stack.
                _context.uc_stack.ss_flags=0;

                makecontext(&_context, (void (*)())func, sizeof ... (an), an ...);    //cria novo contexto
            }
            ~Context();

            void save();
            void load();

        private:
            char *_stack;       //ponteiro para pilha (deve ser alocada na criação de um novo contexto)
        public:
            ucontext_t _context;
        };

    public:

      static void switch_context(Context *from, Context *to);     //vai fazer a troca de contexto de *from pra *to

      static int finc(volatile int & number);
      static int fdec(volatile int & number);

};

__END_API

#endif
