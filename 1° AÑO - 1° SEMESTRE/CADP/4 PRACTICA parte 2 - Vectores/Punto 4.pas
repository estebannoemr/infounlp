program nombre;
Const
	max = 4;
Type
	rango = 1..max;
	st = string[20];
	alumno = record
		numero: integer;
		nombre: st;
		asistencias: integer;
	end;
	vector = array[rango] of alumno;

//----------------------------------------------------------------

procedure leer(var v: alumno);
begin
	with v do begin
		writeln('Ingrese numero de alumno: ');
		readln(numero);
		if (numero <> 0) then begin
			writeln('Ingrese nombre y apellido: ');
			readln(nombre);
			writeln('Ingrese cantidad de asistencias a clase: ');
			readln(asistencias);
			writeln('');
		end;
	end;
end;

//----------------------------------------------------------------


procedure cargar(var v:vector; var dL: integer);
var
	i: alumno;
begin
	dL:= 0;
	leer(i);
	while (dL < max) and (i.numero <> 0) do begin
		dL:= dL + 1;
		v[dL]:= i;
		if (dL < max) then
			leer(i);
	end;
end;


//-----------------------------------------------------------------

procedure leerVector(v:vector; dL: integer);
var
	i: rango;
begin
	for i:= 1 to dL do begin
		writeln('');
		if (v[1].numero <> 0) then begin
			writeln('Numero de alumno: ');
			writeln(v[i].numero);
			writeln('Nombre y apellido: ');
			writeln(v[i].nombre);
			writeln('Cantidad de asistencias a clase: ');
			writeln(v[i].asistencias);
		end
		else
			writeln('No hay vectores');
	end;
end;


//------------------------------------------------------------------


function buscar(v:vector; dL: integer; num: integer): integer;
var
	pri, medio, ult, pos: integer;
begin
	pri:=1;
	ult:= dL;
	medio:= (pri + ult) DIV 2;
    
	while (pri <= ult) and (num <> v[medio].numero) do begin
		if (num < v[medio].numero)then
			ult:= medio-1
		else
			pri:= medio+1;
		medio:= (pri+ult) DIV 2;
	end;
	
	if (pri <= ult) and (num = v[medio].numero) then
		pos:= medio
    else
        pos:=-1;
    buscar:= pos;
end;


//------------------------------------------------------------------

procedure insertar (var v:vector; var dL:integer; al:alumno);
var
    i, k, pos: integer;
begin
	k:= 1;
	while (al.numero > v[k].numero) do
		k:= k + 1;
	pos:= k;
	
	if ((dL + 1) <= max) and (pos>= 1) and (pos <= dL)then begin
        for i:= dL downto pos do
            v[i+1]:= v[i];
		v[pos]:= al;
		dL:= dL + 1;
    end;
end;

//------------------------------------------------------------------


var
	v: vector;
	dimLog, nro, pos: integer;
	a: alumno;
begin
	cargar(v, dimLog);
	writeln('');
	writeln('--------------VECTOR--------------');
	leerVector(v, dimLog);
	
	writeln('');
	writeln('--------------MODULO A--------------');
	
	writeln('Ingrese el numero de alumno a buscar: ');
	readln(nro);
	pos:= buscar(v, dimLog, nro);
	writeln('');
	if (pos <> -1) then
		writeln('El alumno con el numero ',nro,' se encuentra en la posicion: ',pos)
	else
		writeln('El alumno con el numero ',nro,' NO se encuentra en la lista');
	
	writeln('');
	writeln('--------------MODULO B--------------');
	writeln('Ingrese el alumno a insertar: ');
	leer(a);
	
	insertar (v, dimLog, a);
	writeln('--------------VECTOR--------------');
	leerVector(v, dimLog);
	
end.
