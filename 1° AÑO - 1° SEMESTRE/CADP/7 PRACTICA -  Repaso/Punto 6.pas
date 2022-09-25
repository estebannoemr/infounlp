program ejercicio2;
type
	rango = 1..7;
	
	objeto = record
		codigo: integer;
		categoria: rango;
		nombre: string;
		distancia: integer;
		descubridor: string;
		ano: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: objeto;
		sig: lista;
	end;
	
	vector = array [rango] of real;

//----------------------------------------------------------------

procedure leerObjeto(var o: objeto);
begin
	writeln('Ingrese el codigo del objeto: ');
	readln(o.codigo);
	if (o.codigo <> -1) then begin
		writeln('Ingrese la categoria del objeto: ');
		readln(o.categoria);
		writeln('Ingrese el nombre del objeto: ');
		readln(o.nombre);
		writeln('Ingrese su distancia a la Tierra: ');
		readln(o.distancia);
		writeln('Ingrese el nombre del descubridor: ');
		readln(o.descubridor);
		writeln('Ingrese el ano de su descubrimiento: ');
		readln(o.ano);
		writeln('');
	end;
end;

//----------------------------------------------------------------

procedure agregar(var l: lista; o: objeto);
var
	aux, nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= o;
	nuevo^.sig:= nil;
	
	if (l = nil) then
		l:= nuevo
	else begin
		aux:= l;
		while (aux^.sig <> nil) do
			aux:= aux^.sig;
		aux^.sig:= nuevo;
	end;
end;

//----------------------------------------------------------------

procedure generarLista(var l:lista);
var
	o: objeto;
begin
	leerObjeto(o);
	while (o.codigo <> -1) do begin
		agregar(l, o);
		leerObjeto(o);
	end;
end;


//----------------------------------------------------------------

procedure inicializarVector (var v: vector);
var 
    i:integer;
begin
    for i:= 1 to 7 do
    begin
        v[i]:= 0;
    end;
end;

//----------------------------------------------------------------

procedure maximos (distancia, codigo:integer; var max1, max2, maxCod1, maxCod2:integer);
begin
	if(distancia > max1) then begin
		max2:= max1;
		maxCod2:= maxCod1;
		max1:= distancia;
		maxCod1:= codigo;
	end
	else if (distancia > max2) then begin
		max2:= distancia;
		maxCod2:= codigo;
	end;
end;

//----------------------------------------------------------------

function cumple (o : objeto): boolean;
begin
	cumple:= (o.categoria = 2) and (o.descubridor = 'Galileo Galilei') and (o.ano < 1600);
end;

//----------------------------------------------------------------

procedure recorrerArray (v: vector);
var
	i: integer;
begin
	for i:= 1 to 7 do begin
		writeln('La cantidad de objetos de la categoría ',i,' son: ',v[i]);
	end;	
end;

//----------------------------------------------------------------

function cumplePar (num:integer) : boolean;
var
	digito, pares, impares:integer;
begin
	pares:=0;
	impares:=0;
	while (num <> 0)do begin
		digito:= num MOD 10;
		if (digito MOD 2 = 0) then
			pares:=pares + 1
		else
			impares:=impares+1;
		num:=num DIV 10;
	end;
	cumplePar:= (pares > impares);
end;

//----------------------------------------------------------------

procedure recorrido (l: lista);
var
	aux: lista;
	v: vector;
	tipo: rango;
	max1, max2, maxCod1, maxCod2, cantGalileo: integer;
begin
	aux:= l;
	max1:= -1;
	maxCod1:= -1;
	cantGalileo:= 0;
	
	inicializarVector(v);
	
	while (aux <> nil) do begin
		
		maximos(aux^.dato.distancia, aux^.dato.codigo, max1, max2, maxCod1, maxCod2); //INCISO A
		
		if (cumple(aux^.dato)) then
			cantGalileo:= cantGalileo + 1;  //INCISO B
			
		tipo:= aux^.dato.categoria;
		v[tipo]:= v[tipo] + 1;  //INCISO C
		
		if (aux^.dato.categoria = 2) then
			if (cumplePar(aux^.dato.codigo)) then
				writeln('La estrella ', aux^.dato.nombre, ' cumple con la condicion en su numero de codigo');
		
		writeln('Codigo del objeto: ',aux^.dato.codigo);
		writeln('Categoria del objeto: ',aux^.dato.categoria);
		writeln('Nombre del objeto: ',aux^.dato.nombre);
		writeln('Distancia a la Tierra: ',aux^.dato.distancia);
		writeln('Nombre del descubridor: ',aux^.dato.descubridor);
		writeln('Ano de su descubrimiento: ',aux^.dato.ano);
		writeln('');
		
		
		aux:= aux^.sig;
	end;
	
	writeln('El codigo del objeto mas alejado de la Tierra es: ',maxCod1);
	writeln('El codigo del SEGUNDO objeto mas alejado de la Tierra es: ',maxCod2);
	recorrerArray(v);
end;

//----------------------------------------------------------------

procedure imprimir(l:lista);
begin
	while (l <> nil) do begin
		writeln('Codigo del objeto: ');
		writeln(l^.dato.codigo);
		writeln('Categoria del objeto: ');
		writeln(l^.dato.categoria);
		writeln('Nombre del objeto: ');
		writeln(l^.dato.nombre);
		writeln('Distancia a la Tierra: ');
		writeln(l^.dato.distancia);
		writeln('Nombre del descubridor: ');
		writeln(l^.dato.descubridor);
		writeln('Ano de su descubrimiento: ');
		writeln(l^.dato.ano);
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
