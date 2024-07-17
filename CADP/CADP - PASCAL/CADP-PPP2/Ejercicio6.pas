program Ejercicio6;
type 
    RangoObjetos = 1..7;
    str = string[20];

    objeto = record
        codigo:Integer;
        categoria:RangoObjetos;
        nombre:str;
        distancia:Integer;
        descubridor:str;
        anoDescubrimiento:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:objeto;
        sig:lista;
    end;

    vObjeto = array [RangoObjetos] of Integer;


//////////////parte  A /////////////////////////////

procedure leoObjeto (var o:objeto);
begin
    ReadLn(o.codigo);
    if (o.codigo <> -1) then begin
        ReadLn(o.categoria);
        ReadLn(o.nombre);
        ReadLn(o.distancia);
        ReadLn(o.descubridor);
        ReadLn(o.anoDescubrimiento);
    end;
end;

procedure cargoNodo (var L,ult ; o:objeto);
var
    aux:lista
begin
    New(aux);
    aux^.elem:=o;
    aux^.sig:=Nil;
    if (L = nil) then
      L:=aux
    else 
        ult^.sig:=aux;
    ult:=aux;
end;

procedure cargoLista (L:lista);
var
    o:objeto;
    ult:lista;
begin
    leoObjeto(o);
    while (o.codigo <> -1) do begin
        cargoNodo(L,ult,o);
        leoObjeto(o);
    end;
end;

/////////////////////////////////////////////

procedure maximos (distancia,codigo:Integer ; var cod1,cod2,max1,max2:Integer);
begin
    if (distancia > max1) then begin
        max2:=max1;
        max1:=distancia;
        cod2:=cod1;
        cod1:=codigo;
    end
    else 
    if (distancia > max2) then begin
        max2:=distancia;
        cod2:=codigo;
    end;
end;

function cumple (cod:Integer): Boolean;
var
    par,impar,dig:Integer;
begin
    while (cod <> 0) do begin
        dig:= cod mod 10;
        if ((dig mod 2)=0) then
            par:= par + 1
        else
            impar:= impar + 1;
        cod:= cod div 10;
    end;    
    if (par > impar) then 
        cumple:=True
    else 
        cumple:=False;
end;

procedure procesoLista (L:lista ; v:vObjeto);
var 
    cod1,cod2,max1,max2,cantGG,i:Integer;
begin
    cantGG:=0;
    while (L <> nil) do begin
        v[L^.elem.categoria] := v[L^.elem.categoria] + 1;
        maximos(L^.elem.distancia,L^.elem.codigo,cod1,cod2,max1,max2);
        if (L^.elem.descubridor = 'Galileo Galilei') and (L^.elem.anoDescubrimiento < 1600) then
            cantGG:= cantGG + 1;
        if (cumple(L^.elem.codigo)) then
            WriteLn(L^.elem.nombre);
        L:=L^.sig;
    end;
    
    for i:= 1 to 7 do 
        WriteLn('La categoria ', i ,' tuvo :', v[i], ' objetos observados ');

    WriteLn('Los codigos de los 2 objetos mas alejados de la tierra son: ',cod1, ' y ', cod2);
end;

var
    v:vObjeto;
    L:lista;
begin
    L:=Nil;
    cargoLista(L);
    procesoLista(L,v);
end.