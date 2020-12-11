#include "semaphore.h"

__BEGIN_API

/* | inicializando atributos | */
Thread::Queue Semaphore::_waiting;

Semaphore::Semaphore(int v){
  db<Semaphore>(TRC) << "Semaphore::Semaphore: Inicializando semaphore.\n";
  this->_v = v;
}

Semaphore::~Semaphore(){
  wakeup_all();
  db<Semaphore>(TRC) << "Semaphore::~Semaphore: Destruindo semaphore.\n";
}

void Semaphore::p(){
  db<Semaphore>(TRC) << "Semaphore::p: Chamada para semaphore Parsen (passar).\n";
  /* decrementar o inteiro do semáforo de forma atômica */
  /* colocar a Thread para dormir caso a mesma não conseguir acessar o semáforo (já existir em uso por outra Thread). */
  fdec(this->_v);
  if(this->_v < 0) sleep();
}

void Semaphore::v(){
  db<Semaphore>(TRC) << "Semaphore::v: Chamada para semaphore Veygeren (liberar).\n";
  /* incrementar o inteiro do semáforo de forma atômica */
  /* acordar uma Thread que estiver dormindo no semáforo */
  finc(this->_v);
  if(this->_v < 1)  wakeup();
}

int Semaphore::finc(volatile int & number){
  db<Semaphore>(TRC) << "Semaphore::finc: chamada para incremento atomico.\n";
  return CPU::finc(number);
}

int Semaphore::fdec(volatile int & number){
  db<Semaphore>(TRC) << "Semaphore::finc: chamada para decremento atomico.\n";
  return CPU::fdec(number);
}

/* colocar a Thread para dormir */
void Semaphore::sleep(){
  db<Semaphore>(TRC) << "Semaphore::sleep: chamada para colocar a Thread para dormir.\n";
  Thread::sleep(&this->_waiting);
}

/* acordar uma Thread que estava dormindo no semáforo */
void Semaphore::wakeup(){
  db<Semaphore>(TRC) << "Semaphore::wakeup: chamada para acordar uma Thread que estava dormindo no semáforo.\n";
  if(_waiting.size() > 0){
    Thread::wakeup(&this->_waiting);
  } else db<Semaphore>(TRC) << "Semaphore::wakeup: lista de WAITING vazia.\n";
}

/* acordar todas as Thread que estavam dormindo no semáforo */
void Semaphore::wakeup_all(){
  db<Semaphore>(TRC) << "Semaphore::wakeup_all: chamada para acordar TODAS as Thread que estavam dormindo no semáforo.\n";
  if(_waiting.size() > 0){
    Thread::wakeup_all(&this->_waiting);
  } else db<Semaphore>(TRC) << "Semaphore::wakeup: lista de WAITING vazia.\n";
}

__END_API
