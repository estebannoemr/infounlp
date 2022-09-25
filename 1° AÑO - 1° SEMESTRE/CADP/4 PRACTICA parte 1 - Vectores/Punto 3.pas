program nombre;
Const
	max = 6;
Type
	rango = 1..max;
	numeros = array[rango] of integer;

procedure cargar(var v:numeros; var dL: integer);
var
	n: integer;
begin
	dL:= 0;
	writeln('Ingrese un numero: ');
	readln(n);
	while (n <> 0) and (dL < max) do begin
		dL:= dL + 1;
		v[dL]:= n;
		if (dL < max) then begin
			writeln('Ingrese un numero: ');
			readln(n);
		end;
	end;
end;

procedure imprimir (v: numeros; dL : integer);
var
	i: rango;
begin
	writeln('');
	for i:= 1 to dL do begin
		writeln(v[i]);
	end;
end;

procedure reves (v: numeros; dL : integer);
var
	i: rango;
begin
	writeln('');
	for i:= dL downto 1 do begin
		writeln(v[i]);
	end;
end;


procedure mitad (v: numeros; dL : integer);
var
	i: rango;
	mit: integer;
begin
	writeln('');
	mit:= dL DIV 2;
	for i:= mit downto 1 do begin
		writeln(v[i]);
	end;
	writeln('');
	for i:= (mit+1) to dL do begin
		writeln(v[i]);
	end;
end;


procedure posic(v: numeros; px: integer; py: integer);
var
	i: rango;
begin
	writeln('');
	if (px < py) then begin
		for i:= px to py do begin
			writeln(v[i]);
		end;
	end
	else begin
		for i:= px downto py do
			writeln(v[i]);
	end;
end;


var
	v: numeros;
	dimLog, posx, posy: integer;
begin
	cargar(v, dimLog);
	
	writeln('');
	writeln('--------------RESULTADOS--------------');
	
	imprimir(v, dimLog);
	reves(v, dimLog);
	mitad(v, dimLog);
	
	posx:= 5;
	posy:= 2;
	
	posic(v, posx, posy);
	
	writeln('');
	writeln('La dimesion logica fue de: ',dimLog);
end.
