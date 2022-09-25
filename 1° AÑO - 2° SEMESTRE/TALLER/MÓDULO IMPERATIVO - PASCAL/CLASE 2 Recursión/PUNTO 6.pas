program pr2p6;

procedure binario(num: integer);
var
	dig: integer;
begin
	dig:= num;
	num:= num DIV 2;
	
	if (dig <> 0) then begin
		binario(num);
		
		write(dig MOD 2);
		
		{if (dig MOD 2 = 0) then
			write('0')
		else 
			write('1');}
	end;
end;

procedure procesar;
var
	n: integer;
begin
	writeln('Ingrese un numero: ');
	readln(n);
	while (n <> 0) do begin
		binario(n);
		writeln('');
		writeln('Ingrese otro numero: ');
		readln(n);
	end;
end;

//var
BEGIN
	procesar;
END.

