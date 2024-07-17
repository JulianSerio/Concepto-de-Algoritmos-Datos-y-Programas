program Ejercicio2A;

var
    nro,max:Integer;
begin
    max:=0;
    Read(nro);
    while (nro <> 0) do begin
        if (nro > max) then
            max:= nro;
        ReadLn(nro);
    end;
    WriteLn('El mayor numero ingresado es el:  ', max);
end.