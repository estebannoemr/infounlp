program untitled;
const
	dimF = 12;
	valorGrande = 9999;
type
	rango = 1..diMF;
	
	prestamo = record
		isbn: integer;
		numero: integer;
		dia: integer;
		mes: rango;
		cant: integer;
	end;
	
	//----------------------------------------------------------------
	
	prestamoAGuardar = record  //NO CONTIENE EL MES
		isbn: integer;
		numero: integer;
		dia: integer;
		cant: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: prestamoAGuardar;
		sig: lista;
	end;
	
	vector = array [rango] of lista;
	
	//----------------------------------------------------------------
	
	elemAcumulador = record    
		ISBN: integer;
		cantPrestamos: integer;
	end;
	
	listaAcumulador = ^nodoAcumulador;
	nodoAcumulador = record
		dato: elemAcumulador;
		sig: listaAcumulador;
	end;

//----------------------------------------------------------------

procedure GenerarVector (var v: vector);

	{Procedure LeerPrestamo (var p: prestamo);
	begin
		write ('Ingrese ISBN: ');
		readln (p.isbn);
		If (p.isbn <> -1) then begin
			write ('Ingrese numero del socio: ');
			readln (p.numero);
			write ('Ingrese dia del prestamo: ');
			readln (p.dia);
			write ('Ingrese mes del prestamo: ');
			readln (p.mes);
			write ('Ingrese cantidad de dias prestados: ');
			readln (p.cant);
		end;
		writeln('');
	end;  }
	
	procedure LeerPrestamo (var p: prestamo);
	begin
		writeln ('Ingrese ISBN: ');
		readln (p.ISBN);
		If (p.ISBN <> -1) then begin
			writeln ('Ingrese numero de socio: ');
			p.numero:= Random (100) + 100;
			writeln (p.numero);
			writeln ('Ingrese dia: ');
			p.dia:= Random (30) + 1;
			writeln (p.dia);
			writeln ('Ingrese mes: ');
			readln (p.mes);
			writeln ('Ingrese cantidad: ');
			p.cant:= Random (14) + 1;
			writeln (p.cant);
		end;
	end;
	
	procedure inicializarVector(var v: vector);
	var
		i: rango;
	begin
		for i:= 1 to 12 do
			v[i]:= nil;
	end;
  
	procedure insertar(var l: lista; r: prestamoAGuardar);
	var
		nuevo: lista;
		ant, actual: lista;
	begin
		new(nuevo);
		nuevo^.dato:= r;
		nuevo^.sig:= nil;

		actual:= l;
		ant:= l;

		while (actual <> nil) and (actual^.dato.isbn < r.isbn) do begin
			ant:= actual;
			actual:= actual^.sig;
		end;

		if (actual = ant) then
			l:= nuevo
		else
			ant^.sig:= nuevo;
		nuevo^.sig:= actual;
	end;
	
	procedure ArmarPrestamoAguardar (p: prestamo; var pG: prestamoAGuardar);
	begin
		pG.ISBN:= p.ISBN;
		pG.numero:= p.numero;
		pG.dia:= p.dia;
		pG.cant:= p.cant;
	end;

var
	p: prestamo;
	pG: prestamoAGuardar;
Begin
	inicializarVector(v);
	
	LeerPrestamo (p);
	//writeln('ERROR?');
	while (p.isbn <> -1) do begin
		ArmarPrestamoAguardar(p, pG);
		insertar (v[p.mes], pG);
		LeerPrestamo(p);
	end;
end;

//----------------------------------------------------------------	

procedure imprimirLista(l: lista);
begin
	if (l <> nil) then begin
		writeln('ISBN: ',l^.dato.isbn);
		writeln ('Numero del socio: ',l^.dato.isbn);
		writeln('');
		l:= l^.sig;
		imprimirLista(l);
	end;
end;

//----------------------------------------------------------------

procedure imprimirVector (v: vector);
var
	i: integer;
