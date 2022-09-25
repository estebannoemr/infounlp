program ejercicio2;
type
	cat = 1..7;
	
	lista = ^nodo;
	
	sonda = record
		nombre: string;
		meses: integer;
		costo: real;
		mant: real;
		rango: cat;
	end;
	
	nodo = record
		dato: sonda;
		sig: lista;
	end;

//----------------------------------------------------------------

procedure leerSonda(var s: sonda);
begin
	writeln('Ingrese el NOMBRE de la sonda: ');
	readln(s.nombre);
	writeln('Ingrese la duracion estimada de la mision: ');
	readln(s.meses);
	writeln('Ingrese el costo de construccion: ');
	readln(s.costo);
	writeln('Ingrese el costo de mantenimiento mensual: ');
	readln(s.mant);
	writeln('Ingrese el rango del espectro electromagnetico: ');
	readln(s.rango);
end;

//----------------------------------------------------------------

procedure agregar(var l: lista; s: sonda);
var
	aux, nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= s;
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
	s: sonda;
begin
	repeat
		leerSonda(s);
		agregar(l, s);
	until (s.nombre = 'GAIA');
end;


//----------------------------------------------------------------

procedure recorrido (l: lista; var prd: real; var prc: real);
var
	aux: lista;
	max: real;
	nommax: string;
	total: integer;
begin
	aux:= l;
	max:= -1;
	nommax:= '';
	prd:= 0;
	total:= 0;
	prc:= 0;
	
	while (aux <> nil) do begin
		if ((aux^.dato.costo + aux^.dato.mant) > max) then begin
			max:= (aux^.dato.costo + aux^.dato.mant);
			nommax:= aux^.dato.nombre;
		end;
		
		prc:= prc + aux^.dato.costo;
		
		prd:= prd + aux^.dato.meses;
		
		total:= total + 1;
		
		aux:= aux^.sig;
	end;
	
	prd:= prd / total;
	writeln('El promedio de duracion de todas las sondas es: ',prd:2:2);
	
	writeln('');
	
	prc:= prc / total;
	writeln('El promedio de costo de todas las sondas es: ',prc:2:2);
	
	writeln('');
	
	writeln('El nombre de la sonda mas costosa es: ',nommax);
end;

//----------------------------------------------------------------

procedure incisos (l: lista; prd: real; prc: real);
var
	aux: lista;
	cantdur: integer;
begin
	aux:= l;
	cantdur:=0;
		
	while (aux <> nil) do begin	
		if (aux^.dato.meses > prd) then
			cantdur:= cantdur + 1;
		
		if (aux^.dato.costo > prc) then begin
			writeln('Sonda cuyo costo de construccion supera el costo promedio entre todas las sondas: ',aux^.dato.nombre);
			writeln('');
		end;
		
		aux:= aux^.sig;
	end;
	
	writeln('Cantidad de sondas cuya duracion supera la duracion promedio de todas las sondas: ',cantdur);
end;

//----------------------------------------------------------------

procedure imprimirInformacion(var l:lista);
begin
	while (l <> nil) do begin
		writeln('');
		writeln('Nombre de la sonda: ',l^.dato.nombre);
		writeln('');
		writeln('Duracion estimada de la mision: ',l^.dato.meses);
		writeln('');
		writeln('Costo de construccion: ',l^.dato.costo:2:2);
		writeln('');
		writeln('Costo de mantenimiento mensual: ',l^.dato.mant:2:2);
		writeln('');
		writeln('Rango del espectro electromagnetico: ',l^.dato.rango);
		writeln('');
		
		l:= l^.sig;
	end;
end;

//----------------------------------------------------------------

var
	l:lista;
	prmdur, prcst: real;
begin
	generarLista(l);
	writeln('');
	
	writeln('--------------RECORRIDO--------------');
	writeln('');
	recorrido(l, prmdur, prcst);
	
	writeln('');
	
	writeln('--------------INCISOS--------------');
	writeln('');
	incisos(l, prmdur, prcst);
	
	writeln('');
	writeln('--------------LISTA--------------');
	imprimirInformacion(l);
end.
