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


function posicion (v: numeros; x: integer) : integer;
var
	i: rango;
begin
	writeln('');
	posicion:= -1;
	for i:= 1 to max do begin
		if (v[i] = x) then
			posicion:= i;
	end;
end;


procedure intercambio (var v: numeros; x, y, dL: rango);
var
	i, pox, py: rango;
	nx, ny: integer;
begin
	writeln('');
	for i:= 1 to max do begin
		if (i = x) then begin
			pox:= i;
			nx:= v[i];
		end;
		if (i = y) then begin
			py:= i;
			ny:= v[i];
		end;
	end;
	
	writeln('El numero ',nx, ' se encuentra en la pos: ',pox);
	writeln('El numero ',ny, ' se encuentra en la pos: ',py);
	
	for i:= 1 to max do begin
		if (i = pox) then begin
			v[i]:= ny;
			writeln('El numero ',ny, ' ahora se encuentra en la pos: ',i);
		end;
		if (i = py) then begin
			v[i]:= nx;
			writeln('El numero ',nx, ' ahora se encuentra en la pos: ',i);
		end;
	end;
end;


function sumaVector (v: numeros) : integer;
var
	i: rango;
begin
	writeln('');
	sumaVector:= 0;
	for i:= 1 to max do
		sumaVector:= sumaVector + v[i];
end;


function promedio (sum: integer) : real;
begin
	promedio:= sum / max;
end;


function elementoMaximo(v: numeros; var nmax : integer) : integer;
var
	i: rango;
	maxi: integer;
begin
	writeln('');
	maxi:= -9999;
	for i:= 1 to max do
		if (v[i] > maxi) then begin
			maxi:= v[i];
			elementoMaximo:= i;
		end;
	nmax:= maxi;
end;

function elementoMinimo(v: numeros; var nmin : integer) : integer;
var
	i: rango;
	min: integer;
begin
	writeln('');
	min:= 9999;
	for i:= 1 to max do
		if (v[i] < min) then begin
			min:= v[i];
			elementoMinimo:= i;
		end;
	nmin:= min;
end;

var
	v: numeros;
	dimLog, numx, numax, numin: integer;
	posmax, posmin: rango;
begin
	cargar(v, dimLog);
	
	writeln('');
	writeln('--------------RESULTADOS--------------');
	
	numx:= 3;
	writeln(posicion(v, numx));
	
	
	writeln(sumaVector(v));
	writeln(promedio(sumaVector(v)):2:2);
	
	posmax:= elementoMaximo(v, numax);
	posmin:= elementoMinimo(v, numin);
	
	writeln(posmax);
	writeln(posmin);
	
	
	intercambio(v, posmax, posmin, dimLog);
	writeln('El elemento maximo ' ,numax, ' que se encontraba en la posicion ',posmax, ' fue intercambiado con el elemento minimo ' ,numin, ' que se encontraba en la posicion ' ,posmin);
end.
