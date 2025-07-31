input = input.txt
output = output.txt

main: for.l for.y
	bison -d for.y 
	flex for.l 
	gcc for.tab.c lex.yy.c 
	./a.exe  <$(input)> $(output)
	

