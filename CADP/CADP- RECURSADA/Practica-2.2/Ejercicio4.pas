program Ejercicio4;

procedure leerDatos(var legajo: integer; salario : real); //1er error, salario no esta pasado por referencia por lo tanto no va a ser modificado
begin
    writeln('Ingrese el nro de legajo y el salario');
    read(legajo);
    read(salario);
end;

procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer);
var
    maxSalario : real;
begin
    if (nuevoLegajo > maxLegajo) then begin
        maxLegajo:= nuevoLegajo;           
        maxSalario := nuevoSalario //5to error, la asignacion maxSalario := nuevoSalario no sale del proceso, el proceso no devuelve ningun valor      
    end;
end;

var
legajo, maxLegajo, i : integer; //2do error, maxLegajo no esta inicializado en ningun valor 
salario, maxSalario : real; 

begin
    sumaSalarios := 0;
    for i := 1 to 130 do begin
        leerDatos(salario, legajo); //3er error, mal ubicados los parametros
        actualizarMaximo(legajo, salario, maxLegajo);
        sumaSalarios := sumaSalarios + salario; //6to - 5to error, la variable sumaSalarios no esta declarada 
    end;
    writeln('En todo el mes se gastan ', sumaSalarios,' pesos');
    writeln('El salario del empleado más nuevo es ',maxSalario); //4to error, hay 2 maxSalario, en el ppal y en el proceso actualizarMaximos, si en el ppal se informa maxSalario informara basura
end.
