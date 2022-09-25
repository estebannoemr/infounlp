program prc3p2;
type
  str20 = string[20];
  fecha = record
    ano : integer;
    mes : str20;
    dia : integer;
end;
procedure leer(var cas : fecha);
begin
  writeln('Ingrese el ano del casamiento: ');
  read(cas.ano);
  if (cas.ano <> 2020) then begin
    writeln('Ingrese el mes del casamiento: ');
    read(cas.mes);
    writeln('Ingrese el dia del casamiento: ');
    read(cas.dia);
  end;
end;
var
  fc: fecha;
  casver, cas10: integer;
begin
  casver:= 0;
  cas10:= 0;
  leer(fc);
  while (fc.ano <> 2020) do begin
    if (fc.mes = 'enero') or (fc.mes = 'febrero') or (fc.mes = 'marzo') then
      casver:= casver +1;
    if (fc.dia >= 1) and (fc.dia <= 10) then
      cas10:= cas10 +1;
    leer(fc);
  end;
  writeln('Cantidad de casamientos realizados en verano: ',casver);
  writeln('Cantidad de casamientos realizados en los primeros 10 días de cada mes: ',cas10);
end.