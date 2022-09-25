program prc3p3;
type
  str20 = string[20];
  escuela = record
    cue : integer;
    nombre : str20;
    doc : integer;
    alum : integer;
    loc : str20;
end;
procedure leer(var esc : escuela);
begin
  writeln('Ingrese el Codigo unico de establecimiento: ');
  readln(esc.cue);
  writeln('Ingrese el nombre del establecimiento: ');
  readln(esc.nombre);
  writeln('Ingrese la cantidad de docentes: ');
  readln(esc.doc);
  writeln('Ingrese la cantidad de alumnos: ');
  readln(esc.alum);
  writeln('Ingrese la localidad del establecimiento: ');
  readln(esc.loc);
end;

function relacion(var cantalum : integer; var cantdoc : integer) : real;
begin
  relacion:= cantalum / cantdoc;
end;

var
  es: escuela;
  i, cantlp, cmax1, cmax2: integer;
  prop, pmax1, pmax2: real;
  npmax1, npmax2: str20;
begin
  pmax1:= 9999;
  cmax1:= 0;
  cantlp:= 0;
  npmax1:= 'a';
  for i:= 1 to 2 do begin
    leer(es);
    prop:= relacion(es.alum, es.doc);
    if (es.loc = 'La Plata') then
      if (prop > 23.435) then
        cantlp:= cantlp + 1;
    if (prop < pmax1) then begin
      pmax2:= pmax1;
      pmax1:= prop;
      cmax2:= cmax1;
      cmax1:= es.cue;
      npmax2:= npmax1;
      npmax1:= es.nombre;
    end
    else if (prop < pmax2) then begin
      pmax2:= prop;
      cmax2:= es.cue;
      npmax2:= es.nombre;
    end;
  end; 
  writeln('Cantidad de escuelas de La Plata con una relacion de alumnos por docente superior a la sugerida por UNESCO: ',cantlp);
  writeln('CUE de la escuela con mejor relacion entre docentes y alumnos: ',cmax1, ' cuyo nombre es: ',npmax1);
  writeln('CUE de la SEGUNDA escuela con mejor relacion entre docentes y alumnos: ',cmax2, ' cuyo nombre es: ',npmax2);
end.