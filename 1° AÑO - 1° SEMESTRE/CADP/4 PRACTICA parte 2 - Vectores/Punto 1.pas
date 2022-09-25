program nombre;
Const
	max = 6;
Type
	rango = 1..max;
	numeros = array[rango] of integer;

//----------------------------------------------------------------

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

//----------------------------------------------------------------

function posicion (v: numeros; dL: integer; x: integer) : boolean;
var
	i: rango;
	pos: integer;
begin
	writeln('');
	pos:= -1;
	for i:= 1 to dL do begin
		if (v[i] = x) then
			pos:= i;
	end;
	if (pos <> -1) then
		posicion:= TRUE
	else
		posicion:= FALSE;
end;


var
	v: numeros;
	dimLog, numx: integer;
begin
	cargar(v, dimLog);
	
	writeln('');
	writeln('--------------RESULTADOS--------------');
	
	numx:= 3;
	writeln(posicion(v, dimLog, numx));
end.
