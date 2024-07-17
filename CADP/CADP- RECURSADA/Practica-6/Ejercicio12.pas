program Ejercicio12;

type 
    dispositivo = record
        versionA:str;
        tamanoPantalla:Real;
        RAM:Integer;
    end;    //ORDENADO POR VERSION DE ANDROID

    lista = ^nodo;
    nodo = record
        elem:dispositivo;
        sig:lista;
    end;

procedure procesoLista (L:lista);
var
    versionActual:str;
    cantVersion:Integer;
    cantPulRam:Integer;
    cant:Integer;
    pulgadas:real;
    prom:real;
begin
    cantPulRam:=0;
    pulgadas:= 0;
    cant:= 0;
    while (L <> nil) do begin
        versionActual:= L^.elem.versionA;
        cantVersion:=0;
        while (L <> nil) and (versionActual = L^.elem.versionA) do begin
            cantVersion:= cantVersion + 1;
            pulgadas:= pulgadas + L^.elem.tamanoPantalla;
            cant:= cant + 1;
            if (L^.elem.tamanoPantalla <= 5) and (L^.elem.RAM > 3 ) then 
                cantPulRam:= cantPulRam + 1;
            L:= L^.sig;
        end;
        WriteLn('La cantidad de dispositivos para esta version de android es: ',cantVersion);
    end;
    prom:= pulgadas / cant;
    WriteLn('El tamano promedio de pantalls es: ',prom);
    WriteLn('La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas es: ',cantPulRam);
end;
var
    L:lista;
begin
    L:= nil;
    //cargoLista(L); se dispone
    procesoLista(L);
end.