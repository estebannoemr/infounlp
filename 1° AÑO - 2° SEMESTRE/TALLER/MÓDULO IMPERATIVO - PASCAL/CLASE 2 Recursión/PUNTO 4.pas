program pr2p4;
const
	max = 25;
	tam = 5;
type
	rango = 1..tam;
	
	vector = array [rango] of integer;

//----------------------------------------------------------------

procedure cargarVector (var v: vector; i: integer);
begin
	if (i < tam) then begin
		i:= i + 1;
		v[i]:= random(max);
		cargarVector(v, i);
	end;
end;

//----------------------------------------------------------------

procedure leerVector(v:vector; i: integer);
begin
	if (i < tam) then begin
		i:= i + 1;
		writeln('Numero entero: ');
		writeln(v[i]);
		leerVector(v, i);
	end;
end;

//----------------------------------------------------------------

procedure valorMax (v: vector; var nmax: integer; i: integer);
begin
	if (i < tam) then begin
		i:= i + 1;
	
		if (v[i] > nmax) then
			nmax:= v[i];

		valorMax(v, nmax, i);		
	end;
end;

//----------------------------------------------------------------

function suma(v: vector; i: integer) : integer;
begin
	i:= i + 1;
	if (i = tam) then 
		suma:= v[i]
	else
		suma:= v[i]+ suma(v, i);
end;

//----------------------------------------------------------------

var
	v: vector;
	i, nummax: integer;
BEGIN
	nummax:= -1;
	i:= 0;
	
	cargarVector(v, i);
	
	leerVector(v, i);
	
	valorMax(v, nummax, i);
	
	writeln('El maximo valor del vector es: ',nummax);
	
	writeln('La suma de los valores contenidos en el vector es = a: ' ,suma(v, i));
END.


