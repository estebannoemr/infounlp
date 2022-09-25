Program pr3p3;
const
	max = 9;
type
	rango = 2010..2018;
	
	st20 = string[20];
	
	auto = record
		patente: integer;
		ano: rango;
		marca: st20;
		modelo: st20;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato: auto;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: auto;
		sig: lista;
	end; 
	
	vListas = array [rango] of lista;
	
//----------------------------------------------------------------

procedure GenerarArbol (var a: arbol);
		
	Procedure LeerAuto (var a: auto);
	begin
		write ('Ingrese patente: ');
		readln (a.patente);
		if (a.patente <> -1) then begin
			write ('Ingrese anio de fabricacion: ');
			a.ano:= random(8) + 2010;
			writeln(a.ano);
			write ('Ingrese marca: ');
			//a.marca:= 'Marca';
			//writeln(a.marca);
			readln (a.marca);
			write ('Ingrese modelo: ');
			a.modelo:= 'A';
			writeln (a.modelo);
			writeln('');
		end;
	end;
  
	Procedure crear (var a: arbol; x: auto);
	Begin
	if (a = nil) then begin
		new(a);
		a^.dato:= x; 
		a^.HI:= nil; 
		a^.HD:= nil;
	end
    else if (x.patente < a^.dato.patente) then
		crear(a^.HI, x)
		else
			crear(a^.HD, x); 
	End;
	
var
	x: auto;
Begin
	LeerAuto (x);
	while (x.patente <> -1) do begin
		crear (a, x);
		LeerAuto (x);
	end;
end;

//----------------------------------------------------------------

procedure imprimirArbol (a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol (a^.HI);
		write ('Patente: ');
		writeln (a^.dato.patente);
		write ('Anio de fabricacion: ');
		writeln(a^.dato.ano);
		write ('Marca: ');
		writeln (a^.dato.marca);
		write ('Modelo: ');
		writeln (a^.dato.modelo);
		writeln('');
		imprimirArbol (a^.HD);
	end;
end;

//----------------------------------------------------------------

procedure moduloB (a: arbol; var cant: integer);

	procedure total (a: arbol; m: st20; var c: integer);
	begin
		if (a <> nil) then begin
			total (a^.HI, m, c);
			if (a^.dato.marca = m) then
				c:= c + 1;
			total (a^.HD, m, c);
		end;
		
		{if (a^.dato.marca = m) then
			total:= 1 + total(a^.HI, m) + total(a^.HD, m)}
	end;
	
	
var
	m: st20;
begin
	writeln('Ingrese una marca para conocer la cantidad de autos con la misma: ');
	readln(m);
	
	cant:= 0;
	total(a, m, cant);
	
	writeln('El codigo ',m, ' tiene ',cant, ' unidades vendidas');	
	writeln('');
end;

//----------------------------------------------------------------

procedure insertar (var l: lista; r: auto);
var
		nuevo: lista;
		ant, actual: lista;
begin
	new(nuevo);
	nuevo^.dato:= r;
	nuevo^.sig:= nil;
	
	actual:= l;
	ant:= l;

	while (actual <> nil) and (actual^.dato.patente < r.patente) do begin
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

procedure convertir (a: arbol; var v: vListas);
begin
	
	if (a <> nil) then begin
		convertir(a^.HI, v);
		insertar(v[a^.dato.ano], a^.dato);
		convertir(a^.HD, v);
	end;
	
	{if (a <> nil) then begin
		merge(a^.HI, vL);
		agregarAtras(l, ult, a^.dato);
		merge(a^.HD, vL);
	end;}
end;

//----------------------------------------------------------------	

procedure inicializarVector(var v: vListas);
var
	i: integer;
begin
	for i:= 2010 to 2018 do
		v[i]:= nil;
end;

//----------------------------------------------------------------

procedure imprimirLista (l: lista);
begin
	while (l <> nil) do begin
		writeln('Patente: ' ,l^.dato.patente,' - Anio de fabricacion: ',l^.dato.ano,' - Marca: ',l^.dato.marca, ' - Modelo: ',l^.dato.modelo);
		l:= l^.sig;
	end;
end;

//-----------------------------------------------------------------

procedure imprimirVector {debug} (v: vListas);
var
	i:integer;
begin
	for i:= 2010 to 2018 do begin
		writeln('Anio: ',i);
		writeln('---------------------');
		
		if (v[i] = nil) then
			writeln('Anio sin autos')
		else
			imprimirLista(v[i]);
		writeln('');
	end;
	writeln('');
end;

//----------------------------------------------------------------

procedure moduloD (a: arbol);
       
	function buscar (a: arbol; num: integer): integer;
	begin
		if (a = nil) then
			Buscar:= -1
		else If (a^.dato.patente = num) then
			Buscar:= a^.dato.ano
			else if (num < a^.dato.patente) then
				Buscar:= Buscar (a^.HI, num)
				else
					Buscar:= Buscar (a^.HD, num)
	end;
  
var
	numABuscar, anio: integer;
begin
	write ('Ingrese numero de patente a buscar: ');
	Readln (numABuscar);
	
	anio:= Buscar (a, numABuscar);
	
	if (anio <> -1) then
		writeln ('La patente ', numABuscar, ' se fabrico en el anio: ',anio)
	else
		writeln ('La patente ', numABuscar, ' NO existe');
	writeln('');
end;

//----------------------------------------------------------------
  
var
	a: arbol;
	cant: integer;
	vL: vListas;
Begin
	Randomize();
	a:= nil;
	
	GenerarArbol (a);
	
	imprimirArbol(a);
	
	writeln('');
	
	moduloB(a, cant);
	writeln('');
	
	inicializarVector(vL);
	convertir(a, vL);
	writeln('');
	
	imprimirVector(vL);
	
	writeln('');
	moduloD(a);
End.
