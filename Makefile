all: fb1-4 fb1-5 soundmeter
soundmeter: soundmeter.l
	flex soundmeter.l
	cc -o $@ lex.yy.c -lfl
	./soundmeter soundmeter.txt
fb1-4:
	flex fb1-4.l
	cc -o $@ lex.yy.c -lfl
fb1-5: fb1-5.l fb1-5.y
	bison -d fb1-5.y
	flex fb1-5.l
	cc -o $@ fb1-5.tab.c lex.yy.c -lfl
fb3-1: fb3-1.l fb3-1.y fb3-1.h
	bison -d fb3-1.y
	flex -o fb3-1.lex.c fb3-1.l
	cc -o $@ fb3-1.tab.c fb3-1.lex.c fb3-1.c
arr-ex1: arr-ex1.l arr-ex1.y
	bison -d arr-ex1.y
	flex -o arr-ex1.lex.c arr-ex1.l
	cc -o $@ arr-ex1.tab.c arr-ex1.lex.c -lfl
clean:
	rm fb1-5
