program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		elem: integer;
		sig: lista;
	end;

//----------------------------------------------------------------

procedure armarNodo(var pI, pU: lista; valor: integer);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.elem:= valor;
	nuevo^.sig:= nil;
	
	if (pI = nil) then begin
		pI:= nuevo;
		pU:= nuevo;
	end
	else begin
		pU^.sig:= nuevo;
		pU:= nuevo;
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

procedure incrementar (pI: lista; valor: integer);
begin
	while (pI <> nil) do begin
		pI^.elem:= pI^.elem + valor;
		pI:= pI^.sig;	
	end;
end;

//----------------------------------------------------------------

var
	pri, ult: lista;
	num: integer;
begin
	pri := nil;
	writeln('Ingrese un numero');
	read(num);
	while (num <> 0) do begin
		armarNodo(pri, ult, num);
		writeln('Ingrese un numero');
		read(num);
	end;
	
	writeln('');
	writeln('--------------LISTA--------------');
    recorrerLista(pri);
    
    writeln('');
	writeln('--------------INCREMENTAR--------------');
	writeln('Ingrese un numero para incrementar cada nodo: ');
	readln(num);
    incrementar(pri, num);
    
    writeln('');
	writeln('--------------LISTA--------------');
    recorrerLista(pri);
end.
