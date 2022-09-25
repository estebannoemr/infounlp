program nombre;
Const
	max = 300;
Type
	rango = 1..max;
	st = string[20];
	
	oficina = record
		codigo: integer;
		dni: integer;
		valor: real;
	end;
	
	vector = array[rango] of oficina;

//----------------------------------------------------------------

procedure leer(var o: oficina);
begin
	writeln('Ingrese codigo de identificacion: ');
	readln(o.codigo);
	if (o.codigo <> -1) then begin
		writeln('Ingrese DNI del propietario: ');
		readln(o.dni);
		writeln('Ingrese valor de la expensa: ');
		readln(o.valor);
	end;
end;

//----------------------------------------------------------------


procedure cargar(var v: vector; var dL: integer);
var
	o: oficina;
begin
	dL:= 0;
	leer(o);
	while (dL < max) and (o.codigo <> -1) do begin
		dL:= dL + 1;
		v[dL]:= o;
		if (dL < max) then
			leer(o);
	end;
end;


//-----------------------------------------------------------------

procedure leerVector(v:vector; dL: integer);
var
	i: rango;
begin
	for i:= 1 to dL do begin
		writeln('Codigo de identificacion: ');
		writeln(v[i].codigo);
		writeln('DNI del propietario: ');
		writeln(v[i].dni);
		writeln('Valor de la expensa: ');
		writeln(v[i].valor:2:2);
		writeln('');
	end;
end;


//------------------------------------------------------------------

{procedure OrdenarInsercion (var v: vector; dimLog: rango);
var
	i, j: rango;
	actual: oficina;
	//codactual: integer;
begin
	for i:= 2 to dimLog do begin 
		actual:= v[i];
		j:= i-1; 
		while (j > 0) and (v[j].codigo > actual.codigo) do begin
			v[j+1]:= v[j];
			j:= j - 1;                  
		end;  
		v[j+1]:= actual; 
	end;
end;}

//------------------------------------------------------------------

procedure OrdenarSeleccion (var v: vector; dimLog: rango);
var
	i, j, p: rango;
	item : oficina;	
begin
	for i:=1 to dimLog-1 do begin {busca el mínimo y guarda en p la posición}
		p := i;
		for j := i+1 to dimLog do
			if v[ j ].codigo < v[ p ].codigo then
				p:=j;

		{intercambia v[i] y v[p]}
		item := v[ p ];   
		v[ p ] := v[ i ];   
		v[ i ] := item;
	end;
end;

//------------------------------------------------------------------

var
	v: vector;
	dimLog: integer;
begin
	cargar(v, dimLog);
	writeln('');
	writeln('--------------VECTOR--------------');
	leerVector(v, dimLog);
	
	OrdenarSeleccion(v,dimLog);
	writeln('--------------VECTOR ORDENADO--------------');
	leerVector(v, dimLog);
end.
