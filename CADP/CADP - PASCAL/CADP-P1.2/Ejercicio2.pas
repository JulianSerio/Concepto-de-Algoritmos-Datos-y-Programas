program Ejercicio2;

var
    nro,max,i:Integer;
begin
    max:=0;
    WriteLn('Ingrese un numero');
    Read(nro);
    for i:= 1 to 10 do 
    begin
        if (nro > max) then
            max:= nro;
        WriteLn('Ingrese otro numero');
        ReadLn(nro);
    end;
    WriteLn('El mayor numero ingresado es el:  ', max);
end.