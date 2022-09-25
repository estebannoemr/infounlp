program tre;
const
	max = 10;
	valorGrande = 9999;
type
	rango = 1..max;
	
	producto = record
		codigo: integer;
		rubro: rango;
		stock: integer;
		precio: real;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
	vArbol = array [rango] of arbol;
	
	
//----------------------------------------------------------------
	
procedure leerProducto {a}(var r: producto);
begin
	writeln ('Codigo: ');
	readln (r.codigo);
	if  (r.codigo <> -1) then begin
		writeln ('Rubro: ');
		r.rubro:= random(max-1) + 1;
		writeln(r.rubro);
		//readln (r.rubro);
		writeln ('Stock: ');
		r.stock:= random(25) + 1;
		writeln(r.stock);
		//readln (r.stock);
		writeln ('Precio unitario: ');
		r.precio:= random(100) + 5;
		writeln(r.precio:2:2);
		writeln('');
		//readln(r.precio);
	end;
end;

//----------------------------------------------------------------

Procedure insertar (var a: arbol; elem: producto);
Begin
	if (a = nil) then begin
		new(a);
		a^.dato:= elem; 
		a^.HI:= nil; 
		a^.HD:= nil;
	end
    else if (elem.codigo < a^.dato.codigo) then
		insertar(a^.HI, elem)
		else
			insertar(a^.HD, elem); 
End;

//----------------------------------------------------------------

procedure inicializarVector(var v: vArbol);
var
	i: rango;
begin
	for i:= 1 to max do
		v[i]:= nil;
end;

//----------------------------------------------------------------

procedure generarVector {a} (var vL: vArbol);
var
	p: producto;
begin
	inicializarVector(vL);
	leerProducto (p);
	while (p.codigo <> -1) do begin
		insertar (vL[p.rubro], p);
		writeln('');
		leerProducto (p);
	end;
end;

//----------------------------------------------------------------

procedure imprimirArbol (a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol (a^.HI);
		writeln('Codigo de producto: ');
		writeln (a^.dato.codigo);
		writeln('Rubro: ');
		writeln (a^.dato.rubro);
		writeln('Stock: ');
		writeln (a^.dato.stock);
		writeln('Precio unitario: ');
		writeln (a^.dato.precio:2:2);
		writeln('');
		imprimirArbol (a^.HD);
	end;
end;

//----------------------------------------------------------------

procedure imprimirVector {debug} (vL: vArbol);
var
	i:integer;
begin
	for i:= 1 to max do begin
		writeln('Rubro: ',i);
		writeln('---------------------');
		
		if (vL[i] = nil) then
			writeln('Rubro sin productos')
		else
			imprimirArbol(vL[i]);
		
		writeln('');
	end;
end;


//----------------------------------------------------------------

procedure moduloB(vL: vArbol; r: rango; c: integer; var ok: boolean);

	procedure total (a: arbol; n: integer);
	begin
		if (a <> nil) then begin
			total (a^.HI, n);
			if (a^.dato.codigo = n) then
				ok:= true;
			total (a^.HD, n);
		end;
	end;

begin
	ok:= false;
	total(vL[r], c);
end;

//----------------------------------------------------------------	

procedure masGrande (a: arbol; x: integer);

	function codigoMasGrande (a: arbol; var st: integer): integer;
	begin
		if (a = nil) then
			codigoMasGrande:= -1
		else if (a^.HD = nil) then begin
			codigoMasGrande:= a^.dato.codigo;
			st:= a^.dato.stock;
			end
			else
				codigoMasGrande:= codigoMasGrande (a^.HD, st);
	end;
   
var
	max: integer;
	stock: integer;
begin
	max:= codigoMasGrande (a, stock);
	if (max = -1) then
		writeln ('Rubro sin elementos')
	else
		writeln ('Del rubro ' ,x, ' el numero de socio mas grande es: ', max, ' y su stock es: ',stock);
end;

//----------------------------------------------------------------

procedure moduloC (v: vArbol);
var
	i: integer;
begin
	writeln;
	writeln ('----- MODULO C ----->');
	for i:= 1 to max do begin
		masGrande(v[i], i);
		writeln('');
	end;
end;

//----------------------------------------------------------------

{procedure cantidadProductosEnRango(a: arbol; x, i: integer);

	function entre2valores (a: arbol; x, i: integer): integer;
	begin
		if (a = nil) then
			entre2valores:= 0
		else
			if (a^.dato.numero >= x) and (a^.dato.numero <= i) then
				entre2valores:= 1 + entre2valores(a^.HI, x, i) + entre2valores(a^.HD, x, i)
			else
				entre2valores:= entre2valores(a^.HI, x, i) + entre2valores(a^.HD, x, i);
	end;
	
var
	x, i: integer;
begin
	writeln('Cantidad de socios entre ',x, ' y ',i, ' : ',entre2valores(a, x, i));
	writeln('');
end;}

//----------------------------------------------------------------

procedure moduloD(v: vArbol);

	function entre2valores (a: arbol; x, i: integer): integer;
	begin
		if (a = nil) then
			entre2valores:= 0
		else
			if (a^.dato.codigo >= x) and (a^.dato.codigo <= i) then
				entre2valores:= 1 + entre2valores(a^.HI, x, i) + entre2valores(a^.HD, x, i)
			else
				entre2valores:= entre2valores(a^.HI, x, i) + entre2valores(a^.HD, x, i);
	end;

var
	i: integer;
	x, y: integer;
begin
	writeln;
	
	writeln('Ingrese el primer valor: ');
	readln(x);
	
	writeln('Ingrese el segundo valor: ');
	readln(y);
	
	writeln ('----- MODULO D ----->');
	for i:= 1 to max do begin
		writeln('En el rubro ',i, ' la cantidad de productos con codigos entre ',x, ' y ' ,y, ' son: ' ,entre2valores(v[i], x, y));
		writeln('');
	end;
end;

//----------------------------------------------------------------

var
	vL: vArbol;
	rubro: rango;
	codigo: integer;
	existe: boolean;
begin
	generarVector (vL);
	writeln('');
	
	writeln('---------------------- VECTOR ----------------------');
	imprimirVector(vL);
	writeln('');
	
	writeln('Ingrese un rubro: ');
	readln(rubro);
	writeln('');
	writeln('Ingrese un codigo de producto: ');
	readln(codigo);
	
	writeln('');
	moduloB(vL, rubro, codigo, existe);
	
	if (existe) then
		writeln('El codigo ' ,codigo, ' existe para el rubro ',rubro)
	else
		writeln('El codigo ' ,codigo, ' NO existe para el rubro ',rubro);
		
	
	writeln('');
	moduloC(vL);
	
	writeln('');
	moduloD(vL);
end.
