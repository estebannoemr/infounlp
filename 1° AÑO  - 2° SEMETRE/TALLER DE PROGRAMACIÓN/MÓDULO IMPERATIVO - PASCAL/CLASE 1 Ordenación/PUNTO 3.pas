program tre;
type
	rango = 1..8;
	peli = record
		codigo: integer;
		genero: rango;
		puntaje: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: peli;
		sig: lista;
	end;
	
	vListas = array [rango] of lista;

	vector = array [rango] of peli; {guardar puntaje!}

//----------------------------------------------------------------
	
procedure leer {a}(var d: peli);
begin
	writeln ('Codigo: ');
	readln (d.codigo);
	if  (d.codigo <> -1) then begin
		writeln ('Genero: ');
		readln (d.genero);
		writeln ('Puntaje: ');
		readln (d.puntaje);
	end;
end;

//----------------------------------------------------------------

procedure agregarA {a} (var l: lista; var u:lista; d: peli);
var
	nuevo: lista;
begin
	new (nuevo);
	nuevo^.dato:= d;
	nuevo^.sig:=nil;
	if (l = nil) then
		l:=nuevo
	else
		u^.sig:=nuevo;
	u:=nuevo;
end;

//----------------------------------------------------------------

procedure armar {a} (var vL: vListas);
var
	p: peli;
	vU:vListas;
begin
	leer (p);
	while (p.codigo <> -1) do begin
		agregarA (vL[p.genero],vU[p.genero], p);
		writeln('');
		leer (p);
	end;
end;

//----------------------------------------------------------------

procedure inicializar {b} (var v: vector);
var
	i: integer;
begin
	for i:= 1 to 8 do begin
		v[i].codigo:= 0;
		v[i].genero:= 1;
		v[i].puntaje:= -999;
	end;
end;

//----------------------------------------------------------------

procedure maximo {b} (var p:peli; pAct:peli);
begin
	if (pAct.puntaje > p.puntaje) then begin
		p.puntaje:= pAct.puntaje;
		p.codigo:= pAct.codigo;
		p.genero:= pAct.genero;
	end;
end;

//----------------------------------------------------------------

procedure generarV {b} (vL: vListas; var v:vector);
var
	i:integer;
begin
	for i:= 1 to 8 do
		while (vL[i]<> nil) do begin
			maximo(vL[i]^.dato, v[i]);
			vL[i]:= vL[i]^.sig;
		end;
end;

//----------------------------------------------------------------

procedure verLista {debug} (vL:vListas);
var
	i:integer;
begin
	for i:= 1 to 8 do
		while (vL[i] <> nil) do begin
			writeln(vL[i]^.dato.codigo,' ',vL[i]^.dato.puntaje,' ',vL[i]^.dato.genero);
			vL[i]:= vL[i]^.sig;
		end;
end;

//----------------------------------------------------------------

procedure ordenar {c} (var v:vector);
var
	i, j, p:integer; item:peli;
begin
	for i:=1 to 7 do begin
		p:=i;
		for j:= i+1 to 8 do	
			if (v[j].puntaje < v[p].puntaje) then p:=j;
		item:=v[i];
		v[i]:=v[p];
		v[p]:=item;
	end;
end;

//----------------------------------------------------------------

var
	vL: vListas;
	v:vector;
begin
	armar (vL);
	verLista(vL);
	inicializar(v);
	generarV(vL, v);
	writeln(v[1].codigo, v[8].codigo);
end.
