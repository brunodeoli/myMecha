#include "system.h"


__BEGIN_API

void System::init(void(*main)(void *)){
  db<System>(TRC) << "System::init() chamado\n";
  setvbuf (stdout, 0, _IONBF, 0);
  Thread::init(main); //cria thread main para inicialização do SO
}

__END_API
