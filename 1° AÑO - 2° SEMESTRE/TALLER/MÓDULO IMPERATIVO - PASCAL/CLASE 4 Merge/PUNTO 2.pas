program tre;
const
	max = 8;
	valorGrande = 9999;
type
	rango = 1..max;
	
	pelicula = record
		codigo: integer;
		genero: rango;
		puntaje: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	vListas = array [rango] of lista;
	
	listaOrdenada = ^nodoOrdenado;
	nodoOrdenado = record
		dato: pelicula;
		sig: listaOrdenada;
	end;
	
//----------------------------------------------------------------
	
procedure leer {a}(var r: pelicula);
begin
	writeln ('Codigo: ');
	readln (r.codigo);
	if  (r.codigo <> -1) then begin
		writeln ('Genero: ');
		readln (r.genero);
		writeln ('Puntaje: ');
		readln (r.puntaje);
	end;
end;

//----------------------------------------------------------------

procedure insertar (var l: lista; r: pelicula);
	var
		nuevo: lista;
		ant, actual: lista;
	begin
		new(nuevo);
		nuevo^.dato:= r;
		nuevo^.sig:= nil;

		actual:= l;
		ant:= l;

		while (actual <> nil) and (actual^.dato.codigo < r.codigo) do begin
			ant:= actual;
			actual:= actual^.sig;
		end;

		if (actual = ant) then
			l:= nuevo
		else
			ant^.sig:= nuevo;
		nuevo^.sig:= actual;
	end;

//----------------------------------------------------------------

procedure inicializarVector(var v: vListas);
var
	i: rango;
begin
	for i:= 1 to max do
		v[i]:= nil;
end;

//----------------------------------------------------------------

procedure generarLista {a} (var vL: vListas);
var
	p: pelicula;
begin
	inicializarVector(vL);
	leer (p);
	while (p.codigo <> -1) do begin
		insertar (vL[p.genero], p);
		writeln('');
		leer (p);
	end;
end;

//----------------------------------------------------------------

procedure imprimirLista {debug} (vL: vListas);
var
	i:integer;
begin
	for i:= 1 to 8 do
		while (vL[i] <> nil) do begin
			writeln('Codigo: ' ,vL[i]^.dato.codigo,' - Puntaje: ',vL[i]^.dato.puntaje:2:2,' - Genero: ',vL[i]^.dato.genero);
			writeln('');
			vL[i]:= vL[i]^.sig;
		end;
end;


//----------------------------------------------------------------

Procedure minimo (var v: vListas; var p: pelicula);
var
	indiceMin, i:integer;
Begin
	p.codigo:= valorGrande;
	for i:= 1 to max do begin
		if (v[i] <> nil) then
			if (v[i]^.dato.codigo <= p.codigo) then begin
				indiceMin:= i;
				p:= v[i]^.dato;
			end; 
	end;
	if (p.codigo <> valorGrande) then
		v[indiceMin]:= v[indiceMin]^.sig;
end;

//----------------------------------------------------------------

procedure Merge (vL: vListas; var l: listaOrdenada);
   
	procedure AgregarAtras (var l, ult: listaOrdenada; p: pelicula); 
	var 
		nuevo: listaOrdenada;
	begin 
		new (nuevo); nuevo^.dato:= p; nuevo^.sig := nil;
	if (l = nil) then
		l:= nuevo
	else
		ult^.sig := nuevo;
	ult := nuevo;
	end;


var
	p: pelicula;
	ult: listaOrdenada;
begin
	l:= nil;
	minimo (vL, p);
	while (p.codigo <> valorGrande) do begin
		agregarAtras(l, ult, p);
		minimo (vL, p);
	end;
end;  

//----------------------------------------------------------------

procedure imprimirListaOrdenada(lOrd: listaOrdenada);
begin
	if (lOrd <> nil) then begin
		writeln('Codigo: ',lOrd^.dato.codigo);
		writeln ('Genero: ',lOrd^.dato.genero);
		writeln ('Puntaje: ',lOrd^.dato.puntaje:2:2);
		writeln('');
		lOrd:= lOrd^.sig;
		imprimirListaOrdenada(lOrd);
	end;
end;

//----------------------------------------------------------------

procedure imprimirEstructuraMerge (lOrd: listaOrdenada);
begin
	writeln;
	writeln ('----- Estructura merge ----->');
	writeln;
	if (lOrd = nil ) then
		writeln ('      Sin elementos')
	else
		imprimirListaOrdenada (lOrd);
end;

//----------------------------------------------------------------

var
	vL: vListas;
	lOrd: listaOrdenada;
begin
	generarLista (vL);
	writeln('');
	imprimirLista(vL);
	writeln('');
	Merge(vL, lOrd);
	writeln('----------------------Estructura Merge ----------------------');
	imprimirEstructuraMerge(lOrd);
end.
