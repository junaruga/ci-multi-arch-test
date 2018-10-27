all :
	gcc -o bin/arch-test src/main.c
.PHONY : all

clean :
	rm -rf src/*.o bin/arch-test
.PHONY : clean
