program Ejercicio1;

procedure leoDatos (var num1,num2:Integer);
begin
    WriteLn('Ingrese numero 1');
    ReadLn(num1);
    WriteLn('Ingrese numero 2');
    ReadLn(num2);
end;

procedure comparo (num1, num2:Integer);
begin
    if (num1 > num2) then begin 
        WriteLn('El numero 1 es mayor');
    end
    else 
    if (num1 < num2) then begin
        WriteLn('El numero 2 es mayor');
    end
    else 
        WriteLn('Los numeros leidos son iguales');
end;
var
    num1,num2:Integer;
begin
    leoDatos(num1,num2);
    comparo(num1,num2);
end.