Program pr3p3;
type
	
	alumno = record
		legajo: integer;
		dni: integer;
		ano: integer;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;

//----------------------------------------------------------------

procedure GenerarArbol (var a: arbol);
		
	Procedure LeerAlumno (var a: alumno);
	begin
		write ('Ingrese legajo: ');
		readln (a.legajo);
		if (a.legajo <> -1) then begin
			write ('Ingrese DNI: ');
			readln(a.dni);
			write ('Ingrese anio de ingreso: ');
			readln (a.ano);
		end;
	end;
  
	Procedure crear (var a: arbol; x: alumno);
	Begin
	if (a = nil) then begin
		new(a);
		a^.dato:= x; 
		a^.HI:= nil; 
		a^.HD:= nil;
	end
    else if (x.legajo < a^.dato.legajo) then
		crear(a^.HI, x)
		else
			crear(a^.HD, x); 
	End;
	
var
	x: alumno;
Begin
	writeln('Introduzca los datos del alumno!');
	LeerAlumno (x);
	while (x.legajo <> -1) do begin
		if (x.ano >= 2010) then
			crear (a, x);
		LeerAlumno (x);
	end;
end;

//----------------------------------------------------------------

procedure imprimirArbol (a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol (a^.HI);
		writeln('Legajo: ');
		writeln (a^.dato.legajo);
		writeln('DNI: ');
		writeln (a^.dato.dni);
		writeln('Anio de ingreso: ');
		writeln (a^.dato.ano);
		writeln('');
		imprimirArbol (a^.HD);
	end;
end;

//----------------------------------------------------------------

procedure moduloB(a: arbol);

	procedure informar (a: arbol; n: integer);
	begin
		if (a <> nil) then begin
			informar(a^.HI, n);
			if (a^.dato.legajo < n) then begin
				//informar(a^.HI, n);
				writeln('DNI: ',a^.dato.dni);
				writeln('Anio de ingreso: ',a^.dato.ano);
				writeln('');
				//informar(a^.HD, n);
			end;
			{else
				informar(a^.HI, n);}
			informar(a^.HD, n);
		end;
	end;

var
	n: integer;
begin
	writeln('Ingrese un numero de legajo para ver los MENORES: ');
	readln(n);
	
	writeln('');
	
	informar(a, n);
end;

//----------------------------------------------------------------

procedure moduloC(a: arbol);

	procedure entre2valores (a: arbol; x, i: integer);
	begin
		if (a <> nil) then begin
			entre2valores(a^.HI, x, i);
			if (a^.dato.legajo >= x) and (a^.dato.legajo <= i) then begin
				writeln('DNI: ',a^.dato.dni);
				writeln('Anio de ingreso: ',a^.dato.ano);
				writeln('');
			end;
			entre2valores(a^.HD, x, i);
		end;
	end;
	
var
	x, i: integer;
begin
	writeln('Ingrese el primer valor: ');
	readln(x);
	writeln('Ingrese el segundo valor: ');
	readln(i);
	
	writeln('');
	
	entre2valores(a, x, i)
end;

//----------------------------------------------------------------

procedure moduloD (a: arbol);

	procedure actualizarMaximo (var maxValor : integer; nuevoValor : integer);
	begin
		if (nuevoValor >= maxValor) then
			maxValor:= nuevoValor;
	end;
	
	
	procedure DNIMasGrande (a: arbol; var maxDNI: integer);
	begin
		if (a <> nil) then begin
			actualizarMaximo(maxDNI, a^.dato.dni);
			DNIMasGrande(a^.hi, maxDNI);
			DNIMasGrande(a^.hd, maxDNI);
		end; 
	end;
	
var
	dniMax: integer;
begin
	dniMax:= -1;
	DNIMasGrande (a, dniMax);
	if (dniMax = -1) then
		writeln ('Arbol sin elementos')
	else
		writeln ('DNI mas grande: ', dniMax);
	writeln('');
end;

//----------------------------------------------------------------

{procedure moduloE(a: arbol; var cant: integer);
begin
	if (a <> nil) then begin
		moduloE (a^.hd, cant);
		if (a^.dato.legajo mod 2 <> 0) then
			cant:= cant + 1;
		moduloE (a^.hi, cant);
	end;
end;}

//----------------------------------------------------------------

procedure moduloE(a: arbol);

	function cant (a: arbol): integer;
	begin
		if (a = nil) then
			cant:= 0
		else if (a^.dato.legajo mod 2 <> 0) then
				cant:= 1 + cant(a^.HI) + cant(a^.HD)
			else
				cant:= cant(a^.HI) + cant(a^.HD);
	end;

begin
	writeln('Cantidad de alumnos con legajo impar: ',cant(a));
	writeln('');
end;

//----------------------------------------------------------------
  
var
	a: arbol;
	//cant: integer;
Begin
	a:= nil;
	
	GenerarArbol (a);
	
	imprimirArbol(a);
	
	writeln('');
	
	moduloB(a);
	writeln('');
	moduloC(a);
	writeln('');
	moduloD(a);
	writeln('');
	//moduloE(a, cant);
	moduloE(a);
End.
