program pr1p4;
type
	rango = 1..8;
	productos = record
		codigo: integer;
		rubro: rango;
		precio: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: productos;
		sig: lista;
	end;
	
	vectorl = array [rango] of lista;
	
	vector30 = array [1..30] of productos;
	
//----------------------------------------------------------------

procedure leerp (var p: productos);
begin
	writeln ('precio');
	read (p.precio);
	if (p.precio <> 0) then begin
		writeln ('codigo');
		read (p.codigo);
		writeln ('rubro');
	read (p.rubro);
	end;
end;

//----------------------------------------------------------------

procedure insertar (var vl: lista; p: productos);
var
	nuevo, ant, act: lista;
begin
	new (nuevo);
	nuevo^.dato:= p;
	ant:= vl;
	act:= vl;
	
    while (act <> nil) and (act^.dato.codigo < p.codigo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if act = ant then
		vl:= nuevo
	else
		ant^.sig:= nuevo;
	nuevo^.sig:= act;
end;

//----------------------------------------------------------------

procedure leer (var vl: vectorl);
var
	p: productos;
begin
	leerp (p);
	while p.precio <> 0 do begin 
		insertar (vl[p.rubro],p);
		leerp (p);
	end;
end;

//----------------------------------------------------------------

procedure verlista (vl:vectorl);
var
	i:integer;
begin
	for i:= 1 to 8 do
		while (vl[i] <> nil) do begin
			writeln(vl[i]^.dato.codigo,' ',vl[i]^.dato.rubro,' ',vl[i]^.dato.precio:2:2);
			vl[i]:=vl[i]^.sig;
		end;
end;

//----------------------------------------------------------------

procedure leer30 (vl: vectorl; var v30: vector30; var dl: integer);
begin
	dl:= 0;
	while (vl[3] <> nil) and (dl < 30) do begin
		dl:= dl +1;
		v30[dl]:=  vl[3]^.dato;
		vl[3]:= vl[3]^.sig;
	end;
end;

//----------------------------------------------------------------

procedure mostrar30 (v30: vector30; dl: integer);
var
	i: integer;
begin
	writeln('Productos del rubro 3: ');
	for i:= 1 to dl do begin
		writeln (v30[i].codigo);
		writeln (v30[i].rubro);
		writeln (v30[i].precio:1:1);
	end;
end;

//----------------------------------------------------------------

procedure ordenar30 (var v30: vector30; dl: integer);
var
	i, j: integer;
	aux: productos;
begin
	for i:= 1 to dl do begin
		for j:= i+1 to dl do begin
			if v30[j].precio < v30[i].precio then begin
				aux:= v30[i];
				v30[i]:= v30[j];
				v30[j]:= aux;
			end;
		end;
	end;
end;

//----------------------------------------------------------------

var
	vl: vectorl;
	v30: vector30;
	dl: integer;
begin
	leer (vl); {a}
	verlista (vl); {b}
	leer30 (vl, v30, dl); {c}
	ordenar30 (v30, dl); {d}
	mostrar30 (v30, dl); {e}
end.
