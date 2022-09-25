{PedidosYa necesita un sistema para obtener estadísticas sobre los pedidos entregados.

Implementar un módulo que lea información de todos los pedidos y los almacene en una estructura de datos eficiente para la búsqueda por número de pedido (entre 1 y 15000), código del delivery (entre 1 y 1000) y monto. La lectura finaliza con el código de delivery 0.

Implementar un módulo que reciba la estructura generada en a) y retorne una estructura que tenga para cada código de delivery la cantidad de pedidos entregados.

Implementar un módulo que reciba la estructura generada en a) y retorne el monto de un pedido cuyo número se recibe como parámetro. En caso que el número pedido no exista retorna -1.}


program manzanoreynosoestebannoe;
const
	max = 1000;
	valorGrande = 9999;
type
	rangoNum = 1..15000;
	rangoCod = 1..max;
	
	pedido = record
		numero: rangoNum;
		codigo: integer;
		monto: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: pedido;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [rangoCod] of integer;

//-------------------------------------------------------------------------

procedure leerPedido (var r: pedido);
begin
	writeln('Ingrese codigo de delivery: ');
	readln(r.codigo);
	{r.codigo:= random(1001);
	writeln(r.codigo);}
	if (r.codigo <> 0) then begin
		writeln('Ingrese numero de pedido: ');
		readln(r.numero);
		{r.numero:= 1 + random(150000);
		writeln(r.numero);}
		writeln('Ingrese monto del pedido: ');
		readln(r.monto);
		{r.monto:= random(20000);
		writeln(r.monto:2:2);}
		writeln('');
	end;
end;

//-------------------------------------------------------------------------

procedure crear (var a: arbol; r: pedido);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= r;
		a^.HI:= nil;
		a^.HD:= nil;	
	end
	else
		if (r.numero < a^.dato.numero) then
			crear(a^.HI, r)
		else
			crear(a^.HD, r);
end;

//-------------------------------------------------------------------------

procedure generarArbol(var a: arbol);
var
	r: pedido;
begin
	leerPedido(r);
	while (r.codigo <> 0) do begin
		crear(a, r);
		leerPedido(r);
	end;
end;

//-------------------------------------------------------------------------

procedure imprimirArbol(a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol(a^.HI);
		writeln('Numero: ',a^.dato.numero);
		writeln('Codigo: ',a^.dato.codigo);
		writeln('Monto: ',a^.dato.monto:2:2);
		writeln('');
		imprimirArbol(a^.HD);	
	end;
end;

//-------------------------------------------------------------------------

procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to max do
		v[i]:= 0;
end;

//-------------------------------------------------------------------------

procedure imprimirVector (v: vector);
var
	i: integer;
begin
	for i:= 1 to max do begin
		writeln('Para el codigo ',i,' se entregaron ' ,v[i], ' pedidos');
		writeln('');
	end;
end;

//-------------------------------------------------------------------------

procedure moduloB (a: arbol; var v: vector);
begin
	if (a <> nil) then begin
		moduloB(a^.HI, v);
		v[a^.dato.codigo]:= v[a^.dato.codigo] + 1;
		moduloB(a^.HD, v);
	end;
end;

//-------------------------------------------------------------------------

procedure moduloC (a: arbol; var mont: real);

	function buscar (a: arbol; num: integer): real;
	begin
		if (a = nil) then
			Buscar:= -1
		else If (a^.dato.numero = num) then
			Buscar:= a^.dato.monto
			else if (num < a^.dato.numero) then
				Buscar:= Buscar (a^.HI, num)
				else
					Buscar:= Buscar (a^.HD, num)
	end;
var
	n: integer;
begin
	mont:= -1;
	writeln('Ingrese un numero de pedido: ');
	readln(n);
	
	mont:= buscar(a, n);
	if (mont <> -1) then
		writeln('El monto del numero de pedido ',n, ' es: ',mont:2:2)
	else
		writeln('No se encontro el numero de pedido');
end;

//-------------------------------------------------------------------------

var
	a: arbol;
	v: vector;
	monto: real;
BEGIN
	a:= nil;
  
  generarArbol(a);
	
	imprimirArbol(a);
	
	writeln('');
	
	inicializarVector(v);
	
	writeln('');
	moduloB(a, v);
	
	imprimirVector(v);
	
	writeln('');
	moduloC(a, monto);
END.
