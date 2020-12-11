#include "thread.h"

__BEGIN_API

typedef Ordered_List<Thread> Queue;

/* | inicializando atributos | */
Thread * Thread::_running;
Thread Thread::_main;
Thread Thread::_dispatcher;
CPU::Context Thread::_main_context;
Queue Thread::_ready;
Queue Thread::_suspended;
Timer Thread::_timer;

void Thread::init(void (*main)(void *)){
  char m_aux[5] = "main";

  new (&_main) Thread(main, static_cast<void*>(m_aux));

  /* verifica se preempção será por tempo ou não */
  if(preemp){
    db<Thread>(TRC) << "Thread::init(): preempcao por tempo HABILITADA.\n";
    new (&_timer) Timer(quantum, (Timer::Function*)reschedule);
  } else {
    db<Thread>(TRC) << "Thread::init(): preempcao por tempo DESABILITADA.\n";
    new (&_dispatcher) Thread(Thread::dispatcher);
  }

  _main._state = RUNNING;
  _running = &_main;

  CPU::switch_context(&_main_context, _main.context());
}

void Thread::dispatcher(){
  /* imprima informação usando o debug em nível TRC */
  db<Thread>(TRC) << "Thread::dispatcher(): chamada para despachante.\n";
  /* enquanto existir thread do usuário */
  while(_ready.size() > 0){           //threads main e dispatcher em operacao
    auto disp = &_dispatcher;
    auto proximo = _ready.remove()->object();   //escolha uma próxima thread a ser executada
    db<Thread>(TRC) << "Thread::dispatcher(): proximo Thread a ser executado: " << (proximo->id()) << " \n";

    /* atualiza o status da própria thread dispatacher para READY e reinsire a mesma em _ready */
    disp->_state = READY;
    disp->_link = Queue::Element(disp, std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::high_resolution_clock::now().time_since_epoch()).count());
    _ready.insert(&disp->_link);

    _running = proximo;                   //atualiza _running pra próxima thread
    proximo->_state = RUNNING;

    switch_context(disp, proximo);     //troca o contexto entre as duas threads
    /* testa se o estado da próxima thread é FINISHING e caso afirmativo a remova de _ready */
    if(proximo->_state == FINISHING || proximo == disp){
      db<Thread>(TRC) << "Thread::dispatcher(): proximo invalido, removendo proximo.\n";
      _ready.remove(proximo);
    }
  }
  _dispatcher._state = FINISHING;      //muda o estado da thread dispatcher para FINISHING
  _ready.remove(&_dispatcher._link);   //remova a thread dispatcher da fila de prontos
  switch_context(&_dispatcher, &_main);//troque o contexto da thread dispatcher para main
}

void Thread::yield(){
  db<Thread>(TRC) << "Thread::yield(): chamada para " << _running->id() << " ceder o processador.\n";
  auto atual = running();
  auto proximo = _ready.remove()->object();

  /* atualiza a prioridade da tarefa que estava sendo executada com o timestamp atual */
  if(atual->_state == FINISHING)        db<Thread>(TRC) << "\t\tEstado da Thread atual igual FINISHING.\n";
  else if (atual->_state == WAITING)    db<Thread>(TRC) << "\t\tEstado da Thread atual igual WAITING.\n";
  else if (atual == &_main)             db<Thread>(TRC) << "\t\tThread atual igual a Thread main.\n";
  else {
  /* reinsira a thread que estava executando na fila de prontos */
    db<Thread>(TRC) << "\t\tReinserindo Thread " << atual->id() << " na fila de READY.\n";
    atual->_state = READY;
    atual->_link = Queue::Element(atual, std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::high_resolution_clock::now().time_since_epoch()).count());
    _ready.insert(&atual->_link);
  }

  _running = proximo;                   //atualiza _running pra próxima thread
  proximo->_state = RUNNING;

  switch_context(atual, proximo);  //troca o contexto entre as thread
}

