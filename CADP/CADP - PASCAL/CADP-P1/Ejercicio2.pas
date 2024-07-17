program Ejercicio2;

var 
    num:Real;
begin
    WriteLn('Ingrese numero');
    ReadLn(num);
    if (num < 0) then
        num:= (num * -1);
    Write('El valor absoluto del numero ingresado es:',('|'),Abs(num):0:0,('|'));
end.