program untitled;
const
	cantOficinas = 300;
	valorGrande = 9999;
type
	rango = 1..cantOficinas;
	
	oficina = record
		codigo: integer;
		dni: integer;
		valor: real;
	end;
	
	vector = array [rango] of oficina;

//----------------------------------------------------------------

procedure GenerarVector (var v: vector; var dimL: integer);
	
	procedure leerOficina (var r: oficina);
	begin
		writeln ('Ingrese Codigo de identificacion: ');
		{r.codigo:= random(valorGrande);
		writeln(r.codigo);}
		readln (r.codigo);
		If (r.codigo <> -1) then begin
			writeln ('Ingrese DNI del propietario: ');
			r.dni:= random(50) + 1;
			writeln (r.dni);
			writeln ('Ingrese Valor de la expensa: ');
			r.valor:= random (500) + 1;
			//r.valor:= 500;
			writeln (r.valor:2:2);
		end;
	end;
  
var
	r: oficina;
begin
	dimL := 0;
	LeerOficina (r);
	while (r.codigo <> -1)  and (dimL < cantOficinas) do begin
		dimL := dimL + 1;
		v[dimL]:= r;
		LeerOficina (r);
	end;
	writeln('');
end;

//----------------------------------------------------------------

procedure imprimirVector {debug} (v: vector; dL: integer);
var
	i:integer;
begin
	for i:= 1 to dL do begin
		writeln('Codigo: ' ,v[i].codigo,' - DNI: ',v[i].dni,' - Valor de la expensa: ',v[i].valor:2:2);
		writeln('');
	end;
	writeln('');
end;

//----------------------------------------------------------------	

procedure Ordenar (var v: vector; dimL: integer);
var
	i, j, pos: integer;
	item: oficina;		
begin
	for i:= 1 to dimL - 1 do begin {busca el mínimo y guarda en pos la posición}
		pos := i;
		for j := i+1 to dimL do 
			if (v[j].codigo < v[pos].codigo) then
				pos:=j;
	
	{intercambia v[i] y v[pos]}
		item := v[pos];   
		v[pos] := v[i];   
		v[i] := item;
	end;
end;

//----------------------------------------------------------------	

procedure busquedaDicotomica (v: vector; ini, fin: rango; dato:integer; var pos: integer; var dni: integer);
begin
	pos:= (ini + fin) DIV 2;
	
	if (ini <= fin) and (dato <> v[pos].codigo) then begin
		writeln(pos);
		if (dato < v[pos].codigo) then
			fin:= pos - 1
		else
			ini:= pos + 1;
		
		busquedaDicotomica(v, ini, fin, dato, pos, dni);
	end;
	
	if (pos > 0) and (pos <= cantOficinas) and (dato = v[pos].codigo) then begin
		pos:= pos;
		dni:= v[pos].dni;
	end
	else begin
		pos:= -1;
		dni:= -1;
	end;
end;

//----------------------------------------------------------------

function total (v: vector; dimL: integer) : real;
begin
	if (dimL <> 0) then
		total:= v[dimL].valor + total(v, dimL-1)
	else
		total:= 0;
	
	
	{montoTotal:= 0;
	for i:= 1 to dimL do
		montoTotal:= montoTotal + v[i].valor;
	writeln('');}
end;

//----------------------------------------------------------------

Var
	v: vector;
	dL: integer;
	inicio, pos, codigoAbuscar, dniAbuscar: integer;
Begin
	Randomize();
	
	inicio:= 1;
	
	generarVector(v, dL);
	writeln('-------------- VECTOR --------------');
	writeln('');
	imprimirVector(v, dL);
	
	ordenar(v, dL);
	writeln('-------------- VECTOR ORDENADO --------------');
	writeln('');
	imprimirVector(v, dL);
	
	writeln('');
	writeln('-------------- BUSQUEDA DICOTOMICA --------------');
	writeln('Ingrese un codigo a buscar: ');
	readln(codigoAbuscar);
	
	
	busquedaDicotomica(v, inicio, dL, codigoAbuscar, pos, dniAbuscar);
	
	if (pos = -1) then
		writeln('Posicion: ' ,pos, ' por lo que no se encontro el valor en el vector')
	else begin
		writeln('Posicion donde se encontro el valor: ',pos);
		writeln('DNI del codigo buscado: ',dniAbuscar);
	end;
	
	writeln('');
	writeln('Monto total de las expensas: ' ,total(v, dL):2:2);
End.
