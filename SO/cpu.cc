#include "cpu.h"
#include <iostream>

__BEGIN_API

//inicializa o contexto atual
void CPU::Context::save()
{
    getcontext(&_context);
}
//retorna contexto atual
void CPU::Context::load()
{
    setcontext(&_context);
}

CPU::Context::~Context()
{
    delete _stack;
}
//troca o contexto
void CPU::switch_context(Context *from, Context *to)
{
     swapcontext(&(from->_context), &(to->_context));			//primeiro argumento salva contexto atual e segundo argumento restaura contexto chamado
}

int CPU::finc(volatile int & number){
  int old = 1;
  asm volatile("lock xadd %0, %2" : "=a"(old) : "a"(old), "m"(number) : "memory");
  return old;
}

int CPU::fdec(volatile int & number){
  int old = -1;
  asm volatile("lock xadd %0, %2" : "=a"(old) : "a"(old), "m"(number) : "memory");
  return old;
}

/*
XADD: Exchanges the first operand (destination operand) with the second operand (source operand),
then loads the sum of the two values into the destination operand.
The destination operand can be a register or a memory location; the source operand is a register.

ebx:  First Register Naming

eax: Second Register Naming

*/


__END_API
