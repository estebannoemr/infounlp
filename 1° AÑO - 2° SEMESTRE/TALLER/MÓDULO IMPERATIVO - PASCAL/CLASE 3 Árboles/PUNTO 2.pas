{Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total vendida.
               Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.

}

Program pr3p2;
type
	
	venta = record
		codigo: integer;
		fecha: string[25];
		cant: integer;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato: venta;
		HI: arbol;
		HD: arbol;
	end;
	
	//----------------------------------------------------------------
	
	producto = record
		codigo: integer;
		cant: integer;
	end;
	
	arbol2 = ^nodo2;
	
	nodo2 = record
		dato: producto;
		HI: arbol2;
		HD: arbol2;
	end;

//----------------------------------------------------------------

procedure GenerarArbol (var a: arbol; var a2: arbol2);
		
	Procedure LeerVenta (var v: venta);
	begin
		write ('Ingrese codigo de producto: ');
		readln (v.codigo);
		If (v.codigo <> 0) then begin
			write ('Ingrese la fecha: ');
			readln(v.fecha);
			write ('Ingrese cantidad de unidades vendidas: ');
			readln (v.cant);
		end;
	end;
  
	Procedure crear1 (var a: arbol; x: venta);
	Begin
	if (a = nil) then begin
		new(a);
		a^.dato:= x; 
		a^.HI:= nil; 
		a^.HD:= nil;
	end
    else if (x.codigo < a^.dato.codigo) then
		crear1(a^.HI, x)
		else
			crear1(a^.HD, x); 
	End;
	
	Procedure crear2 (var a2: arbol2; x: producto);
	Begin
		if (a2 = nil) then begin
			new(a2);
			a2^.dato:= x;
			a2^.HI:= nil; 
			a2^.HD:= nil;
		end
		else begin
			if (a2^.dato.codigo = x.codigo) then begin
				writeln('Cantidad a agregar:', x.cant);
				a2^.dato.cant:= a2^.dato.cant + x.cant;
			end
			else begin
				if (x.codigo < a^.dato.codigo) then
					crear2(a2^.HI, x)
				else
					crear2(a2^.HD, x);
			end;
		end;
	end;
	
var
	v: venta;
	p: producto; 
Begin
	writeln('Introduzca los datos de la venta!');
	LeerVenta (v);
	if (v.codigo <> 0) then begin
		writeln('Creando arbol 1');
		crear1 (a, v);
		
		p.codigo:= v.codigo;
		p.cant:= v.cant;
	
		writeln('Creando arbol 2');
		crear2(a2, p);
		
		GenerarArbol(a, a2);
	end;
end;

//----------------------------------------------------------------

procedure imprimirArbol (a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol (a^.HI);
		writeln('Codigo de producto: ');
		writeln (a^.dato.codigo);
		writeln('Fecha: ');
		writeln (a^.dato.fecha);
		writeln('Ingrese la cantidad vendida: ');
		writeln (a^.dato.cant);
		writeln('');
		imprimirArbol (a^.HD);
	end;
end;

//----------------------------------------------------------------

procedure imprimirArbol2 (a: arbol2);
begin
	if (a <> nil) then begin
		imprimirArbol2 (a^.HI);
		writeln('Codigo de producto: ');
		writeln (a^.dato.codigo);
		writeln('Ingrese la cantidad vendida: ');
		writeln (a^.dato.cant);
		writeln('');
		imprimirArbol2 (a^.HD);
	end;
end;

//----------------------------------------------------------------

procedure moduloB (a: arbol; var cant: integer);

	function total (a: arbol; n: integer): integer;
	begin
		if (a = nil) then
			total:= 0
		else if (a^.dato.codigo = n) then
			total:= a^.dato.cant + total(a^.HD, n)
			else if (n < a^.dato.codigo) then
				total:= total(a^.HI, n)
				else
					total:= total(a^.HD, n);
	end;
var
	n: integer;
begin
	writeln('Ingrese un codigo de producto a buscar: ');
	readln(n);
	
	cant:= total(a, n);
	
	writeln('El codigo ',n, ' tiene ',cant, ' unidades vendidas');	
	writeln('');
end;

//----------------------------------------------------------------

procedure moduloC (a2: arbol2; var cant2: integer);

	function total (a2: arbol2; n: integer): integer;
	begin
		if (a2 = nil) then
			total:= 0
		else if (a2^.dato.codigo = n) then
			total:= a2^.dato.cant + total(a2^.HD, n)
			else if (n < a2^.dato.codigo) then
				total:= total(a2^.HI, n)
				else
					total:= total(a2^.HD, n);
	end;
var
	n: integer;
begin
	writeln('Ingrese un codigo de producto a buscar: ');
	readln(n);
	
	cant2:= total(a2, n);
	
	writeln('El codigo ',n, ' tiene ',cant2, ' unidades vendidas');	
	writeln('');
end;

//----------------------------------------------------------------
  
var
	a: arbol;
	a2: arbol2;
	cant, cant2: integer;
Begin
	a:= nil;
	a2:= nil;
	
	GenerarArbol (a, a2);
	
	imprimirArbol(a);
	
	imprimirArbol2(a2);
	
	moduloB(a, cant);
	writeln('');
	moduloC(a2, cant2);
End.
