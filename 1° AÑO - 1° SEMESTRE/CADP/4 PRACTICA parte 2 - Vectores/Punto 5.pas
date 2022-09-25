program prc4p2p5;
Const
  max = 3;
Type
	rango = 1..max;
	mono = 'A'..'F';
	ciudad = 1..2400;
	st = string[20];
	fechas = record
	  dia: integer;
	  mes: integer;
	  ano:integer;
  end;	
	cliente = record
		fecha: fechas;
		categoria: mono;
		codigo: ciudad;
		monto: real;
	end;
	vector = array[rango] of cliente;

//----------------------------------------------------------------

procedure leer(var v: cliente);
begin
	with v do begin
		writeln('Ingrese dia de la firma del contrato ');
		readln(fecha.dia);
		writeln('Ingrese mes de la firma del contrato: ');
		readln(fecha.mes);
		writeln('Ingrese año de la firma del contrato: ');
		readln(fecha.ano);
		writeln('Ingrese categoria del monotributo: ');
		readln(categoria);
		writeln('Ingrese el codigo de la ciudad: ');
		readln(codigo);
		writeln('Ingrese el monto mensual acordado:  ');
		readln(monto);
		writeln('');
	end;
end;

//----------------------------------------------------------------


procedure cargar(var v:vector);
var
	i : rango;
	c : cliente;
begin
	for i:= 1 to max do begin
		leer(c);
		v[i]:= c;
	end;
end;


//-----------------------------------------------------------------

procedure leerVector(v:vector);
var
	i: rango;
begin
	for i:= 1 to max do begin
		writeln('');		
		writeln('Dia de la firma del contrato ');
		writeln(v[i].fecha.dia);
		writeln('Mes de la firma del contrato: ');
		writeln(v[i].fecha.mes);
		writeln('Año de la firma del contrato: ');
		writeln(v[i].fecha.ano);
		writeln('Categoria del monotributo: ');
		writeln(v[i].categoria);
		writeln('Codigo de la ciudad: ');
		writeln(v[i].codigo);
		writeln('Monto mensual acordado:  ');
		writeln(v[i].monto:2:2);
	end;
end;


//------------------------------------------------------------------

procedure contratos (v: vector);
var
	i, cmes, mesactual, j, cano, anoactual, may, anomay: integer;
begin
	writeln('');
	i:= 1;
	
	while (i <= max) do begin
		cmes:= 0;
		mesactual:= v[i].fecha.mes;
		while (v[i].fecha.mes = mesactual) do begin
			cmes:= cmes + 1;
			i:= i +1;
		end;
		writeln('La cantidad de contratos en el mes ',mesactual, ' es: ',cmes);
	end;
	
	j:= 1;
	may:= -1;
	while (j <= max) do begin
		cano:= 0;
		anoactual:= v[j].fecha.mes;
		while (v[j].fecha.mes = anoactual) do begin
			cano:= cano + 1;
			j:= j +1;
		end;
		writeln('La cantidad de contratos en el año ',anoactual, ' es: ',cano);
		
		if (cano > may) then begin
			anomay:= anoactual;
			may:= cano;
		end;
	end;
	
	writeln('Año en el que se firmó la mayor cantidad de contratos: ',anomay);
  
end;


//------------------------------------------------------------------

procedure monotributos (v: vector);
var
	i, cant: integer;
	actual: mono;
begin
	writeln('');
	i:= 1;
	
	while (i <= max) do begin
		cant:= 0;
		actual:= v[i].categoria;
		while (v[i].categoria = actual) do begin
			cant:= cant + 1;
			i:= i +1;
		end;
		writeln('La cantidad de ',actual, ' es: ',cant);
	end;
	
end;


//------------------------------------------------------------------

function promedio (v: vector) : real;
var
	i: integer;
	suma: real;
begin
	suma:= 0;
	for i:= 1 to max do
		suma:= suma + v[i].monto;
	promedio:= suma / max;
end;

//------------------------------------------------------------------

function superan (v: vector; p: real) : integer;
var
	i: integer;
begin
	superan:= 0;
	for i:= 1 to max do begin
		if (v[i].monto > p) then
			superan:= superan + 1;
	end;
end;

//------------------------------------------------------------------

var
	v: vector;
	prom: real;
begin
	cargar(v);
	writeln('');
	writeln('--------------VECTOR--------------');
	leerVector(v);
	
	writeln('');
	writeln('--------------RESULTADOS--------------');
	
	contratos(v);
	writeln('');
	monotributos(v);
	
	writeln('');
	prom:= promedio(v);
	writeln('El promedio es: ',prom:2:2);
	writeln('');
	writeln('Cantidad de clientan que superan mensualmente el monto promedio: ' ,superan(v, prom));
	
	writeln('');
	writeln('--------- VECTOR ---------');
	leerVector(v);

end.
