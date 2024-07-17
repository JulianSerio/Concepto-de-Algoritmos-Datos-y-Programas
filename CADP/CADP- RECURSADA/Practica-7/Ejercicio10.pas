program Ejercicio10;
const
    DIMF = 20;
type
    str = string[20];

    cultivo = record    
        tipo:str;
        cantHec:Integer;
        cantMesesCicloCultivo:Integer;
    end;

    vCultivos = array [1..DIMF] of cultivo;

    empresa = record
        codigo:Integer;
        nombre:str;
        condicion:str;
        ciudadRadicada:str;
        cultivos:vCultivos;
        dimL:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:empresa;
        sig:lista;
    end;

procedure leoCultivos (var c:cultivo);
begin
    with c do begin
        WriteLn('Hectarias: ');ReadLn(cantHec);
        if (cantHec <> 0) then begin
            WriteLn('Tipo de cultivo: ');ReadLn(tipo);
            WriteLn('Cantidad de meses por ciclo de cultivo: ');ReadLn(cantMesesCicloCultivo);
        end;
    end;
end;

procedure cultivos (var v:vCultivos; var dimL:Integer);
var
    c:cultivo;
begin
    dimL:=0;
    leoCultivos(c);
    while (dimL < DIMF) and (c.cantHec <> 0) do begin
        dimL:= dimL + 1;
        v[dimL]:=c;
        leoCultivos(c);    
    end;
end;

procedure leoEmpresa (var e:empresa);
begin
    with e do begin
        WriteLn('Codigo: ');ReadLn(codigo);
        if (codigo <> -1 ) then begin
            WriteLn('Nombre: ');ReadLn(nombre);
            WriteLn('Condicion: ');ReadLn(condicion);
            WriteLn('Ciudad Radicada: ');ReadLn(ciudadRadicada);
            cultivos(cultivo,dimL); //Syntax error, ";" expected but "(" found ??????
        end;
    end;
end;

procedure cargoNodo (var L:lista; e:empresa);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=e;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoLista (var L:lista);
var
    e:empresa;
begin
    leoEmpresa(e);
    while (e.codigo <> -1) do begin
        cargoNodo(L,e);
        leoEmpresa(e);
    end;
end;

function dosCeros (cod:Integer):Boolean;
var 
    cant0,dig:Integer;
begin
    cant0:=0;
    while (cod <> 0) do begin
        dig:= cod mod 10;
        if (dig = 0) then
            cant0:= cant0 + 1;
        cod:= cod div 10;
    end;
    dosCeros:= (cant0 >= 2);
end;

procedure maximo (tiempo:Integer; nombre:str; var max:Integer; var nombreEmpresa:str);
begin
    if (tiempo > max) then begin
        max:= tiempo;
        nombreEmpresa:= nombre;
    end;
end;

procedure procesoLista (L:lista);
var
    cantHec,tiempo,totalHec,i,maxT:Integer;
    porcentaje:real;
    nombreEmpresa:str;
begin
    cantHec:=0;
    maxT:=0;
    tiempo:=0;
    while (L <> nil) do begin
        for i:= 1 to L^.elem.dimL do begin
            totalHec:= totalHec + L^.elem.cultivos[i].cantHec;

            if (L^.elem.ciudadRadicada = 'San Miguel del Monte') and (L^.elem.cultivos[i].tipo = 'Trigo') and (dosCeros(L^.elem.codigo))then 
                WriteLn(L^.elem.nombre); //b

            if (L^.elem.cultivos[i].tipo = 'Soja') then
                cantHec:= cantHec + L^.elem.cultivos[i].cantHec; //c

            if (L^.elem.cultivos[i].tipo = 'Trigo') then
                tiempo:= tiempo + L^.elem.cultivos[i].cantMesesCicloCultivo; //d 

            if (L^.elem.cultivos[i].tipo = 'Girasol') and (L^.elem.cultivos[i].cantHec < 5) and (L^.elem.condicion = 'Privada') then
                L^.elem.cultivos[i].cantMesesCicloCultivo:= L^.elem.cultivos[i].cantMesesCicloCultivo + 1; //e
            maximo(tiempo,maxT,L^.elem.nombre,nombreEmpresa);
            L:=L^.sig;
        end;
    end;
    porcentaje:= (cantHec / totalHec) * 100;
    WriteLn('La cantidad de hect con soja ',cantHec ,' y su porcentaje con respecto al total es: ',porcentaje);
    WriteLn('La empresa que mas tiempo dedica al cultivo de trigo es: ',nombreEmpresa);
end;
var
    L:lista;
begin
    L:=nil;
    cargoLista(L);
    procesoLista(L);
end.