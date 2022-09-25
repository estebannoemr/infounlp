program ejercicio2;
type
	viaje = record
		codigo: integer;
		numero: integer;
		origen: string;
		destino: string;
		kilometros: real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: viaje;
		sig: lista;
	end;

//----------------------------------------------------------------

procedure leerViaje(var r: viaje);
begin
	writeln('Ingrese el codigo de auto: ');
	readln(r.codigo);
	if (r.codigo <> -1) then begin
		writeln('Ingrese el numero de viaje: ');
		readln(r.numero);
		writeln('Ingrese el origen: ');
		readln(r.origen);
		writeln('Ingrese el destino: ');
		readln(r.destino);
		writeln('Ingrese la cantidad de kilometros recorridos: ');
		readln(r.kilometros);
	end;
end;

//----------------------------------------------------------------

procedure insertar(var L: lista; r: viaje);
var
    nuevo, actual, ant: lista;
begin
    new(nuevo);
	nuevo^.dato:= r;
	nuevo^.sig:= nil;
	
	actual := L;
	ant := L;
    
    if (L = nil) then
		L:= nuevo
	else begin
		actual := L;
		ant := L;
		while (actual <> nil) and (actual^.dato.codigo < nuevo^.dato.codigo) do begin
			ant:= actual;
			actual:= actual^.sig;
		end;
	
		if (actual = L) then begin
			nuevo^.sig:= L;
			L:= nuevo;
		end
		else begin
			ant^.sig:=nuevo;
			nuevo^.sig:= actual;
		end;
	end;
end;

//----------------------------------------------------------------

procedure generarLista(var l:lista);
var
	r: viaje;
begin
	leerViaje(r);
	while (r.codigo <> -1) do begin
		insertar(l, r);
		writeln('');
		leerViaje(r);
	end;
end;

//----------------------------------------------------------------

procedure dosMax (distancia: real; codigo: integer; var max1, max2 : real; var maxCod1, maxCod2:integer);
begin
	if (distancia > max1) then begin
		max2:= max1;
		maxCod2:= maxCod1;
		max1:= distancia;
		maxCod1:= codigo;
	end
	else if (distancia > max2)then begin
		max2:= distancia;
		maxCod2:= codigo;  
	end;
end;

//----------------------------------------------------------------

procedure recorrido (l: lista);
var
	aux: lista;
	codeactual, maxC1, maxC2: integer;
	km, dmax1, dmax2: real;
begin
	aux:= l;
	maxC1:= -1;
	dmax1:= -1;
	
	while (aux <> nil) do begin
		codeactual:= aux^.dato.codigo;
		km:= 0;
		while (aux <> nil) and (codeactual = aux^.dato.codigo) do begin
			km:= km + aux^.dato.kilometros;
			
			aux:= aux^.sig;
		end;
		
		dosMax(km, codeactual, dmax1, dmax2, maxC1, maxC2);
	end;
	
	writeln('El auto con codigo ' ,maxC1, ' fue el que mas kilometros recorrio');
	writeln('El auto con codigo ' ,maxC2, ' fue el SEGUNDO que mas kilometros recorrio');
end;

//----------------------------------------------------------------

procedure imprimir(l:lista);
begin
	while (l <> nil) do begin
		writeln('Codigo de auto: ', l^.dato.codigo);
		writeln('Numero de viaje: ', l^.dato.numero);
		writeln('Origen: ',l^.dato.origen);
		writeln('Destino: ',l^.dato.destino);
		writeln('Kilometros recorridos: ',l^.dato.kilometros:2:2);
		writeln('');
		l:= l^.sig;
	end;
end;

//----------------------------------------------------------------

var
	l:lista;
begin
	l:= nil;
	generarLista(l);
	
	writeln('');
	recorrido(l);
	
	//writeln('');
	//writeln('--------------LISTA--------------');
	//imprimir(l);
end.
