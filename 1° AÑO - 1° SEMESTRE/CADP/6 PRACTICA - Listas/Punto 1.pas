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
	aux: lista;
begin
	new(aux);
	aux^.elem := valor;
	aux^.sig := L;
	L := aux;
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
    
    writeln('');
	writeln('--------------INCREMENTAR--------------');
	writeln('Ingrese un numero para incrementar cada nodo: ');
	readln(num);
    incrementar(pri, num);
    
    writeln('');
	writeln('--------------LISTA--------------');
    recorrerLista(pri);
end.


{
a- AGREGA un nodo ADELANTE.

b- 48 13 21 10


}
