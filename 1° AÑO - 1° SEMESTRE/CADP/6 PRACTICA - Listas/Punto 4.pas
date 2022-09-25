program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		elem: integer;
		sig: lista;
	end;

//----------------------------------------------------------------

procedure armarNodo(var pI: lista; valor: integer);
var
	aux, nuevo: lista;
begin
	new(nuevo);
	nuevo^.elem := valor;
	nuevo^.sig := nil;
	
	if (pI = nil) then
		pI:= nuevo
	else begin
		aux:= pI;
		while (aux^.sig <> nil) do
			aux:= aux^.sig;
		aux^.sig:= nuevo;
	end;
end;

//----------------------------------------------------------------

procedure recorrerLista(pI: lista);  //inciso c
var
	aux: lista;
begin
	aux:= pI;
	while (aux <> nil) do begin
		writeln(aux^.elem);
		writeln('');
		aux:= aux^.sig;
	end;
end;

//----------------------------------------------------------------

function maximo (pI: lista) : integer;
var
	aux: lista;
begin
	aux:= pI;
	maximo:= -1;
	while (aux <> nil) do begin
		if (aux^.elem > maximo) then
			maximo:= aux^.elem;
		aux:= aux^.sig;
	end;
end;

//----------------------------------------------------------------

function minimo (pI: lista) : integer;
var
	aux: lista;
begin
	aux:= pI;
	minimo:= 9999;
	while (aux <> nil) do begin
		if (aux^.elem < minimo) then
			minimo:= aux^.elem;
		aux:= aux^.sig;
	end;
end;

//----------------------------------------------------------------

function multiplo (pI: lista; valor: integer) : integer;
begin
	multiplo:= 0;
	while (pI <> nil) do begin
		if (pI^.elem MOD valor = 0) then
			multiplo:= multiplo + 1;
		pI:= pI^.sig;	
	end;
end;

//----------------------------------------------------------------

var
	pri: lista;
	num: integer;
begin
	pri := nil;
	writeln('Ingrese un numero');
	read(num);
	while (num <> 0) do begin
		armarNodo(pri, num);
		writeln('Ingrese un numero');
		read(num);
	end;
	
	
	writeln('');
	writeln('--------------LISTA--------------');
    recorrerLista(pri);
    
    writeln('El valor maximo ingresado fue: ',maximo(pri));
    writeln('');
    writeln('El valor minimo ingresado fue: ',minimo(pri));
    
    writeln('');
    writeln('Ingrese un numero para comprobar si el elemento de cada nodo es multiplo: ');
    readln(num);
    writeln('');
    writeln ('Cantidad de elementos de la lista que son multiplos de ',num, ' son: ',multiplo(pri, num));
    
end.
