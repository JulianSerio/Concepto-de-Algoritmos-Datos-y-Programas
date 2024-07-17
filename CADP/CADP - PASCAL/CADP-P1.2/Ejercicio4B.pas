program Ejercicio4B;

var
    num,min1,min2:Integer;
begin
    num:= 1;
    min1:=32767;
    min2:=32767;
    while num <> 0 do
        begin
            writeLn('Ingrese numeros');
            ReadLn(num);
            if (num < min1) and (num <> 0) then
            begin
                min1:=num;
                WriteLn('Se ha ingresado nuevo minimo');        
            end;
            if ((num < min2) and (num > min1)) and (num <> 0) then 
            begin
                min2:= num;
                WriteLn('Se ha ingresado un nuevo segundo minimo');
            end;
        end;
    WriteLn('Primer minimo ', min1);
    WriteLn('Segundo minimo ', min2);
end.