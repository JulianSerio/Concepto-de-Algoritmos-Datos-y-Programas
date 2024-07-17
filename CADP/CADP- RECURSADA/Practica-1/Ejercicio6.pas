program Ejercicio6;

procedure leoDatos (var legajo:Integer; var prom:Real);
begin
    WriteLn('Ingrese numero de legajo del alumno');
    ReadLn(legajo);
    if (legajo <> -1) then begin
        WriteLn('Ingrese promedio del alumno');
        ReadLn(prom);
    end;
end;

procedure condicion (legajo: integer; prom: real; var seis:integer;var destacados:Real);
begin
    if (prom > 6.5) then
        seis:= seis + 1;
    if ((prom > 8.5) and (legajo < 2500)) then 
        destacados:= destacados + 1;
end;

var
    legajo,seis,cant:Integer;
    destacados,prom:Real;
begin
    seis:=0;
    destacados:=0;
    cant:=0;
    leoDatos(legajo,prom);
    while (legajo <> -1) do begin
        cant:= cant + 1;
        condicion(legajo,prom,seis,destacados);
        leoDatos(legajo,prom);
    end;

    destacados:= (destacados * 100) / cant;

    WriteLn('la cantidad de alumnos leidos es de: ',cant);
    WriteLn('La cantidad de alumnos con promedio mayor a 6.5 es: ', seis);
    WriteLn('El porcentaje de alumnos con promedio mayor a 8.5 y legajo menor a 2500 es: ', destacados:0:2,'%');

end.