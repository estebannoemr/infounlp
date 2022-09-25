program prc7p10;
type
	cadena = string[50];
  
	cultivo = record
		tipo: cadena;
		hectareas: real;
		meses: integer;
	end;
  
	vector = array [1..20] of cultivo;
  
	empresa = record
		codigo: integer;
		nombre: cadena;
		estatal_privada: cadena;
		ciudad: cadena;
		cultivos: vector;
		cantidad_cultivos: integer;
	end;
  
	lista = ^nodo;
  
	nodo = record
		dato: empresa;
		sig: lista;
	end;

//----------------------------------------------------------------

procedure leerCultivo(var c: cultivo);
begin
	readln(c.hectareas);
	if (c.hectareas <> 0) then begin
		readln(c.tipo);
		readln(c.meses);
	end;
end;

//----------------------------------------------------------------

procedure cargarCultivos (var v: vector; var dL: integer);
var
	c: cultivo;
begin
	dL:= 0;
	leerCultivo(c);
	while (c.hectareas <> 0) and (dL <= 20) do begin
		dL:= dL + 1;
		v[dL]:= c;
		leerCultivo(c);
	end;
end;

//----------------------------------------------------------------

procedure leerEmpresa(var e: empresa);
begin
	readln(e.codigo);
	if (e.codigo <> -1) then begin
		readln(e.nombre);
		readln(e.estatal_privada);
		readln(e.ciudad);
		cargarCultivos(e.cultivos, e.cantidad_cultivos); 
	end;
end;

//----------------------------------------------------------------

procedure agregarAdelante (var l: lista; e: empresa);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= e;
	nuevo^.sig:= l;
	l:= nuevo;
end;

//----------------------------------------------------------------

procedure cargarLista (var l: lista);
var
	e: empresa;
begin
	leerEmpresa(e);
	while (e.codigo <> -1) do begin
		agregarAdelante(l, e);
		leerEmpresa(e);
	end;
end;

//----------------------------------------------------------------

// INCISO B
function cantidadCeros (n: integer) : boolean;
var
	cant: integer;
begin
	cant:= 0;
	while (n <> 0) do begin
		if (n MOD 10 = 0) then
			cant:= cant + 1;
		n:= n DIV 10;    
	end;
	cantidadCeros:= (cant >= 2);
end;

// 

function hayTrigo (v: vector; dL: integer) : boolean;
var
	i: integer;
	encontre: boolean;
begin
	encontre:= false;
	i:= 1;
	while (i <= dL) and not (encontre) do begin
		if (v[i].tipo = 'Trigo') then
			encontre:= true
		else
			i:= i + 1;
	end;
	hayTrigo:= encontre;
end;

//----------------------------------------------------------------

// INCISO C
procedure contarHectareasSoja (v: vector; dL: integer; var total_hectareas, hectareas_soja: real);
var
	i: integer;
begin
	for i:= 1 to dL do begin
		if (v[i].tipo = 'Soja') then
			hectareas_soja:= (hectareas_soja + v[i].hectareas);
		total_hectareas:= total_hectareas + v[i].hectareas;
	end;
end;

//----------------------------------------------------------------

// INCISO D
procedure masTiempoMaiz (v: vector; dL: integer; nombre: cadena; var t_max: integer; var e_max: cadena);
var
	i: integer;
	encontre: boolean;
begin
	encontre:= false;
	i:= 1;
	while (i <= dL) and not (encontre) do begin  //ESTAMOS BUSCANDO 1 SOLO
		if (v[i].tipo = 'Maiz') then
			encontre:= true
		else
			i:= i + 1;
	end;
	
	if (encontre) then begin
		if (t_max < v[i].meses) then begin
			t_max:= v[i].meses;
			e_max:= nombre;
		end;
	end;
end;

//----------------------------------------------------------------

// INCISO E
procedure actualizarMesesGirasol (var v: vector; dL: integer);
var
	i: integer;
begin
	for i:= 1 to dL do begin
		if (v[i].hectareas < 5) and (v[i].tipo = 'Girasol') then
			v[i].meses:= v[i].meses + 1; 
	end;
end;

//----------------------------------------------------------------

procedure procesarInformacion (l: lista; var porc: real; var e_max: cadena);
var
	total_hectareas, hectareas_soja: real;
    t_max: integer;
begin
	t_max:= -1;
	total_hectareas:= 0;
	hectareas_soja:= 0; 
  
	while (l <> nil) do begin
   
		//INCISO B
		if(l^.dato.nombre = 'San Miguel del Monte') and (cantidadCeros(l^.dato.codigo)) and (hayTrigo(l^.dato.cultivos, l^.dato.cantidad_cultivos)) then
			writeln('El nombre de la empresa es: ',l^.dato.nombre);
		
		//INCISO C
		contarHectareasSoja(l^.dato.cultivos, l^.dato.cantidad_cultivos, total_hectareas, hectareas_soja);
		
		// INCISO D
		masTiempoMaiz(l^.dato.cultivos, l^.dato.cantidad_cultivos, l^.dato.nombre, t_max, e_max);
		
		// INCISO E
		if (l^.dato.estatal_privada = 'Privada') then
			actualizarMesesGirasol(l^.dato.cultivos, l^.dato.cantidad_cultivos);
			
		l:= l^.sig;
	end;
  
	porc:= hectareas_soja / total_hectareas * 100;
end;

var
	l: lista;
	porcentaje: real;
	e_max: cadena;
begin
	l:= nil;
	
	cargarLista(l);
	
	procesarInformacion(l, porcentaje, e_max);
	writeln('El porcentaje de hectareas de soja respecto al total de hectareas es: ' ,porcentaje:2:2);
	writeln('La empresa que dedica mas tiempo al cultivo de maiz es: ',e_max);
end.
