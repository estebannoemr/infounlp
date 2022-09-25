program ejercicio2;
type
	rango = 1..6;
	
	persona = record
		codigo: integer;
		dni: integer;
		nombre: string;
		poliza: rango;
		monto: real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: persona;
		sig: lista;
	end;
	
	tablaprecios = array [rango] of real;

//----------------------------------------------------------------

procedure leerPersona(var p: persona);
begin
	writeln('Ingrese el codigo de cliente: ');
	readln(p.codigo);
	writeln('Ingrese el DNI: ');
	readln(p.dni);
	writeln('Ingrese el nombre: ');
	readln(p.nombre);
	writeln('Ingrese el codigo de poliza: ');
	readln(p.poliza);
	writeln('Ingrese el monto basico que abona mensualmente: ');
	readln(p.monto);
	writeln('');
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
	until (p.codigo = 1122);  //porque 333444555 no entra en el rango de enteros
end;


//----------------------------------------------------------------

procedure cargartabla (var v: tablaprecios); //se dispone
begin
	v[1]:= 100;
	v[2]:= 50;
	v[3]:= 75;
	v[4]:= 200.5;
	v[5]:= 900;
	v[6]:= 1200;
end;

//----------------------------------------------------------------

function cumpleDigitos (num:integer) : boolean;
var
	digito, cant:integer;
begin
	cant:= 0;
	while (num <> 0)do begin
		digito:= num MOD 10;
		if (digito MOD 9 = 0) then
			cant:= cant + 1;
		num:= num DIV 10;
	end;
	cumpleDigitos:= (cant >= 2);
end;

//----------------------------------------------------------------

procedure recorrido (l: lista);
var
	aux: lista;
	v: tablaprecios;
	tipo: rango;
	montocompleto: real;
begin
	aux:= l;
	
	cargartabla(v);
	
	while (aux <> nil) do begin
		tipo:= aux^.dato.poliza;
		
		montocompleto:= aux^.dato.monto + v[tipo];
		
		writeln('DNI: ',aux^.dato.dni);
		writeln('Nombre: ',aux^.dato.nombre);
		writeln('Monto mensual: ',montocompleto:2:2);
		
		
		if (cumpleDigitos(aux^.dato.dni)) then
			writeln('El cliente ',aux^.dato.nombre, ' contiene al menos 2 digitos 9 en su DNI, que es: ',aux^.dato.dni);
		
		writeln('');
		
		aux:= aux^.sig;
	end;
end;

//----------------------------------------------------------------

procedure eliminar (var l: lista; num: integer);
var 
    actual, ant: lista;
begin
    actual:= l;
	
	while (actual <> nil) and (actual^.dato.codigo <> num) do begin
		ant:= actual;
		actual:= actual^.sig;
	end;
	
	if (actual <> nil) then begin
		if (actual = l) then begin
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
		writeln('Codigo de cliente: ', l^.dato.codigo);
		writeln('DNI: ', l^.dato.dni);
		writeln('Nombre: ',l^.dato.nombre);
		writeln('Codigo de poliza: ',l^.dato.poliza);
		writeln('Monto basico mensual: ',l^.dato.monto:2:2);
		writeln('');
		l:= l^.sig;
	end;
end;

//----------------------------------------------------------------

var
	l:lista;
	code: integer;
begin
	l:= nil;
	generarLista(l);
	
	writeln('');
	recorrido(l);
	
	writeln('--------------ELIMINAR--------------');
	writeln('Ingrese un codigo de cliente para eliminarlo de la lista: ');  //fijarse que pide CODIGO no DNI
	readln(code);
	eliminar(l, code);
	
	writeln('');
	writeln('--------------LISTA--------------');
	imprimir(l);
end.
