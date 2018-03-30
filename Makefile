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
clean:
	rm fb1-5
