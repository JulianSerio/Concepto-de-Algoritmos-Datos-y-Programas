program Ejercicio3;
type
    subrango = 1..10;

var
    nombre:String;
    nota:Integer;
    ochoomayor,siete:subrango;
begin
    repeat
        WriteLn('Ingrese nombre del alumno');
        ReadLn(nombre);
        WriteLn('Ingrese nota en el modulo de epa');
        ReadLn(nota);

        if (nota >= 8) then
            ochoomayor:= ochoomayor + 1;
        if (nota = 7) then
            siete:= siete + 1;
          
    until nombre = 'Zidane Zinedine';

    WriteLn('La cantidad de alumnos aprobados (nota 8 o mayor) es: ',ochoomayor);
    WriteLn('La cantidad de alumnos aprobados con 7 son: ',siete);
end.