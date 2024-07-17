program Ejercicio2A;

procedure writes (var a,b:Integer);
begin
    WriteLn('Ingrese valor A');
    ReadLn(a);
    WriteLn('Ingrese valor B');
    ReadLn(b);
end;

var
    a,b,x:Integer;
begin
    writes(a,b);
    x:= a + b;
    WriteLn(x);
end.

