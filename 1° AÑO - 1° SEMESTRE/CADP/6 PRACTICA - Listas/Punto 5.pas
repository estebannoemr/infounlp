program ejercicio2;
type
	lista = ^nodo;
	
	producto = record
		codigo: integer;
		desc: string;
		stock: integer;
		minimo: integer;
		precio: real;
	end;
	
	nodo = record
		dato: producto;
		sig: lista;
	end;

//----------------------------------------------------------------

procedure leerProducto(var p: producto);
begin
	writeln('Ingrese el CODIGO del producto: ');
	readln(p.codigo);
	if (p.codigo <> -1)then begin
		writeln('Ingrese la descripcion: ');
		readln(p.desc);
		writeln('Ingrese el stock actual: ');
		readln(p.stock);
		writeln('Ingrese el stock minimo: ');
		readln(p.minimo);
		writeln('Ingrese el precio: ');
		readln(p.precio);
	end;
end;

//----------------------------------------------------------------

procedure agregar(var l: lista; p: producto);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= p;
	nuevo^.sig:= l;
	
	if (l = nil) then
		l:= nuevo
	else begin
		nuevo^.sig:= l;
		l:= nuevo;
	end;
end;

//----------------------------------------------------------------

procedure generarLista(var l:lista);
var
	p: producto;
begin
	leerProducto(p);
	while (p.codigo <> -1) do begin
		agregar(l, p);
		leerProducto(p);
	end;
end;

//----------------------------------------------------------------

function digitosPares (num: integer) : integer;
var
	dig: integer;
begin
	digitosPares:= 0;
	while (num <> 0) do begin
        dig:= num mod 10;
        if ((dig mod 2)= 0) then
            begin
                digitosPares:= digitosPares+1;
                num:= num DIV 10;
            end 
            else
                num:= num DIV 10;
	end;
end;

//----------------------------------------------------------------

procedure recorrido (l: lista);
var
	aux: lista;
	cant, total, cod1, cod2: integer;
	porc, pr1, pr2: real;
begin
	aux:= l;
	cant:= 0;
	total:= 0;
	pr1:= 9999;
	cod1:= -1;
	while (aux <> nil) do begin
		if (aux^.dato.stock < aux^.dato.minimo) then
			cant:= cant + 1;
		total:= total + 1;
		
		if (digitosPares(aux^.dato.codigo) >= 3) then begin
			writeln('El producto con codigo ',aux^.dato.codigo, ' tiene al menos 3 digitos pares y su descripcion es: ',aux^.dato.desc);
			writeln('');
		end;
		
		if (aux^.dato.precio < pr1) then begin
			pr2:= pr1;
			cod2:= cod1;
			pr1:= aux^.dato.precio;
			cod1:= aux^.dato.codigo;
		end
		else
		if (aux^.dato.precio < pr2) then begin
			pr2:= aux^.dato.precio;
			cod2:= aux^.dato.codigo;
		end;
		
		aux:= aux^.sig;
	end;
	
	porc:= cant / total * 100;
	
	writeln('El porcentaje de productos con stock actual por debajo de su stock minimo es: ',porc:2:2);
	writeln('');
	writeln('Codigo del producto mas economico: ',cod1, ' con un precio de: ',pr1:2:2);
	writeln('');
	writeln('Codigo del segundo producto mas economico: ',cod2, ' con un precio de: ',pr2:2:2);
end;

//----------------------------------------------------------------

procedure imprimirInformacion(var l:lista);
begin
	while (l <> nil) do begin
		writeln('');
		writeln('Codigo del producto: ',l^.dato.codigo);
		writeln('');
		writeln('Descripcion del producto: ',l^.dato.desc);
		writeln('');
		writeln('Stock actual del producto: ',l^.dato.stock);
		writeln('');
		writeln('Stock minimo del producto: ',l^.dato.minimo);
		writeln('');
		writeln('Precio del producto: ',l^.dato.precio:2:2);
		writeln('');
		l:= l^.sig;
	end;
end;

//----------------------------------------------------------------

var
	l:lista;
begin
	generarLista(l);
	writeln('');
	
	recorrido(l);
	
	writeln('');
	writeln('--------------LISTA--------------');
	imprimirInformacion(l);
end.
