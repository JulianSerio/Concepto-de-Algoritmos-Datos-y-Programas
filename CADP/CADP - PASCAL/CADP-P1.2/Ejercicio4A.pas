program Ejercicio4A;

var
     num,min1,min2:Integer;
begin
    min1:=32767;
    min2:=32767;
    repeat 
        WriteLn('Ingrese numeros');
        ReadLn(num);
            if (num < min1) then
                begin
                    min1:=num;
                    WriteLn('Se ha ingresado nuevo minimo');        
                end;
            if (num < min2) and (num > min1) then 
                begin
                    min2:= num;
                    WriteLn('Se ha ingresado un nuevo segundo minimo');
                end;
    until num = 0;
    WriteLn('Primer minimo ', min1);
    WriteLn('Segundo minimo ', min2);
end.