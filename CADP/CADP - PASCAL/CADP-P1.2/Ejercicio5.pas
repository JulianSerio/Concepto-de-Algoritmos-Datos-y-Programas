program Ejercicio5;

var
    max,min,num,suma:Integer;
begin
    repeat
        suma:=0;
        WriteLn('Ingrese numeros');
        Read(num);
        if (num > max) then
        begin
            max:=num;
            WriteLn('Se ha encontrado un nuevo maximo');
        end
        else if (num < min) then;
            min:= num;
            WriteLn('Se ha encontrado un nuevo minimo');
        suma:= suma + num;
    until num = 100;
    WriteLn('Maximo ',max);
    WriteLn('Minimo ',min);
    WriteLn('La suma de todos los numeros es: ',suma);
end.

if (num > max) then
    max:=num;
    WriteLn('Se ha encontrado un nuevo maximo');
else if (num < min) then;
        min:= num;
        WriteLn('Se ha encontrado un nuevo minimo');
suma:= suma + num;
