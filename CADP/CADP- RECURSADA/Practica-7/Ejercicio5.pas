program Ejercicio5;
type    
    str = string[20];
    rangoCamion = 1..100;

    camion = record
        patente:str; 
        anioFabri:Integer;
        capacidad:Real;
    end;
    
    vCamion = array [rangoCamion] of camion;

    viaje = record
        codViaje:Integer;
        codCamion:rangoCamion;
        distancia:Integer;
        destino:str;
        anioViaje:Integer;
        DNIchofer:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:viaje;
        sig:lista;
    end;

    vContador = array [rangoCamion] of integer;

procedure leoViaje (var v:viaje);
begin
    with v do begin
        WriteLn('Cod viaje: ');ReadLn(codViaje);
        if (codViaje <> -1) then begin
            WriteLn('Cod camion: ');ReadLn(codCamion);
            WriteLn('Destino: ');ReadLn(destino);
            WriteLn('Anio del viaje: ');ReadLn(anioViaje);
            WriteLn('DNI Chofer: ');ReadLn(DNIchofer);
        end;
    end;
end;

procedure cargoNodo (var L:lista; v:viaje);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=v;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoLista (Var L:lista);
var
    v:viaje;
begin
    leoViaje(v);
    while (v.codViaje <> -1) do begin
        cargoNodo(L,v);
        leoViaje(v);
    end;
end;

function impares (DNI:Integer):Boolean;
var
    dig,par,impar:Integer;
begin
    par:=0;impar:=0;
    while (DNI <> 0) do begin
        dig:= DNI mod 10;
        if ((dig mod 2)=0) then 
            par:= par + 1
        else 
            impar:= impar + 1;
        DNI:= DNI div 10;
    end;
    impares := (par = 0);
end;

procedure inicializoVc (var vC:vContador);
var
    i:Integer;
begin
    for i:= 1 to 100 do begin
        vC[i]:=0;
    end;
end;

procedure MAXMIN (v:vCamion; vC:vContador; var min,max:integer ; var patMIN,patMAX:str);
var 
    i:Integer;
begin
    for i:= 1 to 100 do begin
        if (vC[i] > max) then begin
            max:=vC[i];
            patMAX:=v[i].patente;
        end;
        if (vC[i] < min) then begin
            max:=vC[i];
            patMIN:=v[i].patente; 
        end;

    end;
end;


procedure procesoLista (L:lista; v:vCamion);
var
    min,max,cantViajes:Integer;
    patMIN,patMAX:str;
    vC:vContador;
begin
    inicializoVc(vC);
    min:=9999;max:=0;cantViajes:=0;
    while (L <> NIL) do begin
        if (impares(L^.elem.DNIchofer)) then
            WriteLn(L^.elem.codViaje);
        if (v[L^.elem.codCamion].capacidad > 30.5) and ((L^.elem.anioViaje - v[L^.elem.codCamion].anioFabri) > 5 ) then 
            cantViajes:= cantViajes + 1;
        vC[L^.elem.codCamion] := vC[L^.elem.codCamion] + L^.elem.distancia;
        L:=L^.sig;
    end;
    MAXMIN(v,vC,min,max,patMIN,patMAX);
    WriteLn(patMIN, ' y ', patMAX);
    WriteLn(cantViajes);
end;
var
    L:lista;
    v:vCamion;
begin
    cargoCamiones(v);
    L:= Nil;
    cargoLista(L);
    procesoLista(L,v);
end.