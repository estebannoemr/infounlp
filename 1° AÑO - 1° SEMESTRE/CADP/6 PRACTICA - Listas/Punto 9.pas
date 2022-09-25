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

function estaOrdenada (L: lista) : boolean;
var
	max: integer;
begin
	estaOrdenada:= TRUE;
	max:= -1;
	
	while (L <> nil) and (estaOrdenada) do begin
		if (L^.elem > max) then begin
			max:= L^.elem;
			estaOrdenada:= TRUE;
		end
		else
			estaOrdenada:= FALSE;
		L:= L^.sig;
	end;
	
end;

//----------------------------------------------------------------

procedure eliminar (var pI: lista; num: integer);
var 
    actual, ant: lista;
begin
    actual:= pI;
	
	while (actual <> nil) do begin
		if (actual^.elem <> num) then begin
			ant:= actual;
			actual:= actual^.sig;
		end
		else begin
			if (actual <> nil) then begin
				if (actual = pI) then
					pI:= pI^.sig
				else
					ant^.sig:= actual^.sig;
			dispose (actual);
			actual:= ant;
			end;
		end;
	end;
end;

//----------------------------------------------------------------

procedure sublista(pI: lista; A, B : integer; var L: lista);  //inciso c
var
	aux, aux2: lista;
begin
	aux:= pI;
	while (aux <> nil) do begin
		
		if (aux^.elem > A) and (aux^.elem < B) then begin
			new(aux2);
			aux2^.elem := aux^.elem;
			aux2^.sig := L;
			L := aux2;
		end;
		aux:= aux^.sig;
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
	pri, subli: lista;
	num, numA, numB: integer;
begin
	pri := nil;
	subli:= nil;
	writeln('Ingrese un numero');
	read(num);
	
	while (num <> 0) do begin
		armarNodo(pri, num);
		writeln('Ingrese un numero');
		read(num);
	end;
	
	writeln('');
	if (estaOrdenada(pri)) then
		writeln('La lista esta ordenada')
	else
		writeln('La lista NO esta ordenada');
    
    
	writeln('');
	writeln('--------------LISTA--------------');
	recorrerLista(pri);
    
    writeln('');
	writeln('--------------ELIMINAR--------------');
	writeln('');
    writeln('Ingrese un numero a eliminar: ');
	readln(num);
    eliminar(pri, num);
    
    
    writeln('');
	writeln('--------------SUBLISTA--------------');
	writeln('');
    writeln('Ingrese el numero A: ');
	readln(numA);
	writeln('Ingrese el numero B: ');
	readln(numB);
    sublista(pri, numA, numB, subli);
    
    
    writeln('');
	writeln('--------------LISTA--------------');
    recorrerLista(pri);
    
    writeln('');
	writeln('--------------LISTA SUBLISTA--------------');
    recorrerLista(subli);
end.
