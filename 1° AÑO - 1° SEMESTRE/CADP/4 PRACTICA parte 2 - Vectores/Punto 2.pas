program nombre;
Const
	max = 6;
Type
	rango = 1..max;
	alum = string[20];
	alumnos = array[rango] of alum;

//----------------------------------------------------------------


procedure cargar(var v:alumnos; var dL: integer);
var
	n: alum;
begin
	dL:= 0;
	writeln('Ingrese el nombre: ');
	readln(n);
	while (n <> 'ZZZ' ) and (dL < max) do begin
		dL:= dL + 1;
		v[dL]:= n;
		if (dL < max) then begin
			writeln('Ingrese el nombre: ');
			readln(n);
		end;
	end;
end;


//------------------------------------------------------------------


procedure leer (v: alumnos; dL: integer);
var
	i: rango;
begin
	writeln('');
	for i:= 1 to dL do
		writeln(v[i]);
end;


//-----------------------------------------------------------------

procedure ocurrencia (var v:alumnos; var dL:integer; var pude: boolean; x: alum);
var
	i: rango;
	pos: integer;
begin
    pude:= false;
    
    for i:= 1 to dL do begin
    	if (v[i] = x) then
			pos:= i;
	end;
    
    
    if ((pos >= 1) and (pos <= dL))then begin 
        for i:= pos to (dL - 1) do
            v[i]:= v[i+1];
        pude:= true;
        dL:= dL - 1;
    end;
end;


//------------------------------------------------------------------


procedure insertar (var v:alumnos; var dL:integer; var pude:boolean; valor:alum);
var
    i, pos: integer;
begin
    pos:= 4;
    pude:= false;
    if ((dL + 1) <= max) and (pos >= 1) and (pos <= dL)then begin
        for i:= dL downto pos do
            v[i+1]:= v[i];
		pude:= true;
		v[pos]:= valor;
		dL:= dL + 1;
    end;
end;


//------------------------------------------------------------------


procedure agregar (var v: alumnos; var dL: integer; var pude: boolean; valor: alum);
begin
	pude:= false;
	if ((dl + 1) <= max) then begin
		pude:= true;
		dL:= dL + 1;
		v[dL]:= valor;
	end; 
end;

//------------------------------------------------------------------


var
	v: alumnos;
	dimLog: integer;
	nom, valor, agreg: alum;
	pudo: boolean;
begin
	cargar(v, dimLog);
	writeln('');
	writeln('--------------VECTOR--------------');
	leer(v, dimLog);
	
	writeln('');
	writeln('--------------RESULTADOS--------------');
	
	writeln('Ingrese el alumno a eliminar: ');
	readln(nom);
	ocurrencia(v, dimLog, pudo, nom);
	
	writeln('');
	writeln('Vector con alumno ' ,nom, ' eliminado:');
	leer(v, dimLog);
	
	writeln('');
	writeln('Ingrese el alumno a insertar en la posicion 4: ');
	readln(valor);
	insertar (v, dimLog, pudo, valor);
	leer(v, dimLog);
	
	writeln('');
	writeln('Ingrese el alumno a agregar: ');
	readln(agreg);
	agregar (v, dimLog, pudo, agreg);
	leer(v, dimLog);
end.
