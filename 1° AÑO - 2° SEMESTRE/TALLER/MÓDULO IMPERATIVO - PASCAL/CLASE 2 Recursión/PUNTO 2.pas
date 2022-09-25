program pr2p2;
procedure imprimir (n: integer);
var
	digito: integer;
begin
	if (n <> 0) then begin
		digito:= n MOD 10;
		n:= n DIV 10;
		imprimir(n);
		write(digito);
		write(' ');
	end;
end;

//----------------------------------------------------------------

procedure leer;
var
	num: integer;
begin
	writeln('Ingrese un numero: ');
	readln(num);
	while (num <> 0) do begin
		imprimir(num);
		writeln('');
		writeln('Ingrese un numero: ');
		readln(num);
	end;
end;

//----------------------------------------------------------------

BEGIN
	leer;
END.