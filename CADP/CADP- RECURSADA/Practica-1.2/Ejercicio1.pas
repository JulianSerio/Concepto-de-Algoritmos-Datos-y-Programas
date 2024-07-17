program Ejercicio1;
var
    i,suma,numero,acm:Integer;
begin
    suma:=0;acm:=0;
    for i:= 1 to 10 do begin
        WriteLn('Ingrese numero');
        ReadLn(numero);
        suma:= suma + numero;
        if (numero > 5) then
          acm:=acm + 1;
    end;
    WriteLn('El resultado de la suma fue: ',suma);
    WriteLn('La cantidad de numeros mayores a 5 es: ',acm);
end.