program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		elem: integer;
		sig: lista;
	end;

//----------------------------------------------------------------

procedure armarNodo(var L: lista; valor: integer);
var
    nuevo, actual, ant: lista;
begin
    new(nuevo);
	nuevo^.elem:= valor;
	nuevo^.sig:= nil;
	
	actual := L;
	ant := L;
    
    if (L = nil) then
		L:= nuevo
	else begin
		actual := L;
		ant := L;
		while (actual <> nil) and (actual^.elem < nuevo^.elem) do begin
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
end.
