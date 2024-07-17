program Ejercicio2B;

procedure writes (var a,b:Integer);
begin
    WriteLn('Ingrese valor A');
    ReadLn(a);
    WriteLn('Ingrese valor B');
    ReadLn(b);
end;

var
    a,b:Integer;
begin
    writes(a,b);
    a:= a + b;
    WriteLn(a);
end.