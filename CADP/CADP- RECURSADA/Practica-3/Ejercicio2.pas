program Ejercicio2;
type
    rangoDia = 1..31;
    rangoMes = 1..12;

    fecha = record
        dia:rangoDia;
        mes:rangoMes;
        ano:Integer;
    end;

    casamiento = record
        fechaCas:fecha;
    end;
        
procedure leo (var c:casamiento);
begin
    with c do begin
        write('Ingrese ani: ');ReadLn(fechaCas.ano);
        if (fechaCas.ano <> 2020) then begin
            Write('Ingrese dia: ');Read(fechaCas.dia);
            Write('Ingrese mes: ');Read(fechaCas.mes);
        end;
    end;
end;

var
    c:casamiento;
    casVerano,priDias:Integer;
begin
    casVerano:=0;
    priDias:=0;
    leo(c);
    while (c.fechaCas.ano <> 2020) do begin
        if (c.fechaCas.mes <= 3) then
            casVerano:= casVerano + 1;
        if (c.fechaCas.dia <= 10)  then
            priDias:= priDias + 1;
        leo(c);
    end;
    WriteLn('La cantidad de casamientos realizados durante los meses de verano son: ',casVerano);
    WriteLn('La cantidad de casamientos en los primeros 10 dias de cada mes son: ',priDias);
end.