program untitled;
const
	cantDias = 7;
	valorGrande = 9999;
type
	rango = 1..cantDias;
	
	entrada = record
		dia: rango;
		codigo: integer;
		asiento: integer;
		monto: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: entrada;
		sig: lista;
	end;
	
	vector = array [rango] of lista;

	//----------------------------------------------------------------
	
	elemAcumulador = record    
		codigo: integer;
		cant: integer;
	end;
	
	listaAcumulador = ^nodoAcumulador;
	nodoAcumulador = record
		dato: elemAcumulador;
		sig: listaAcumulador;
	end;
//----------------------------------------------------------------

procedure GenerarVector (var v: vector);
	
	procedure leerEntrada (var r: entrada);
	begin
		writeln ('Ingrese Codigo de obra: ');
		{r.codigo:= random(valorGrande);
		writeln(r.codigo);}
		readln (r.codigo);
		If (r.codigo <> 0) then begin
			writeln ('Ingrese Dia: ');
			r.dia:= random(cantDias);
			writeln (r.dia);
			//readln (r.sucursal);
			writeln ('Ingrese Asiento: ');
			r.asiento:= random (30) + 1;
			writeln (r.asiento);
			writeln ('Ingrese Monto: ');
			r.monto:= random (50) + 1;
			writeln (r.monto:2:2);
		end;
	end;
	
	procedure inicializarVector(var v: vector);
	var
		i: rango;
	begin
		for i:= 1 to cantDias do
			v[i]:= nil;
	end;
  
	procedure insertar(var l: lista; r: entrada);
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

var
	r: entrada;
Begin
	inicializarVector(v);
	
	leerEntrada(r);
	while (r.codigo <> 0) do begin
	//ACA SERÍA r.sucursal <> 0
		insertar (v[r.dia], r);
		leerEntrada(r);
	end;
end;

//----------------------------------------------------------------

procedure imprimirVector {debug} (v: vector);
var
	i:integer;
begin
	for i:= 1 to cantDias do
		while (v[i] <> nil) do begin
			writeln('Codigo: ' ,v[i]^.dato.codigo,' - Dia: ',v[i]^.dato.dia,' - Asiento: ',v[i]^.dato.asiento, ' - Monto: ',v[i]^.dato.monto:2:2);
			writeln('');
			v[i]:= v[i]^.sig;
		end;
end;

//----------------------------------------------------------------	

Procedure minimo (var v: vector; var r: entrada);
var
	indiceMin, i:integer;
Begin
	r.codigo:= valorGrande;
	for i:= 1 to cantDias do begin
		if (v[i] <> nil) then
			if (v[i]^.dato.codigo <= r.codigo) then begin
				indiceMin:= i;
				r:= v[i]^.dato;
			end; 
	end;
	if (r.codigo <> valorGrande) then
		v[indiceMin]:= v[indiceMin]^.sig;
end;

//----------------------------------------------------------------	

procedure mergeAcumulador (v: vector; var l: listaAcumulador);

	procedure agregarAtras2 (var l, ult: listaAcumulador; e: elemAcumulador); 
	var 
		nuevo: listaAcumulador;
	begin 
		new (nuevo); nuevo^.dato:= e; nuevo^.sig := nil;
		if (l = nil) then
			l:= nuevo
		else
			ult^.sig := nuevo;
		ult := nuevo;
	end;

var
	r: entrada;
	ult: listaAcumulador;
	actual: elemAcumulador;
begin
	l:= nil;
	
	minimo (v, r);
	while (r.codigo <> valorGrande) do begin
		actual.codigo:= r.codigo;
		actual.cant:= 0;
		
		while (actual.codigo = r.codigo) do begin
			actual.cant:= actual.cant + 1;
			minimo (v, r);
		end;
		
		agregarAtras2 (l, ult, actual);
	end;
end;

//----------------------------------------------------------------	

procedure imprimirMergeAcumulador (l: listaAcumulador);

	procedure imprimirListaAcumulador (l: listaAcumulador);
	begin
		if (l <> nil) then begin
			writeln('      Codigo: ', l^.dato.codigo, '  Cantidad total vendida: ', l^.dato.cant);
			imprimirListaAcumulador (l^.sig);
		end;
	end;
  
begin
	writeln;
	writeln ('----- Estructura merge acumulador ----->');
	writeln;
	if (l = nil ) then
		writeln ('      Sin elementos')
	else
		imprimirListaAcumulador (l);
end;

//----------------------------------------------------------------	

//----------------------------------------------------------------

Var
	v: vector;
	l: listaAcumulador;
Begin
	Randomize();
	generarVector(v);
	imprimirVector(v);
	
	writeln('----------------------Estructura Merge Acumulador ----------------------');
	mergeAcumulador (v, l);
	imprimirMergeAcumulador(l);
End.
