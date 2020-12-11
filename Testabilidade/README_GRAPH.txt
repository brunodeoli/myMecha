## INSTRUCOES PARA UTILIZACAO DO GRAPH.PY ##

>> Descricao:
a) Script que plota em tempo real um dado desejado dos canais.

>> Observacao:
a) Antes de tudo, garanta que os canais do redis estao em
   execucao conforme o "README.txt".

>> Utilizacao:
a) Abra um terminal na pasta destinada
b) Parametros na linha de comando no script "graph.py":
	-g : Dado que deseja-se analisar. Ex: Temperatura;
  -s : Canal dos dados originais;
	-d : Canal com aplicacao da anomalia;
	-p : Porta do redis. Default: 6379;
	-r : Endereco do redis. Default: localhost.

c) Substitua x pelo dado desejado e escreva o seguinte codigo no terminal:
	"python3m graph.py -s 1 -d 2 -g x"
	e de um ENTER para rodar o script.
