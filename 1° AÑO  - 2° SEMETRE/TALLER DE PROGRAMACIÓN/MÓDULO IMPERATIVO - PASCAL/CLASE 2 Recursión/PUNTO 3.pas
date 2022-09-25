program pr2p3;
const
	max = 10;
type
	
	lista = ^nodo;
	
	nodo = record
		dato: integer;
		sig: lista;
	end;

//----------------------------------------------------------------

procedure agregar (var l: lista; num: integer);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= num;
	nuevo^.sig:= l;
	l:= nuevo;
end;

//----------------------------------------------------------------

procedure generarLista(var l:lista);
var
	n: integer;
begin
	writeln('Ingrese un numero entero: ');
	n:= random(max);
	writeln(n);
	
	if (n <> 0) then begin
		agregar(l, n);
		generarLista(l);
	end;
	
	{while (n <> 0) do begin
		agregar(l, n);
		writeln('Ingrese un numero entero: ');
		readln(n);
	end;}
end;

//----------------------------------------------------------------

procedure valores(l: lista; var nmax, nmin: integer);
begin
	if (l <> nil) then begin
		if (l^.dato > nmax) then
			nmax:= l^.dato;
			
		if (l^.dato < nmin) then
			nmin:= l^.dato;
		
		l:= l^.sig;
		
		valores(l, nmax, nmin);
	end;
	
	{while (l <> nil) do begin
		if (l^.dato > nmax) then
			nmax:= l^.dato;
			
		if (l^.dato < nmin) then
			nmin:= l^.dato;
		
		l:= l^.sig;
	end;}
end;

//----------------------------------------------------------------

procedure buscar (l: lista; num: integer; var ok: boolean);
begin
	if (l <> nil) and (l^.dato <> num) then begin
		l:=l^.sig;
		buscar(l, num, ok);
	end;
	
	if (l <> nil) and (l^.dato = num)then begin		
		ok:=true;
	end;
	
	
	{if (l <> nil) and (ok = false) then begin
		if (l^.dato = num) then
			ok:= true;
		if (ok = false) then begin
			l:= l^.sig;
			buscar(l, num, ok);
		end;
	end;}
	
end;

//----------------------------------------------------------------

procedure imprimir(l:lista);
begin
	while (l <> nil) do begin
		writeln('Numero entero: ',l^.dato);
		writeln('');
		
		l:= l^.sig;
	end;
end;

//----------------------------------------------------------------

var
	l: lista;
	nummax, nummin, num: integer;
	encontre: boolean;
BEGIN
	Randomize();
	l:= NIL;
	generarLista(l);
	
	imprimir(l);
	
	nummax:= -1;
	nummin:= 101;
	
	valores(l, nummax, nummin);
	writeln('El minimo valor de la lista es: ',nummin);
	writeln('El maximo valor de la lista es: ',nummax);
	
	writeln('Ingrese un numero a buscar: ');
	readln(num);
	
	encontre:= false;
	
	buscar(l, num, encontre);
	
	if (encontre) then
		writeln('Se encontro el valor')
	else
		writeln('No se encontro el valor');
	
END.

