program Ejercicio3;

procedure writes (var a,b:Real);
begin
    WriteLn('Ingrese valor A');
    ReadLn(a);
    WriteLn('Ingrese valor B');
    ReadLn(b);
end;

var
    a,b,x:Real;
begin
    writes(a,b);
    x:= a / b;
    WriteLn('El resulatado de dividir ',a:2:2,' por ', b:2:2, ' es: ',x:2:2);
end.