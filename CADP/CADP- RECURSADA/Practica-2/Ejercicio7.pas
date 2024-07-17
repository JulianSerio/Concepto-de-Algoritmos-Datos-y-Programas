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
   
    calcularPromedio:= prom; //a
end;

begin { programa principal }
readln(suma);
readln(cant);
if (calcularPromedio <> -1) then begin
    cant := 0;
    writeln('El promedio es: ' , calcularPromedio); //b
end                                                
else
 writeln('Dividir por cero no parece ser una buena idea');
end.                                                                          //c)  i) arroja error
                                                                              //    iii) imprime el promedio es: 1.9034, dividir por 
                                                                              //        cero no parece buena idea
                                                                              //    ii)Dividir por cero no parece buena idea 