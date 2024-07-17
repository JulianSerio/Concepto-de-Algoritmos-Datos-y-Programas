program Ejercicio1;
type
    str20 = string[20];
    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
    end;

procedure leer(var alu : alumno);
begin
    writeln('Ingrese el código del alumno');
    ReadLn(alu.codigo);
    if (alu.codigo <> 0) then begin
        writeln('Ingrese el nombre del alumno'); readln(alu.nombre);
        writeln('Ingrese el promedio del alumno'); ReadLn(alu.promedio);
    end;
end;

procedure maximos (nombreAlu:str20 ;promedio:real; var nombre:str20; var max:Real);
begin
    if (promedio > max) then begin
        max:=promedio;
        nombre:= nombreAlu;
    end;
end;
{ declaración de variables del programa principal }
var
    a : alumno;
    count:Integer;
    max:Real;
    nombre:str20;
{ cuerpo del programa principal }
begin
    max:=0;
    count:=0;
    leer(a);
    while (a.codigo <> 0) do begin
        maximos(a.nombre,a.promedio,nombre,max);
        count:= count + 1;
        leer(a);
    end;
    WriteLn('La cantidad de alumnos leidas fue: ',count);
    WriteLn('El alumno con mejor promedio es: ',nombre);
end.