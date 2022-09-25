program puntero7;
 const
    dimF=10;    
type
    str50=String[50];
    
    vector= array [1..dimF] of str50;       //510 con dimF=10
    //str50 (50B+1B=51B) * dimF(10)=510
var
    ciudad:vector;
    i:integer;
begin
    WriteLn('El tamanio de memoria que se requiere es de: ',SizeOf(ciudad));
    for i:=1 to dimF do
    begin
        readln(ciudad[i]);    
    end;
end.