begin
	writeln;
	writeln ('----- Vector de listas ----->');
	writeln;
	for i:= 1 to dimF do begin
		if (v[i] = nil) then
			writeln('Sin elementos')
		else
			imprimirLista(v[i]);
	end;
end;

//----------------------------------------------------------------

Procedure minimo (var v: vector; var prestamoMin: prestamoAGuardar);
var
	indiceMin,i:integer;
Begin
	prestamoMin.ISBN:= valorGrande;
	for i:= 1 to dimF do begin
		if (v[i] <> nil) then
			if (v[i]^.dato.ISBN <= prestamoMin.ISBN) then begin
				indiceMin:= i;
				prestamoMin:= v[i]^.dato;
			end; 
	end;
	if (prestamoMin.ISBN <> valorGrande) then
		v[indiceMin]:= v[indiceMin]^.sig;
end;
   
procedure Merge (v: vector; var l: lista);
   
	procedure AgregarAtras (var l, ult: lista; p: prestamoAGuardar); 
	var 
		nuevo: lista;
	begin 
		new (nuevo); nuevo^.dato:= p; nuevo^.sig := nil;
	if (l = nil) then
		l:= nuevo
	else
		ult^.sig := nuevo;
	ult := nuevo;
	end;


var
	prestamoMin: prestamoAGuardar;
	ult: lista;
begin
	l:= nil;
	minimo (v, prestamoMin);
	while (prestamoMin.ISBN <> valorGrande) do begin
		agregarAtras(l, ult, prestamoMin);
		minimo (v, prestamoMin);
	end;
end;  

//----------------------------------------------------------------	

procedure imprimirEstructuraMerge (l: lista);
begin
	writeln;
	writeln ('----- Estructura merge ----->');
	writeln;
	if (l = nil ) then
		writeln ('      Sin elementos')
	else
		imprimirLista (l);
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
	prestamoMin: prestamoAGuardar;
	ult: listaAcumulador;
	actual: elemAcumulador;
begin
	l:= nil;
	minimo (v, prestamoMin);
	
	while (prestamoMin.ISBN <> valorGrande) do begin
		actual.ISBN:= prestamoMin.ISBN;
		actual.cantPrestamos:= 0;
		
		while (actual.ISBN = prestamoMin.ISBN) do begin
			actual.cantPrestamos:= actual.cantPrestamos + 1;
			minimo (v, prestamoMin);
		end;
		
		agregarAtras2 (l, ult, actual);
	end;
end;

//----------------------------------------------------------------	

procedure imprimirMergeAcumulador (l: listaAcumulador);

	procedure imprimirListaAcumulador (l: listaAcumulador);
	begin
		if (l <> nil) then begin
			writeln('      ISBN: ', l^.dato.ISBN, '  Cantidad prestamos: ', l^.dato.cantPrestamos);
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

{procedure imprimirLista(l: lista);
begin
	while (l <> nil) do begin
		writeln('ISBN: ',l^.dato.isbn);
		writeln ('Numero del socio: ',l^.dato.isbn);
		writeln ('Dia del prestamo: ',l^.dato.dia);
		writeln ('Mes del prestamo: ',l^.dato.mes);
		writeln ('Cantidad de dias prestados: ',l^.dato.cant);
		writeln('');
		l:= l^.sig;
	end;
end;

//----------------------------------------------------------------

procedure imprimirVector (v: vector);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		if (v[i] = nil) then
			writeln('Sin elementos')
		else
			imprimirLb(v[i]);
	end;
end;}

//----------------------------------------------------------------	

var
	v: vector;
	l: lista;
	lAc: listaAcumulador;
BEGIN
	Randomize; //IMPORTANTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
	
	GenerarVector(v);
	
	//imprimirVector(v);
	
	//writeln('MODULO B');
	imprimirVector(v);
	writeln();
	//writeln('MODULO C');
	merge(v, l);
	
	imprimirEstructuraMerge(l);
	
	mergeAcumulador (v, lAc);
	
	imprimirMergeAcumulador(lAc);
END.

