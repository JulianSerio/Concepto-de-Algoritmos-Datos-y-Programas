program Ejercicio3;

var 
    num1,num2,num3,aux:Integer;
begin
    WriteLn('Ingrese primer numero');
    ReadLn(num1);
    WriteLn('Ingrese segundo numero');
    ReadLn(num2);
    WriteLn('Ingrese tercer numero');
    ReadLn(num3);
    if (num1 < num2) then
        begin
            aux:= num1;
            num1:= num2;
            num2:= aux;
        end;
    if (num2 < num3) then
        begin
            aux:= num2;
            num2:= num3;
            num3:= aux;
        end; 
    write(num1:2,num2:2,num3:2);   
end.