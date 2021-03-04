## INSTRUCOES PARA UTILIZACAO DO T1.PY ##

>> Descricao:
a) Script para analise de escalonabilidade em uniprocessadores.
   É criado 100 conjuntos de tarefas para cada porcentagem de utilizacao
   e então é realizado 3 testes de escalonabilidade para Rate Monotonic (RM), sendo elas:
   	- Teste Suficiente de Liu & Layland (LL);
   	- Analise de tempo de resposta (RTA);
   	- Limite Hiperbólico (HB).

>> Utilizacao:
a) Abra um terminal na pasta destinada
b) Parametros na linha de comando no script "t1.py":
	-u : grau da unidade de tempo de utilizacao de cada tarefa -> (light/middle/heavy)
	-p : grau da unidade do periodo para cada tarefa           -> (light/moderate/long)

c) Substitua x e y pelo grau de utilizacao e periodo que se deseja analisar e escreva o seguinte codigo no terminal:
	"python3 t1.py -u x -p y"
	e de um ENTER para rodar o script.
