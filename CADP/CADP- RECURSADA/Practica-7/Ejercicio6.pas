program Ejercicio6;
type    
    RangoObjetos = 1..7;
    str = string[20];
    objeto = record
        codObjeto:Integer;
        categoria:RangoObjetos;
        nombre:str;
        distancia:integer;
        nombreDescubridor:str;
        anoDescubrimiento:Integer;
    end;

    lista = ^nodo;
    nodo = record   
        elem:objeto;
        sig:lista;
    end;

    vContador = array [RangoObjetos] of Integer;

procedure leoObjeto (var o:objeto);
begin
    WriteLn('Codigo Objeto: ');ReadLn(o.codObjeto);
    WriteLn('Categoria: ');ReadLn(o.categoria);
    WriteLn('Nombre: ');ReadLn(o.nombre);
    WriteLn('Distancia: ');ReadLn(o.distancia);
    WriteLn('Nombre descubridor: ');ReadLn(o.nombreDescubridor);
    WriteLn('Anio descubrimiento: ');ReadLn(o.anoDescubrimiento);
end;

procedure cargoNodo(var L,ult:lista; o:objeto);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=o;
    aux^.sig:=Nil;
    if (L = nil) then
        L:=aux
    else
        ult^.sig:= aux;
    ult:= aux;
end;

procedure cargoLista (var L:lista);
var
    ult:lista;
    o:objeto;
begin
    leoObjeto(o);
    while (o.codObjeto <> -1) do begin
        cargoNodo(L,ult,o);
        leoObjeto(o);
    end;
end;

procedure maximos (distancia:Integer; codigo:Integer; var cod1,cod2,max1,max2:Integer);
begin
    if (distancia > max1) then begin
        max2:= max1;
        max1:=distancia;
        cod2:= cod1;
        cod1:= codigo;
    end
    else if (distancia > max2) then begin
            max2:= distancia; 
            cod2:= codigo;
    end;
end;

procedure inicializoVC (var v:vContador);
var
    i:Integer;
begin
    for i:= 1 to 7 do begin
        v[i]:=0;
    end;
end;

function cumple (cod:Integer):Boolean;
var
    dig,par,impar:Integer;
begin
    par:=0;impar:=0;
    while (cod <> 0) do begin
        dig:= cod mod 10;
        if ((dig mod 2)=0) then
            par:= par + 1
        else 
            impar:= impar + 1;
        cod:= cod div 10;
    end;
    if (par > impar) then
        cumple:= True
    else 
        cumple:= false;
end;

procedure imprimoVc (v:vContador);
var
    i:Integer;
begin
    for i:= 1 to 7 do begin
        WriteLn('Los objetos observados para la categoria ',i, ' son:', v[i]);
    end;
end;

procedure procesoeInformoLista (L:lista);
var
    vc:vContador;
    max1,max2,cod1,cod2:Integer;
    cantGG:Integer;
begin
    inicializoVC(vc);
    cantGG:=0;max1:=0;max2:=0;
    while (L <> nil) do begin
        maximos(L^.elem.distancia,L^.elem.codObjeto,cod1,cod2,max1,max2);
        if (cumple(L^.elem.codObjeto)) then
            WriteLn(L^.elem.nombre);
        if (L^.elem.nombreDescubridor = 'Galileo Galilei') and (L^.elem.anoDescubrimiento < 1600) then
            cantGG:= cantGG + 1;
        vc[L^.elem.categoria] := vc[L^.elem.categoria] + 1;
        L:= L^.sig;
    end;
    WriteLn('Los mas lejanos son: ',cod1, ' y ',cod2);
    WriteLn('La cantidad de objetos descubiertos por Galileo Galilei en: ',cantGG);
    
end;

var
    L:lista;
begin
    L:=Nil;
    cargoLista(L);
    procesoeInformoLista(L);
end.