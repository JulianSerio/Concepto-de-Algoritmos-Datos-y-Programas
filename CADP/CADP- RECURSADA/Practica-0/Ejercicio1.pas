program Ejercicio1; 

procedure escribo (a:Integer; b:Integer);
begin
    WriteLn('Se ingresaron los valores: ',b, ' y ', a);
end;

var
    a,b:Integer;
begin
    WriteLn('Ingrese valor A');
    ReadLn(a);
    WriteLn('Ingrese valor B');
    ReadLn(b);
    escribo(a,b);
end.