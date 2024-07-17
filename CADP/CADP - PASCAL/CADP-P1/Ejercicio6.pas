program Ejercicio6;

var
    cantAlumnos,promedio65,legajo,destacados:Integer;
    promedio,porcentaje:Real;
    menosuno: Boolean;
begin
    cantAlumnos:=0;
    promedio65:=0;
    destacados:=0;
    promedio:=0;
    legajo:=0;
    
    while (legajo <> -1) do                            //MIENTRAS LEGAJO SEA DIFERENTE A -1
        begin
            WriteLn('Introducir numero de legajo'); //LEO EL LEGAJO Y EL PROMEDIO
            ReadLn(legajo);
            if (legajo = -1) then
                begin
                    menosuno:= True;
                end 
            else
                begin
                    WriteLn('Introducir promedio');
                    ReadLn(promedio);
                    cantAlumnos:= cantAlumnos + 1;
                     if (promedio > 8.5) and (legajo < 2500) then
                        begin
                            destacados:= destacados + 1;
                        end
                    else if (promedio > 6.5) then
                        promedio65:= promedio65 + 1;
                end
        end;
    porcentaje:= (destacados*100) / cantAlumnos;        //PORCENTAJE DE ALUMNOS CON PROMEDIO >8,5
    WriteLn('La cantidad de alumnos leida fue de: ',cantAlumnos);
    WriteLn('La cantidad de alumnos con promedio mayor de 6.5 es de: ', promedio65);
    WriteLn('El porcentaje de alumnos con promedio mayor a 8.5 es de: ',porcentaje:1:2 );
end.