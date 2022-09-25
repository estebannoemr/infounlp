{Escribir un programa que:
a. Implemente un modulo que lea informacion de socios de un club y las almacene en un arbol binario de busqueda. De cada socio se lee numero de socio, 
nombre y edad. La lectura finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio.
b. Una vez generado el arbol, realice modulos independientes que reciban el arbol como parametro y: 
    i. Informe el numero de socio mas grande. Debe invocar a un modulo recursivo que retorne dicho valor. 
    ii. Informe los datos del socio con el numero de socio mas chico. Debe invocar a un modulo recursivo que retorne dicho socio. 
    iii. Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor. 
    iv. Aumente en 1 la edad de todos los socios.
    v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el valor lei­do y
       retorne verdadero o falso.
    vi. Lea un nombre e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el nombre lei­do y 
        retorne verdadero o falso.
    vii. Informe la cantidad de socios. Debe invocar a un modulo recursivo que retorne dicha cantidad.
    viii. Informe el promedio de edad de los socios. Debe invocar a un modulo recursivo que retorne dicho promedio.
    ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el arbol cuyo numero de socio se encuentra entre 
        los dos valores ingresados. Debe invocar a un modulo recursivo que reciba los dos valores leÃ­dos y retorne dicha cantidad. 
    x. Informe los numeros de socio en orden creciente. 
    xi. Informe los numeros de socio pares en orden decreciente.
}

Program ImperativoClase3;
type
	rangoEdad = 12..100;
	cadena15 = string [15];
	socio = record
		numero: integer;
		nombre: cadena15;
		edad: rangoEdad;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: socio;
		HI: arbol;
		HD: arbol;
	end;

//----------------------------------------------------------------

procedure GenerarArbol (var a: arbol);
{ Implemente un modulo que lea informacion de socios de un club y las almacene en un arbol binario de busqueda. De cada socio se lee numero de socio, 
nombre y edad. La lectura finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. }

	Procedure LeerSocio (var s: socio);
	begin
		write ('Ingrese numero del socio: ');
		readln (s.numero);
		If (s.numero <> 0) then begin
			write ('Ingrese nombre del socio: ');
			readln (s.nombre);
			write ('Ingrese edad del socio: ');
			readln (s.edad);
		end;
	end;  
  
	Procedure InsertarElemento (var a: arbol; elem: socio);
	Begin
	if (a = nil) then begin
		new(a);
		a^.dato:= elem; 
		a^.HI:= nil; 
		a^.HD:= nil;
	end
    else if (elem.numero < a^.dato.numero) then
		InsertarElemento(a^.HI, elem)
		else
			InsertarElemento(a^.HD, elem); 
	End;

var
	unSocio: socio;  
Begin
	a:= nil;
	LeerSocio (unSocio);
	while (unSocio.numero <> 0) do begin
		InsertarElemento (a, unSocio);
		writeln;
		LeerSocio (unSocio);
	end;
end;

//----------------------------------------------------------------

procedure InformarNumeroSocioMasGrande (a: arbol);
{Informe el numero de socio mas grande. Debe invocar a un modulo recursivo que retorne dicho valor.}

	function NumeroMasGrande (a: arbol): integer;
	begin
		if (a = nil) then
			NumeroMasGrande:= -1
		else if (a^.HD = nil) then
			NumeroMasGrande:= a^.dato.numero
			else
				NumeroMasGrande:= NumeroMasGrande (a^.HD);
	end;
   
var
	max: integer;
begin
	writeln;
	writeln ('----- Informar Numero Socio Mas Grande ----->');
	writeln;
	max:= NumeroMasGrande (a);
	if (max = -1) then
		writeln ('Arbol sin elementos')
	else begin
		writeln;
		writeln ('Numero de socio mas grande: ', max);
		writeln;
	end;
end;

//----------------------------------------------------------------

procedure InformarDatosSocioNumeroMasChico (a: arbol);
{ Informe los datos del socio con el numero de socio mas chico. Debe invocar a un modulo recursivo que retorne dicho socio. }
  
	function SocioMasChico (a: arbol): arbol;
	begin
		if ((a = nil) or (a^.HI = nil)) then
			SocioMasChico:= a
		else
			SocioMasChico:= SocioMasChico (a^.HI);
	end;
   
var
	minSocio: arbol;
begin
	writeln;
	writeln ('----- Informar Datos Socio Numero Mas Chico ----->');
	writeln;
	minSocio:= SocioMasChico (a);
	if (minSocio = nil) then
		writeln ('Arbol sin elementos')
	else begin
		writeln;
		writeln ('Socio con numero mas chico: ', minSocio^.dato.numero, ' Nombre: ', minSocio^.dato.nombre, ' Edad: ', minSocio^.dato.edad); 
		writeln;
	end;
end;

//----------------------------------------------------------------

procedure InformarNumeroSocioConMasEdad (a: arbol);
{ Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }

	procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
	begin
		if (nuevoValor >= maxValor) then begin
			maxValor := nuevoValor;
			maxElem := nuevoElem;
		end;
	end;
	
	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
		if (a <> nil) then begin
			actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
			numeroMasEdad(a^.hi, maxEdad,maxNum);
			numeroMasEdad(a^.hd, maxEdad,maxNum);
		end; 
	end;
	
var
	maxEdad, maxNum: integer;
begin
	writeln;
	writeln ('----- Informar Numero Socio Con Mas Edad ----->');
	writeln;
	NumeroMasEdad (a, maxEdad, maxNum);
	if (maxEdad = -1) then
		writeln ('Arbol sin elementos')
	else begin
		writeln;
		writeln ('Numero de socio con mas edad: ', maxNum);
		writeln;
	end;
