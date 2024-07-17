program Ejercicio5A;

function esDoble (numA,numB:Integer): Boolean;
begin
    esDoble:=(numB=numA*2);
end;

var
    num1,num2:Integer;
begin
    WriteLn('Ingrese primer numero');
    ReadLn(num1);
    WriteLn('Ingrese segundo numero');
    ReadLn(num2);
    esDoble(num1,num2);
    if (esDoble(num1,num2)) then
    begin
        WriteLn('Es el doble');
    end
    else 
        WriteLn('No es el doble')
end.