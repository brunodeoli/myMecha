FLAGS = -Wextra -Wcast-align -Wctor-dtor-privacy -Wdisabled-optimization -Wformat=2 -Winit-self -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wnoexcept -Woverloaded-virtual -Wredundant-decls -Wshadow -Wsign-promo -Wstrict-null-sentinel -Wstrict-overflow=2 -Wswitch-default -Wundef -Wno-unused --no-exceptions --no-rtti --no-use-cxa-atexit -std=c++14 -O2 -Wall -fexceptions -Wsign-conversion
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
