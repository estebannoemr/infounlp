program puntero6;
 const
    max=1000;    
type
    st=String[49];
    
    vector = array [1..max] of st;
var
    v: vector;
    i: integer;
begin
    WriteLn('El tamanio de memoria que se requiere es de: ',SizeOf(v));
    for i:=1 to max do begin
        readln(v[i]);    
    end;
end.