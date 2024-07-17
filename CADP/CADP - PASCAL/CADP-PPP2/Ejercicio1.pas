program Ejercicio1;
type
    RangoGenero = 1..5;

    persona = record
        DNI:Integer;
        apellidoYnombre:String;
        edad:integer;
        codGenero:RangoGenero;
    end;

    lista = ^nodo; 
    nodo = record
        elem:persona;
        sig:lista;
    end;

    vContador = array [RangoGenero] of Integer;

procedure leoPersona (var p:persona);
begin
    ReadLn(p.DNI);
    ReadLn(p.apellidoYnombre);
    ReadLn(p.edad);
    ReadLn(p.codGenero);
end;

procedure cargoNodo (var L:lista; p:persona);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=p;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoLista (L:lista);
var 
    p:persona;
begin
    repeat
        leoPersona(p);
        cargoNodo(L,p);
    until p.DNI = 33555444;
end;

function cumple (DNI:Integer):Boolean;
var
    par,impar,dig:Integer;
begin
    while (DNI <> 0) do begin
        dig:= DNI mod 10;
        if ((dig mod 2)=0) then
            par:=par +1
        else
            impar:= impar +1;
        DNI:= DNI div 10;
    end;
    if (par > impar) then
        cumple:= true
    else 
        cumple:=False
end;

procedure maximos (v:vContador; var max1,max2,cod1,cod2:Integer);
begin
    if (v[i] > max1) then begin
        max2:=max1;
        max1:=v[i];
        cod2:=cod1;
        cod1:=i;
    end
    else 
    if (v[i] > max2) then begin
        max2:=v[i];
        cod2:=i;
    end;
end;

procedure procesoLista (L:lista);
var
    vC:vContador;
    i,cantPersonas,max1,max2,cod1,cod2:Integer;
begin
    for i:= 1 to 5 do 
        vC[i]:=0;

    max1:=-1;
    max2:=-1;
    cantPersonas:=0;
    while (L <> nil) do begin
        if (cumple(L^.elem.codGenero)) then
            cantPersonas:= cantPersonas + 1;
        vC[L^.elem.codGenero] := vC[L^.elem.codGenero] + 1;
        maximos(vC,max1,max2,cod1,cod2);
        L:=L^.sig;
    end;
    WriteLn('Los codigos de genero mas elegidos son:',cod1, ' y ', cod2);
    WriteLn('Los cantidad de personas cuyo DNI contiene mas digitos pares que impares son: ',cantPersonas);
end;

procedure elimino (var L:lista; DNI:Integer; var ok:Boolean);
var
    act,ant:lista;
begin
    ok:=False;
    act:=L;
    while (act <> nil) and (act^.elem.DNI <> DNI) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act <> nil) then begin
        if (act = L) then
            L:=L^.sig
        else 
            ant^.sig:= act^.sig;
        Dispose(act);
        ok:=True;
    end;
end;


var
    L:lista;
    ok:Boolean;
    DNIaEliminar:Integer;
begin
    L:=Nil;
    cargoLista(L);
    procesoLista(L);

    WriteLn('Ingrese DNI a eliminar');
    ReadLn(DNI);
    elimino(L,DNI,ok);
    if (ok) then 
        WriteLn('Se pudo eliminar el DNI de la estructura')
    else 
        WriteLn('No se pudo eliminar el DNI');


end.