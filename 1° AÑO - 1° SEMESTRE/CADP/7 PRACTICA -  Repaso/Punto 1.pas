program ejercicio2;
type
	genero = 1..5;
	
	persona = record
		dni: integer;
		nombre: string;
		edad: integer;
		codigo: genero;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: persona;
		sig: lista;
	end;
	
	vector = array [genero] of integer;

//----------------------------------------------------------------

procedure leerPersona(var p: persona);
begin
	writeln('Ingrese el DNI: ');
	readln(p.dni);
	writeln('Ingrese el nombre: ');
	readln(p.nombre);
	writeln('Ingrese la edad: ');
	readln(p.edad);
	writeln('Ingrese el codigo: ');
	readln(p.codigo);
end;

//----------------------------------------------------------------

procedure agregar(var pI: lista; p: persona);
var
	aux, nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= p;
	nuevo^.sig:= nil;
	
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

procedure generarLista(var l:lista);
var
	p: persona;
begin
	repeat
		leerPersona(p);
		agregar(l, p);
	until (p.dni = 0);  //porque 333444555 no entra en el rango de enteros
end;

//----------------------------------------------------------------

function digitos (num: integer): boolean;
var
	dig, par, impar: integer;
begin
	par:= 0;
	impar:= 0;
	digitos:= FALSE;
	
	while (num <> 0) do begin
        dig:= num mod 10;
        if ((dig mod 2) = 0) then begin
			par:= par + 1;
			num:= num DIV 10;
		end 
		else begin
			impar:= impar + 1;
			num:= num DIV 10;
		end;
	end;
	
	if (par > impar) then
		digitos:= TRUE
end;

//----------------------------------------------------------------

procedure inicializarVector (var v: vector);
var 
    i:integer;
begin
    for i:= 1 to 5 do
    begin
        v[i]:= 0;
    end;
end;

//----------------------------------------------------------------

procedure dosMax (v: vector; var codmax1, codmax2: genero);
var
    i, vmax1, vmax2:integer;
begin
	vmax1:= -1;
	vmax2:= -1;
	
	for i:=1 to 5 do begin
		if (v[i] > vmax1) then begin
			vmax2:= vmax1;
			codmax2:= codmax1;
			vmax1:= v[i];
			codmax1:= i;
		end
		else if (v[i] > vmax2)then begin
			vmax2:= v[i];
			codmax2:= i;  
		end;
    end;
end;

//----------------------------------------------------------------

procedure recorrido (l: lista);
var
	aux: lista;
	cant: integer;
	cmax1, cmax2, tipo: genero;
	v: vector;
begin
	aux:= l;
	cant:= 0;
	
	inicializarVector(v);
	
	while (aux <> nil) do begin
		if (digitos (aux^.dato.dni)) then begin
			writeln('El DNI de la persona con DNI ',aux^.dato.dni, ' tiene mas digitos pares que impares');
			writeln('');
			cant:= cant + 1;
		end;
		
		tipo:= aux^.dato.codigo;
		
		v[tipo]:= v[tipo] + 1;
		
		//writeln('El codigo ',tipo, ' tiene: ',v[tipo]);
		
		aux:= aux^.sig;
		
		dosMax(v, cmax1, cmax2);
	end;
	
	writeln('Cantidad de personas cuyo DNi contiene mas digitos pares que impares: ',cant);
	writeln('');
	writeln('El codigo mas elegido es: ',cmax1);
	writeln('');
	writeln('El segundo codigo mas elegido es: ',cmax2);
end;

//----------------------------------------------------------------

procedure eliminar (var l: lista; dni: integer);
var 
    actual, ant: lista;
begin
    actual:= l;
	
	while (actual <> nil) and (actual^.dato.dni <> dni) do begin
		ant:= actual;
		actual:= actual^.sig;
	end;
	
	if (actual <> nil) then begin
		if (actual = l) then begin  //primero de la lista
			l:= l^.sig;
			dispose(actual);
		end
		else begin
			ant^.sig:= actual^.sig;
			dispose(actual);
		end;
	end;
	
end;

//----------------------------------------------------------------

procedure imprimir(l:lista);
begin
	while (l <> nil) do begin
		writeln('DNI: ', l^.dato.dni);
		writeln('Nombre: ',l^.dato.nombre);
		writeln('Edad: ',l^.dato.edad);
		writeln('Codigo: ',l^.dato.codigo);
		writeln('');
		l:= l^.sig;
	end;
end;

//----------------------------------------------------------------

var
	l:lista;
	num: integer;
begin
	generarLista(l);
	
	writeln('');
	recorrido(l);
	
	writeln('');
	writeln('--------------LISTA--------------');
	imprimir(l);
	
	writeln('');
	writeln('--------------ELIMINAR--------------');
	writeln('');
    writeln('Ingrese el DNI a eliminar: ');
	readln(num);
    eliminar(l, num);
    
    writeln('');
	writeln('--------------LISTA--------------');
    imprimir(l);
end.
