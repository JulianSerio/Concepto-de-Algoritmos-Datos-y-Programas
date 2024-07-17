program Tema3;

type
    rangoPartos = 1..20;
    str = string[20];
    vPartos = array [rangoPartos] of Integer;

    conejas = record
        nroID:Integer;
        anioNacimiento:Integer;
        raza:str;
        cantPartos:rangoPartos;
        cantCriasxParto:vPartos
    end;

    lista = ^nodo;
    nodo = record   
        elem:conejas;
        sig:lista;
    end;

    conejas8crias = record
        nroID:Integer;
        raza:str;
        anioNacimiento:Integer;
    end;

    lista2 = ^nodo2;
    nodo2 = record
        elem:conejas8crias;
        sig:lista2;
    end;


function AlgunParto (dimL:Integer; v:vPartos);
var
    i:Integer;
    cant:Integer;
begin
    cant:=0;
    for i:= 1 to dimL do begin
        if (v[i] > 8) then
            cant:= cant + 1;
    end;
    AlgunParto:=cant;
end;

procedure agregarAdelante (var L:lista2; c:conejas8crias);
var
    aux:lista2;
begin
    New(aux);
    aux^.elem:=c;
    aux^.sig:= L;
    L:=aux;
end;


procedure recorroLista (L:lista; var L2:lista2);
var
    c:conejas8crias;
    cant:Integer;
begin
    L2:=Nil;
    while (L <> nil) do begin
        cant:= AlgunParto(L^.elem.cantPartos,L^.elem.cantCriasxParto);
        if (cant > 0) then begin
            c.nroID:= L^.elem.nroID;
            c.raza:= L^.elem.raza;
            c.anioNacimiento:= L^.elem.anioNacimiento;
            agregarAdelante(L2,c);
        end;
        L:=L^.sig;
    end;
end;

function cumple (cod:Integer):Boolean;
var
    dig:Integer;
begin
    dig:= cod mod 10;
    if (dig = 0) then
        cumple:=True
    else
        cumple:=False;
end;

procedure recorroLista2 (l:lista2);
var
    cantConejas2018:Integer;

begin
    cantConejas2018:=0;
    while (L <> nil) do begin
        if (L^.elem.anioNacimiento = 2018) and (cumple(L^.elem.nroID)) then 
            cantConejas2018:= cantConejas2018 + 1;
        L:=L^.sig;
    end;
    WriteLn(conejas8crias);
end;

function puntoC (L:lista; cod:Integer):Real;
var
    i,suma:Integer;
begin
    suma:=0;
    while (L <> nil) and (L^.elem.nroID <> cod) do begin
        L:=L^.sig
    end;
    if (L = nil) then
        puntoC:= -1
    else begin
        for i:= 1 to L^.elem.cantPartos do begin
            suma:= suma + v[i];
        end;
        puntoC:= suma / L^.elem.cantPartos;
    end;
end;

var
    L:lista;
    L2:lista2;
    cod:Integer;
    prom:Real;
begin
    L:lista;
    cargoLista(L); //se dispone
    recorroLista(L,L2);
    recorroLista2(L2);

    Read(cod);
    prom:= puntoC(L,cod);
    Write(prom);
end.