program Vectores;
const
	max = 5;
type
	vdatos = array[1..max] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var
	n: real;
begin
	writeln('Ingrese un numero: ');
	readln(n);
	while (n <> 0) and (dimL < max) do begin
		dimL:= dimL + 1;
		v[dimL]:= n;
		
		writeln(v[dimL]:2:2);
		
		if dimL < max then begin
			writeln('Ingrese un numero: ');
			readln(n);
		end;
	end;
end;

procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		v[i]:= v[i] + n;
		
		writeln(v[i]:2:2);
		
		suma:= suma + v[i];
	end;
	
end;

var
	datos : vdatos;
	i, dim : integer;
	num, suma : real;
begin
	dim := 0;
	suma := 0;
	
	cargarVector(datos, dim);
	
	writeln('');
	
	writeln('Ingrese un valor a sumar');
	readln(num);
	
	modificarVectorySumar(datos, dim, num, suma);
	
	writeln('La suma de los valores es: ', suma:2:2);
	
	writeln('Se procesaron: ',dim, ' numeros');
end.
