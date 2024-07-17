program Tema2; 
type

    rangoPartos = 1..10;
    str = string[20];
    vCrias = array [rangoPartos] of Integer; 

    coneja = record
        cod:Integer;
        anioNacimiento:Integer;
        nombre:str;
        cantPartos:rangoPartos;
        cantCriasxParto:vCrias;
    end;

    listaCone = ^nodoCone;
    nodoCone = record
        elem:coneja;
        sig:listaCone;
    end;

    conejas5crias = record
        codigo:Integer;
        nombre:str;
        anioNacimineto:Integer;
    end;
    
    listaCone5 = ^nodoCone5;
    nodoCone5 = record
        elem:conejas5crias;
        sig:listaCone5;
    end;

procedure cargoNodo (var L:listaCone5; c:conejas5crias);
var
    aux:listaCone5;
begin
    New(aux);
    aux^.elem:=c;
    aux^.sig:=L;
    L:=aux;
end;


function promedio (dimL:integer;v:vCrias):Real;
var
    i,suma:Integer;
begin
    suma:=0;
    for i:= 1 to dimL do begin
        suma:= suma + v[i];
    end;
    promedio :=  suma / dimL;
end;


procedure recorroLista (L:listaCone; var L2:listaCone5);
var
    c5:conejas5crias;
    prom:Real;
begin   
    L2:=Nil;
    while (L <> nil) do begin
        prom:= promedio(L^.elem.cantPartos,L^.elem.cantCriasxParto);
        if (prom > 5) then begin
            L2^.elem.codigo := c5.codigo;
            L2^.elem.nombre := c5.nombre;
            L2^.elem.anioNacimineto := c5.anioNacimineto;
            cargoNodo(L2,c5);
        end;
        L:= L^.sig;
    end;
end;

procedure recorroLista2 (L:listaCone5);
begin
    while (L <> nil) do begin
        if ((L^.elem.codigo mod 2)=0) and (L^.elem.anioNacimineto < 2016) then
            WriteLn(L^.elem.nombre);
        L:=L^.sig;    
    end;
end;

function maximoCrias (L:listaCone;cod:Integer):Integer;
var
    max,i:Integer;
begin
    while (L <> nil) and (L^.elem.codigo <> cod) do
        L:=L^.sig;
    if (L = nil) then begin
        max:=-1;
        maximoCrias:=max;
    end
    else
        max:=0;
        for i:= 1 to L^.elem.cantPartos do begin
            if (L^.elem.cantCriasxParto[i] > max) then
                max:=L^.elem.cantCriasxParto[i];
        end;
end;

var
    L:listaCone;
    L2:listaCone5;
    cod,max:Integer;
begin
    L:=Nil;
    cargoConejas(L); // se dispone
    recorroLista(L);
    recorroLista2(L2);


    WriteLn('Ingrese codigo de coneja');ReadLn(cod);
    max:=maximoCrias(cod);
    WriteLn(max);
end.