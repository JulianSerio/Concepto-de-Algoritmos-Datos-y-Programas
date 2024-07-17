program Ejercicio3;

var
    nombre: String;
    igual7,mayor8,nota:Integer;

begin
    mayor8:=0;
    igual7:=0;
    repeat
        WriteLn('Ingrese nombre');
        ReadLn(nombre);
        WriteLn('Ingrese nota');
        ReadLn(nota);
         if (nota >= 8) then
         begin
            mayor8:= mayor8 + 1
         end
         else if (nota = 7) then
         begin
             igual7:= igual7 + 1
         end;
    until(nombre = 'Zidane Zinedine');
    WriteLn('La cantidad de alumnos aprobados con nota igual o mayor a 8 son: ', mayor8);
    WriteLn('La cantidad de alumnos aprobados con nota igual a 7 son: ', igual7);
end.