int Thread::switch_context(Thread * prev, Thread * next){
  if(prev!=NULL && next!=NULL){        //se prev e next forem validos...
    db<Thread>(TRC) << "Thread::switch_context(): troca de contexto de " << prev->id() << " para " << next->id() << ".\n";
    _timer.reset();                    //resetando timer
    CPU::switch_context((prev->_context),(next->_context));   //faz a troca de contexto pra main
    return 0;                          //retorna 0 se estiver tudo ok
  } else {
    db<Thread>(ERR)<<"Thread::switch_context(): Erro de validacao.\n";
    return -1;                         //retorna negativo se conter erro
  }
}

int Thread::id(){
  return _id;                          //retorna o id da thread
}

int Thread::join(){
  if(this->_state == FINISHING) return -1;
  db<Thread>(TRC) << "Thread::join(): Thread " << _running->id() << " sendo suspensa pela Thread " << id() << ".\n";
  this->_joined = _running;            //salva referencia da Thread que esta em execucao
  _running->suspend();                 //Thread em execucao suspensa
  return _exit_code;
}

void Thread::suspend(){
  db<Thread>(TRC) << "Thread::suspend(): Thread " << id() << " sendo suspensa.\n";
  _ready.remove(this);                 //Thread removida da fila de READY
  _suspended.insert(&this->_link);     //Thread inserida na fila de SUSPENDED
  this->_state = SUSPENDED;            //Thread suspensa aguardando resume()
  yield();                             //Retorna pra yield
}

void Thread::resume(){
  db<Thread>(TRC) << "Thread::resume(): Thread " << id() << " voltando para fila READY.\n";
  _suspended.remove(&this->_link);     //Thread removida da fila de SUSPENDED
  _ready.insert(&this->_link);         //Thread inserida na fila de READY
  this->_state = READY;                //Estado da Thread alterada para READY
}

void Thread::sleep(Queue * q){
  /* colocar a Thread que não conseguir acessar o semáforo para dormir e mudar seu estado para WAITING */
  auto atual = running();             //Recebe Thread atual
  db<Thread>(TRC) << "Thread::sleep(): Colocando Thread " << atual->id() << " para dormir e inserindo na fila de WAITING.\n";
  q->insert(&atual->_link);            //Thread inserida na fila de WAITING
  atual->_state = WAITING;            //Estado da Thread alterada para READY
  yield();
}

void Thread::wakeup(Queue * q){
  if(q->size() < 1) return;      //Verifica se lista de WAITING possui Threads
  auto t = q->remove()->object();//Recebe cabeca da fila de _waiting
  db<Thread>(TRC) << "Thread::wakeup(): Acordando Thread " << t->id() << " e inserindo na fila de READY.\n";
  _ready.insert(&t->_link);            //Thread inserida na fila de READY
  t->_state = READY;                   //Estado da Thread alterada para READY
  yield();
}

void Thread::wakeup_all(Queue * q){
  db<Thread>(TRC) << "Thread::wakeup_all(): Acordando todas as Threads.\n";
  while(q->size() > 0){
    auto t = q->remove()->object();//Recebe cabeca da fila de _waiting
    db<Thread>(TRC) << "Thread::wakeup_all(): Acordando Thread " << t->id() << " e inserindo na fila de READY.\n";
    _ready.insert(&t->_link);            //Thread inserida na fila de READY
    t->_state = READY;                   //Estado da Thread alterada para READY
  }
  yield();
}

void Thread::reschedule(){
  db<Thread>(TRC) << "Thread::reschedule(): chamada de interrupcao do timer.\n";
  yield();
}

void Thread::thread_exit (int exit_code){
  db<Thread>(TRC) << "Thread::thread_exit(): Thread " << id() << " sendo encerrada.\n";
  /* verifica se Thread que chamou thread_exit possui alguma Thread pra resumir e o estado é diferente de FINISHING*/
  if(this->_joined != nullptr)    this->_joined->resume();
  this->_exit_code = exit_code;        //Thread atualiza seu _exit_code com exit_code
  this->_state = FINISHING;            //altera o estado da thread para finalizada
  yield();                             //retorna para yield;
}

Thread::~Thread(){
    db<Thread>(TRC) << "Liberando Thread: " << id() << "\n";
    delete _context;
}

__END_API
