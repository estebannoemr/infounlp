program ejercicio2;
type
	lista = ^nodo;
	
	persona = record
		dni: integer;
		nombre: string;
		apellido: string;
	end;
	
	nodo = record
		dato: persona;
		sig: lista;
	end;

//----------------------------------------------------------------

procedure leerPersona(var p: persona);
begin
	writeln('Ingrese el DNI: ');
	readln(p.dni);
	if (p.dni <> 0)then begin
		writeln('Ingrese el nombre: ');
		readln(p.nombre);
		writeln('Ingrese el apellido: ');
		readln(p.apellido);
	end;
end;

//----------------------------------------------------------------

procedure agregarAdelante(var l: lista; p: persona);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= p;
	nuevo^.sig:= l;
	
	if (l = nil) then
		l:= nuevo
	else begin
		nuevo^.sig:= l;
		l:= nuevo;
	end;
end;

//----------------------------------------------------------------

procedure generarLista(var l:lista);
var
	p: persona;
begin
	leerPersona(p);
	while (p.dni <> 0) do begin
		agregarAdelante(l, p);
		leerPersona(p);
	end;
end;

//----------------------------------------------------------------

procedure imprimirInformacion(var l:lista);
begin
	while (l <> nil) do begin
		writeln('DNI: ', l^.dato.dni, ' - Nombre: ',l^.dato.nombre, ' - Apellido: ', l^.dato.apellido);
		writeln('');
		l:= l^.sig;
	end;
end;

//----------------------------------------------------------------

var
	l:lista;
begin
	generarLista(l);
	writeln('');
	imprimirInformacion(l);
end.
