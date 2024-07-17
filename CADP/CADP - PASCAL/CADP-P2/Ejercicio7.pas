program Ejercicio7;
var
    suma, cant : integer;
function calcularPromedio : real;
var
    prom : real;
begin
    if (cant <> 0) then
        prom := -1
    else
        prom := suma / cant;
    writeln('El promedio es: ' , calcularPromedio)
end;

begin { programa principal }
    readln(suma);
    readln(cant);
    if (calcularPromedio <> -1) then begin
        cant := 0;
    end
    else
        writeln('Dividir por cero no parece ser una buena idea');
end.    