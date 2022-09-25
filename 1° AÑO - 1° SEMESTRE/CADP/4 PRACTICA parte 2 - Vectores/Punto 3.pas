program nombre;
Const
	max = 4;
	dias = 31;
Type
	rango = 1..max;
	mes = 1..dias;
	st = string[20];
	viaje = record
		dia: mes;
		dinero: real;
		distancia: real;
	end;
	vector = array[rango] of viaje;

//----------------------------------------------------------------

procedure leer(var v: viaje);
begin
	with v do begin
		writeln('Ingrese distancia recorrida por el camion: ');
		readln(distancia);
		if (distancia <> 0) then begin
			writeln('Ingrese monto de dinero transportado: ');
			readln(dinero);
			writeln('Ingrese el dia del viaje: ');
			readln(dia);
		end;
	end;
end;

//----------------------------------------------------------------


procedure cargar(var v:vector; var dL: integer);
var
	i: viaje;
begin
	dL:= 0;
	leer(i);
	while (dL < max) and (i.distancia <> 0) do begin
		dL:= dL + 1;
		v[dL]:= i;
		if (dL < max) then
			leer(i);
	end;
end;


//-----------------------------------------------------------------

procedure leerVector(v:vector; dL: integer);
var
	i: rango;
begin
	for i:= 1 to dL do begin
		writeln('');
		if (v[1].distancia <> 0) then begin
			writeln('Distancia recorrida por el camion: ');
			writeln(v[i].distancia:2:2);
			writeln('Monto de dinero transportado: ');
			writeln(v[i].dinero:2:2);
			writeln('Dia del viaje: ');
			writeln(v[i].dia);
		end
		else
			writeln('No hay vectores');
	end;
end;


//------------------------------------------------------------------

procedure informo(v:vector; dL: integer);
var
	suma, promedio, dist, min: real;
	i, diames, cant, diaactual: integer;
begin
	writeln('');
	suma:= 0;
	min:= 9999;
	cant:= 1;
	diaactual:= v[1].dia;
	
	for i:=1 to dL do begin
		suma:= suma + v[i].dinero;
		
		if (v[i].dinero < min) then begin
			min:= v[i].dinero;
			dist:= v[i].distancia;
			diames:= v[i].dia;
		end;
		
		if (i < dL) and (v[i+1].dia = diaactual) then
            cant:= cant + 1
        else begin
            writeln('Cantidad de viajes realizados el dia ', diaactual, ' : ', cant);
            writeln('');
            cant:= 1;
            diaactual:= v[i+1].dia;
        end;
	end;
	
	promedio:= suma / dL;
	writeln('Monto promedio transportado de los viajes realizados: ',promedio:2:2);
	
	writeln('');
	writeln('En el dia ' ,diames, ' se recorrieron ',dist:2:2, ' km, y fue el dia en el que menos dinero se transporto.');
	
end;


//------------------------------------------------------------------


procedure eliminar(var v: vector; var dL: integer);     // MAL
var
	i: rango;
	x: integer;
begin
	x:= 100;
	for i:= 1 to (dL) do begin
		if (v[i].distancia = x) then begin
			v[i]:= v[i+1];
			dL:= dL - 1;
		end;
	end;
	if (v[dL].distancia = x) then begin
		v[dL]:= v[i+1];
		dL:= dL - 1;
	end;
	writeln(dL);
end;

//------------------------------------------------------------------

var
	v: vector;
	dimLog: integer;
begin
	cargar(v, dimLog);
	writeln('');
	writeln('--------------VECTOR--------------');
	leerVector(v, dimLog);
	
	writeln('');
	writeln('--------------RESULTADOS--------------');
	
	informo(v, dimLog);
	
	writeln('');
	eliminar (v, dimLog);
	writeln('---------VECTOR CON DIST = 100 ELIMINADO---------');
	leerVector(v, dimLog);

end.
