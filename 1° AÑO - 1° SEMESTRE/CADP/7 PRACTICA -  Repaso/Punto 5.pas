program untitled;
type
	rango = 1..100;
	
	camion = record
		patente: string;
		anof: integer;
		capacidad: integer;
	end;
	
	viaje = record
		codigo: integer;
		codcam: rango;
		distancia: real;
		destino: string;
		ano: integer;
		dni: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: viaje;
		sig: lista;
	end;
	
	vector = array [rango] of camion;

//----------------------------------------------------------------

procedure leerViaje (var r: viaje);
begin
	writeln('Ingrese codigo de viaje: ');
	readln(r.codigo);
	if (r.codigo <> -1) then begin
		writeln('Ingrese codigo de camion: ');
		readln(r.codcam);
		writeln('Ingrese distancia recorrida: ');
		readln(r.distancia);
		writeln('Ingrese ciudad de destino: ');
		readln(r.destino);
		writeln('Ingrese ano del viaje: ');
		readln(r.ano);
		writeln('Ingrese DNI del chofer: ');
		readln(r.dni);
	end;
end;

//----------------------------------------------------------------

procedure agregar(var l: lista; r: viaje);
var
	aux, nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= r;
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

procedure generarLista (var l: lista);
var
	r: viaje;
begin
	leerViaje(r);
	while (r.codigo <> -1) do begin
		agregar(l, r);
		leerViaje(r);
	end;
end;

//----------------------------------------------------------------

procedure dosMyM (v: vector; var codmax1, codmax2: integer);
var
    i, vmax1, vmax2:integer;
begin
	vmax1:= -1;
	vmax2:= -1;
	
	for i:=1 to 100 do begin
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
	pat1: string;
begin
	
	while (l <> nil) do begin
		
		if ();
	
		l:= l^.sig;
	end;
	
end;


//----------------------------------------------------------------

procedure cargarCamion (var v: vector);
var
	i: integer;
begin
	for i:= 1 to 100 do begin
		v[i].patente:= 'E';
		v[i].anof:= i;
		v[i].capacidad:= i;
	end;
end;

//----------------------------------------------------------------

procedure imprimir (l: lista);
begin
	while (l <> nil) do begin
		writeln('Codigo de viaje: ', l^.dato.codigo);
		writeln('Codigo de camion: ', l^.dato.codcam);
		writeln('Distancia recorrida: ', l^.dato.distancia:2:2);
		writeln('Destino: ',l^.dato.destino);
		writeln('Ano del viaje: ',l^.dato.ano);
		writeln('DNI del chofer: ',l^.dato.dni);
		writeln('');
		
		l:= l^.sig;
	end;
end;

//----------------------------------------------------------------
var
	l: lista;
	//v: vector;
	//i: integer;
BEGIN
	l:= nil;   //   IMPORTANTE
	
	generarLista(l);
	
	imprimir(l);
	
	{for i:= 1 to 100 do begin
		writeln(v[i].patente);
		writeln(v[i].anof);
		writeln(v[i].capacidad);
		writeln('');
	end;}
	
END.