end;

//----------------------------------------------------------------

procedure AumentarEdad (a: arbol);
begin
	if (a <> nil) then begin
		a^.dato.edad:= a^.dato.edad + 1;
		AumentarEdad (a^.HI);
		AumentarEdad (a^.HD);
	end;
end;

//----------------------------------------------------------------

procedure InformarExistenciaNumeroSocio (a: arbol);
{ Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el valor lei­do y
       retorne verdadero o falso. }
       
	function Buscar (a: arbol; num: integer): boolean;
	begin
		if (a = nil) then
			Buscar:= false
		else If (a^.dato.numero = num) then
			Buscar:= true
			else if (num < a^.dato.numero) then
				Buscar:= Buscar (a^.HI, num)
				else
					Buscar:= Buscar (a^.HD, num)
	end;
  
var
	numABuscar: integer;
begin
	writeln;
	writeln ('----- Informar Existencia Numero Socio ----->');
	writeln;
	write ('Ingrese numero de socio a buscar: ');
	Readln (numABuscar);
	writeln;
	if (Buscar (a, numABuscar)) then
		writeln ('El numero ', numABuscar, ' existe')
	else
		writeln ('El numero ', numABuscar, ' no existe');
	writeln;
end;

//----------------------------------------------------------------

procedure InformarExistenciaNombreSocio (a: arbol);
{ Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el valor lei­do y
       retorne verdadero o falso. }
       
	function BuscarNombre (a: arbol; n: string): boolean;
	begin
		if (a = nil) then
			BuscarNombre:= false
		else If (a^.dato.nombre = n) then
			BuscarNombre:= true
			else begin
				BuscarNombre:= BuscarNombre (a^.HI, n);
				BuscarNombre:= BuscarNombre (a^.HD, n);
			end;
	end;
  
var
	nomABuscar: string;
begin
	writeln;
	writeln ('----- Informar Existencia Nombre Socio ----->');
	writeln;
	write ('Ingrese nombre de socio a buscar: ');
	Readln (nomABuscar);
	writeln;
	if (BuscarNombre (a, nomABuscar)) then
		writeln ('El nombre ', nomABuscar, ' existe')
	else
		writeln ('El nombre ', nomABuscar, ' no existe');
	writeln;
end;

//----------------------------------------------------------------

procedure InformarCantidadSocios(a: arbol);

	function cant(a: arbol): integer;
	begin
		if (a = nil) then
			cant:= 0
		else
			cant:= 1 + cant(a^.HI) + cant(a^.HD);
	end;

begin
	writeln('');
	writeln('Cantidad de socios: ',cant(a));
end;

//----------------------------------------------------------------

procedure InformarPromedioDeEdad(a: arbol);

	function cant(a: arbol): integer;
	begin
		if (a = nil) then
			cant:= 0
		else
			cant:= 1 + cant(a^.HI) + cant(a^.HD);
	end;

	function prom(a: arbol): integer;
	begin
		if (a = nil) then
			prom:= 0
		else
			prom:= a^.dato.edad + prom(a^.HI) + prom(a^.HD);
	end;

var
	promedio: real;
begin
	promedio:= prom(a) / cant(a);
	writeln('');
	writeln('El promedio de edad de los socios es: ',promedio:2:2);
end;

//----------------------------------------------------------------

procedure InformarCantidadSociosEnRango(a: arbol);

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
	
	{function contarRango (a:arbol; r1:integer; r2:integer):integer;
	begin
		if (a = nil) then
			contarRango:=0
		else if (a^.dato.numero >= r1) and (a^.dato.numero <= r2) then
			contarRango:= 1 + contarRango(a^.hd, r1, r2) + contarRango(a^.hi, r1, r2)
			else
				contarRango:= contarRango(a^.hd, r1, r2) + contarRango(a^.hi, r1, r2);
	end;}
	
var
	x, i: integer;
begin
	writeln('Ingrese el primer valor: ');
	readln(x);
	writeln('Ingrese el segundo valor: ');
	readln(i);
	
	writeln('Cantidad de socios entre ',x, ' y ',i, ' : ',entre2valores(a, x, i));
	writeln('');
end;

//----------------------------------------------------------------

procedure InformarNumerosSociosOrdenCreciente(a: arbol);
begin
	if (a <> nil) then begin
		InformarNumerosSociosOrdenCreciente (a^.hi);
		writeln ('Numero de socio:', a^.dato.numero);
		writeln('');
		InformarNumerosSociosOrdenCreciente (a^.hd);
	end;	
end;

//----------------------------------------------------------------

procedure InformarNumerosSociosOrdenDeCreciente(a: arbol);
begin
	if (a <> nil) then begin
		InformarNumerosSociosOrdenDeCreciente (a^.hd);
		if (a^.dato.numero mod 2 = 0) then begin
			writeln ('Numero de socio par:', a^.dato.numero);
			writeln('');
		end;
		InformarNumerosSociosOrdenDeCreciente (a^.hi);
	end;
end;

//----------------------------------------------------------------
  
var
	a: arbol; 
Begin
	GenerarArbol (a);
	InformarNumeroSocioMasGrande (a);
	InformarDatosSocioNumeroMasChico (a);
	InformarNumeroSocioConMasEdad (a);
	AumentarEdad (a);
	InformarExistenciaNumeroSocio (a);
	InformarExistenciaNombreSocio (a);
	InformarCantidadSocios (a);
	InformarPromedioDeEdad (a);
	InformarCantidadSociosEnRango (a);
	InformarNumerosSociosOrdenCreciente (a);
	InformarNumerosSociosOrdenDeCreciente (a);
End.
