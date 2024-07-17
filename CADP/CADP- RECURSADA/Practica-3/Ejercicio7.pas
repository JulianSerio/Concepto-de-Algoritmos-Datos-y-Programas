program Ejercicio7;

type 
    str = String[20];
    centro = record
        nombre:str;
        universidad:str;
        cantInvestigadores:Integer;
        cantBecarios:Integer;
    end;

procedure leoDatos (var c:centro);
begin
    WriteLn('Ingrese cantidad de investigadores'); ReadLn(c.cantInvestigadores);
    if (c.cantInvestigadores <> 0) then begin
        WriteLn('Ingrese cantidad de becarios'); ReadLn(c.cantBecarios);
        WriteLn('Ingrese nombre del centro'); ReadLn(c.nombre);
        WriteLn('Ingrese universidad'); ReadLn(c.universidad);
    end;
end;

procedure maximo (universidad:str;investigadores:Integer; var max:Integer; var uniMax:str);
begin
    if (investigadores > max) then begin
        max:= investigadores;
        uniMax:= universidad;
    end;
end;

procedure minimos (centro:str; Becarios:Integer; var min1,min2:Integer;var centro1, centro2:str);
begin
    if (Becarios < min1) then begin
        min2:=min1;
        min1:=Becarios;

        centro2:= centro1;
        centro1:= centro;
    end
    else if (Becarios < min2) then begin
        min2:=Becarios;
        centro2:=centro;
    end;
end;

var
    c:centro;
    UniActual,uniMax,centro1,centro2:str;
    cantCentrosXuni,max,min1,min2:Integer;
begin
    max:=0;
    min1:=9999;
    min2:=9999;
    leoDatos(c);
    while (c.cantInvestigadores <> 0) do begin
        UniActual:= c.universidad;
        cantCentrosXuni:=0;
        while ((c.cantInvestigadores <> 0) and (UniActual = c.universidad)) do begin
            cantCentrosXuni:= cantCentrosXuni + 1;
            leoDatos(c);
        end;
        maximo(UniActual,c.cantInvestigadores,max,uniMax);
        minimos(c.nombre,c.cantBecarios,min1,min2,centro1,centro2);
       WriteLn('Para la ',UniActual,' hay: ',cantCentrosXuni,' centros');
    end;
    WriteLn('Universidad con mayor cantidad de investigadores en sus centros es: ',uniMax);
    WriteLn('Los dos centros con menor cantidad de becarios: ',centro1, ' y ',centro2); 


end.
