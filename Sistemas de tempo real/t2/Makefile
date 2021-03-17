FLAGS = -Wall -lrt
LDFLAGS = -pthread

Prog:
	g++ -c $(FLAGS) *.cc
	g++ $(LDFLAGS) *.o -o Prog

all:
	make Prog

clean:
	rm -rf *.o || true
	rm -rf Prog || true

run:
	./Prog $(ARGS)

valgrind:
	valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --track-origins=yes ./Prog

xtermValgrind:
	xterm -e 'valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --track-origins=yes ./Prog; read -n 1 -p "Press any key to finish..." "mainmenuinput"'

Debug: clean Prog xtermValgrind
