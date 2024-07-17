program Ejercicio5;

var
    num,max,min,suma:Integer;
begin
    suma:=0;
    max:=0;
    min:=9999;
    repeat
        WriteLn('Ingrese numero');
        ReadLn(num);

        suma:= suma + num;

        if (num < min) then
            min:=num;
        if (num > max) then
            max:=num;
    until num = 100;

    WriteLn('El numero maximo leido fue el: ',max);
    WriteLn('El numero minimo leido fue el: ',min);
    WriteLn('La suma de todos los numeros es: ',suma);
end.