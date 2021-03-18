CC_FILES=$(wildcard *.cc)
FLAGS = -Wall -lrt
ARGS = 500 1 100000 SCHED_RR

all:
	clear
	g++ $(CC_FILES) -o Prog $(FLAGS)

run:
	sudo taskset -c 0 ./Prog $(ARGS)

clean:
	rm -rf *.o || true
	rm -rf Prog || true
	clear

valgrind:
	valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --track-origins=yes ./Prog

xtermValgrind:
	xterm -e 'valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --track-origins=yes ./Prog; read -n 1 -p "Press any key to finish..." "mainmenuinput"'

Debug: clean Prog xtermValgrind