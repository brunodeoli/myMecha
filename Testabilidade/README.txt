# INSERTOR E DETECTOR DE ANOMALIAS EM UM DATASET DE SISTEMAS EMBARCADOS

## INSERTOR: MUDANÇA DE NIVEL
## DETECTOR: ARVORE DE DECISOES + ESTATISTICO

## VIDEO DA EXECUCAO: https://drive.google.com/file/d/11n2dOpvr8uIxbwhHhCjB3f0z_6rYqKOg/view?usp=sharing
----------------------------------------------------------------------------

## INSTRUCOES PARA UTILIZACAO ##

>> Redis-server:
a) Abra um terminal na pasta destinada
b) Escreva "redis-server" e de um ENTER
c) Digite o codigo a seguir: python3m csv2redis_machine.py -c 1 -f dataset_machine.csv -v 10 -s 1

>> Canal 1:
a) Abra um terminal na pasta destinada
b) Escreva "redis-cli" e de um ENTER
c) Escreva "subscribe 'nome_do_canal_1'" e de um ENTER

** O CANAL 1 COMECARA A RECEBER OS DADOS DO DATASET ORIGINAL**

>> Canal 2:
a) Abra um terminal na pasta destinada
b) Escreva "redis-cli" e de um ENTER
c) Escreva "subscribe 'nome_do_canal_2'" e de um ENTER

>> Script para insercao da anomalia:
a) Abra um terminal na pasta destinada
b) Parametros na linha de comando no script "level_change.py":
	-a : Amplitude desejada da anomalia. Default: 20;
	-b : Reset da anomalia.
			 A partir de quantas anomalias vai voltar para os dados originais. Default: 5;
	-i : Insercao desejada da anomalia.
			 A cada x timestamps vai inserir uma anomalia. Default: 50;
	-p : Porta do redis. Default: 6379;
	-s : Canal dos dados originais (canal 1);
	-sensors : Sensores desejados para aplicacao;
	-d : Canal com aplicacao da anomalia (canal 2);
	-r : Endereco do redis. Default: localhost.

c) Substitua k, x, y e z por valores desejados e escreva o seguinte codigo no terminal:
	"python3m level_change.py -s 'nome_do_canal_1' -d 'nome_do_canal_2' -a k -b x -i y -sensors z"
	exemplo:
	"python3m level_change.py -s 1 -d 2 -a 40 -b 4 -i 10 -sensors Temperatura Umidade"
	e de um ENTER para rodar o script.

** NO TERMINAL DO ARQUIVO "level_change.py" TERA UM PRINT QUANDO ACONTECER A ANOMALIA **
** O CANAL 2 COMECARA A RECEBER OS DADOS DO DATASET COM INSERCAO DA ANOMALIA **

>> Canal 3:
a) Abra um terminal na pasta destinada
b) Escreva "redis-cli" e de um ENTER
c) Escreva "subscribe 'nome_do_canal_3'" e de um ENTER

>> Script para detector da anomalia:
a) Abra um terminal na pasta destinada
b) Parametros na linha de comando no script "detector.py":
	-ch1 : Canal dos dados com anomalia (canal 2);
	-ch2 : Canal com resultado do detector da anomalia (canal 3);
	-crit : Criterio utilizado para machine learning. Default: gini;
	-df : DataFrame usado para machine learning. Default: dataset_anomaly.csv;
	-mleaf : Minimo de nós folhas. Default: 1;
	-msplit : Minimo de divisão de nós: 2;
	-mdepth : Controle da profundidade da arvore. Default: None;
	-samp : Numero minimo de samples para treinamento/teste. Default 150;
	-sens : Indice de sensibilidade do detector estatistico. Default: 5;
	-sensors : Sensores desejados para aplicacao;
	-size : Divisao dos samples para treinamento/teste em porcentagem. Default: 0.25;
	-tgt : Alvo para treinamento/teste. Default: 'Anomaly'.

c) Utilize os parametros com valores desejados e rode o script no terminal:	
	exemplo de execucao:
	"python3m detector.py -ch1 2 -ch2 3 -crit entropy -mdepth 10 -samp 500 -size 0.3 -sensors Temperatura Umidade"
	copie e cole no terminal e de um ENTER para rodar o script.

** NO TERMINAL DO ARQUIVO "detector.py" TERA UM PRINT QUANDO ACONTECER A DETECCAO DA ANOMALIA **
** ASSIM QUE O DATAFRAME ESCOLHIDO TIVER NUMERO DE SAMPLES DESEJADO, MACHINE LEARNING SERA INICIADO **
** O CANAL 3 COMECARA A RECEBER OS RESULTADOS DOS DETECTORES DE ANOMALIA **
	
>> Resultado:
a) O script vai atualizar em tempo real o arquivo 'dataset_level_change.csv'
   	 sendo o dataset com aplicacao da anomalia. Podendo ser feita uma analise
	 detalhada do resultado obtido.
b) Outra opcao de analise, usando o script "graph.py", que plota em tempo real
 	 uma informacao desejada dos dois canais (original e com anomalia),
	 leia mais sobre como utilizar em "README_GRAPH.txt".
