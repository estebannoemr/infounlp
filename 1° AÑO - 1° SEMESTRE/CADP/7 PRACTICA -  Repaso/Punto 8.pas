program ejercicio2;
type
	motivos = 1..7;
	
	fechaP = record
		dia: integer;
		mes: integer;
	end;
	
	transferencia = record
		origen: integer;
		DNIo: integer;
		destino: integer;
		DNId: integer;
		fecha: fechaP;
		hora: integer;
		monto: real;
		motivo: motivos;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: transferencia;
		sig: lista;
	end;
	
	vector = array [motivos] of integer;

//----------------------------------------------------------------

procedure leerTransferencia(var r: transferencia); //se dispone
begin

end;

//----------------------------------------------------------------

procedure agregar(var l: lista; r: transferencia);  //se dispone
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

procedure generarLista(var l:lista);  //se dispone
begin

end;

//----------------------------------------------------------------


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

procedure insertarordenado(var l: lista; r: transferencia);
var
    nuevo: lista;
    ant, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= r;
    nuevo^.sig:= nil;

    actual:= l;
    ant:= l;

    while (actual <> nil) and (actual^.dato.origen < r.origen) do begin
        ant:= actual;
        actual:= actual^.sig;
    end;

    if (actual = ant) then
        l:= nuevo
    else
        ant^.sig:= nuevo;
    nuevo^.sig:= actual;
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
	
	if (par < impar) then
		digitos:= TRUE
end;

//----------------------------------------------------------------

procedure recorrido (l: lista; var l2: lista);
begin
	while (l <> nil) do begin
		
		if (l^.dato.DNIo <> l^.dato.DNId) then
			insertarordenado(l2, l^.dato);
		
		l:= l^.sig;
	end;
end;

//----------------------------------------------------------------

procedure masTrf (v: vector; var cod: motivos);
var
	i, cmax: integer;
begin
	cmax:= -1;
	for i:= 1 to 7 do begin
		if (v[i] > cmax) then begin
			cmax:= v[i];
			cod:= i;
		end;
	end;
end;

//----------------------------------------------------------------

procedure recorridoListaNueva (l: lista);
var
	cuentaAct, cantIncisoD: integer;
	montoTotal: real;
	v: vector;
	tipo, cmax: motivos;
begin
	inicializarVector(v);
	cantIncisoD:= 0;
	
	while (l <> nil) do begin
		cuentaAct:= l^.dato.origen;
		montoTotal:= 0;
		
		while (l^.dato.origen = cuentaAct) do begin
			if (l^.dato.DNIo <> l^.dato.DNId) then begin
				montoTotal:= montoTotal + l^.dato.monto;
				
				tipo:= l^.dato.motivo;
			
				v[tipo]:= v[tipo] + 1;
				
				if (l^.dato.fecha.mes = 6) and (digitos(l^.dato.destino)) then
					cantIncisoD:= cantIncisoD + 1;
			end;
			
			
			masTrf (v, cmax);
			
			l:= l^.sig;
		end;
		
		writeln('La cuenta ',cuentaAct,' transfirio un total de: ',montoTotal);
		
		writeln('Codigo de motivo que mas TRF a terceros tuvo: ',cmax);
		
		writeln('Cantidad de transferencias que cumplen el Inciso D: ',cantIncisoD);
		
	end;
	
end;

//----------------------------------------------------------------

{procedure imprimir(l:lista);
begin
	while (l <> nil) do begin
		writeln('DNI: ', l^.dato.dni);
		writeln('Nombre: ',l^.dato.nombre);
		writeln('Edad: ',l^.dato.edad);
		writeln('Codigo: ',l^.dato.codigo);
		writeln('');
		l:= l^.sig;
	end;
end;}

//----------------------------------------------------------------

var
	l, listaNueva:lista;
begin
	generarLista(l);
	
	writeln('');
	recorrido(l, listaNueva);
	
	recorridoListaNueva(listaNueva);
	
end.
