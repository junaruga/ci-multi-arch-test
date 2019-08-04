TARGET = bin/hello

all :
	gcc -o $(TARGET) src/main.c
.PHONY : all

clean :
	rm -rf src/*.o $(TARGET)
.PHONY : clean

test : all
	file $(TARGET)
	$(TARGET)
.PHONY : test
