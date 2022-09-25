program prc3p1b;
type
  str20 = string[20];
  alumno = record
    codigo : integer;
    nombre : str20;
    promedio : real;
end;
procedure leer(var alu : alumno);
begin
  writeln('Ingrese el código del alumno');
  read(alu.codigo);
  if (alu.codigo <> 0) then begin
    writeln('Ingrese el nombre del alumno: '); read(alu.nombre);
    writeln('Ingrese el promedio del alumno: '); read(alu.promedio);
  end;
end;
{ declaración de variables del programa principal }
var
  a : alumno;
  aux: Integer;
  amax:real;
  nmax: string;
{ cuerpo del programa principal }
begin
  amax:= -1;
  nmax:= 'a';
  leer(a);
  while(a.codigo <> 0) do begin
    aux:= aux + 1;
    if(a.promedio > amax) then begin
      amax:= a.promedio;
      nmax:= a.nombre;
    end;
    leer(a);
  end;
  writeln('Cantidad de alumnos leidos: ',aux);
  writeln('Nombre del alumno con mejor promedio: ',nmax);
end.