program Tema1;
type
    rangoPartos = 1..12;
    str = string[20];
    vPartos = array [rangoPartos] of Integer;

    hembra = record
        nombre:str;
        nroID:Integer;
        anioNacimiento:Integer;
        cantPartos:rangoPartos;
        cantCrias:vPartos;
    end;

    lista = ^nodo;
    nodo = record
        elem:hembra;
        sig:lista;
    end;

    hembrasALoSumo = record
        nombre:str;
        nroID:Integer;
        anioNacimiento:Integer;
    end;

    lista2 = ^nodo2;
    nodo2 = record
        elem:hembrasALoSumo;
        sig:lista2;
    end;

function ALoSumo (dimL:Integer; v:vPartos):Integer;
var
    i:Integer;
    cont:Integer;
begin
    cont:=0;
    for i:= 1 to dimL do begin
        cant:= cant + v[i];
    end;
end;
 
procedure insertarOrd (var L:lista2; h:hembrasALoSumo);
var
    ant,aux,act:lista2;
begin
    New(aux);
    aux^.elem:=h;
    act:=L;
    ant:=L;
    while (act <> nil) and (act^.elem.nombre < h.nombre) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (ant = act) then
        L:=aux
    else    
        ant^.sig:=aux;
    aux^.sig:=act;
end;

procedure recorroLista (L:lista; var L2:lista2);
var
    cant:Integer;
    h:hembrasALoSumo;
begin
    L2:=Nil;
    while (L <> nil) do begin
        cant:= ALoSumo(L^.elem.cantPartos, L^.elem.cantCrias);
        if (cant <= 15) then begin
            h.nombre := L^.elem.nombre;
            h.nroID := L^.elem.nroID;
            h.anioNacimiento:= L^.elem.anioNacimiento;
            insertarOrd(L2,h);
        end;
        L:=L^.sig;
    end;
end;

function moduloB (L:lista2;nombre:str):Integer;
begin
    while (L <> nil) and (L^.elem.nombre <> nombre) do begin
        L:=L^.sig;
    end;
    if (L = nil) then
        moduloB:=-1
    else
        moduloB:=L^.elem.nroID;
end;

var
    L:lista;
    L2:lista2;
    nombre:str;
    nroID:Integer;
begin
    L:=Nil;
    cargoLista(L);
    recorroLista(L,L2);

    Read(nombre);
    nroID:=moduloB(L,nombre);
    WriteLn(nroID);

end.