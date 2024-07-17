program ejercicio1p7;
type 
    str = string[30];
    rangoGeneros = 1..5; 

    persona = record
        DNI:Integer;
        apellidoYnombre:str;
        edad:Integer;
        codGenero:rangoGeneros
    end;

    lista = ^nodo;
    nodo = record
        elem:persona;
        sig:lista;
    end;
    
    vContador = array [rangoGeneros] of Integer;

procedure leoPersona (var p:persona);
begin
    with p do begin
        WriteLn('DNI: ');ReadLn(DNI);
        WriteLn('Apellido y Nombre: ');ReadLn(apellidoYnombre);
        WriteLn('Edad: ');ReadLn(edad);
        WriteLn('Codigo de genero');ReadLn(codGenero);
    end;
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

procedure cargoLista (var L:lista);
var
    p:persona;
begin
    repeat  
        leoPersona(p);
        cargoNodo(L,p);
    until p.DNI = 33555444;
end;

function descompongo (DNI:Integer):Boolean;
var
    pares,impares,dig:Integer;
begin
    pares:=0;impares:=0;
    while (DNI <> 0) do begin
        dig:= DNI mod 10;
        if ((dig mod 2)=0) then 
            pares:= pares + 1
        else
            impares:= impares + 1;
        DNI:= DNI div 10;
    end;
    if (pares > impares) then
        descompongo:= True
    else
        descompongo:= False;
end;

procedure CodigoMasElegidos (v:vContador; var max1,max2,cod1,cod2:integer);
var
    i:Integer;
begin
    for i:= 1 to 5 do begin
        if (v[i] > max1) then begin
            max2:= max1;
            max1:= v[i];
            cod2:= cod1;
            cod1:= i;
        end
        else if (v[i] > max2) then begin
            max2:= v[i];
            cod2:= i;
        end;
    end;
end;

procedure inicializoVC (var v:vContador);
var
    i:Integer;
begin
    for i:= 1 to 5 do begin
        v[i]:=0;
    end;
end;

procedure procesoEinformo (L:lista; var vC:vContador);
var
    cantMasParesImpares,max1,max2,cod1,cod2:Integer;
begin
    cantMasParesImpares:=0;max1:=0;max2:=0;
    inicializoVC(vC);
    while (L <> nil) do begin
        if (descompongo(L^.elem.DNI)) then
            cantMasParesImpares:= cantMasParesImpares + 1;
        vC[L^.elem.codGenero]:= vC[L^.elem.codGenero] + 1;
        L:=L^.sig;
    end;
    CodigoMasElegidos(vC,max1,max2,cod1,cod2);
    WriteLn(cod1,cod2);
    WriteLn(cantMasParesImpares);
end;

procedure elimino (var L:lista; DNIeliminar:Integer; var exito:Boolean);
var
    ant,act:lista;
begin
    exito:= False;
    act:= L;
    while (act <> nil) and (act^.elem.DNI <> DNIeliminar) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act <> nil) then begin
        exito:= true;
        if (act = L) then L:= act^.sig
                    else ant^.sig:= act^.sig;
        Dispose(act);
    end;
end;


var
    L:lista;
    v:vContador;
    DNIeliminar:Integer;
    exito:Boolean;
begin
    L:=Nil;
    cargoLista(L);
    procesoEinformo(L,v);

    WriteLn('Ingrese DNI a eliminar');
    ReadLn(DNIeliminar);
    elimino(L,DNIeliminar,exito);

    if (exito) then
        WriteLn('Se logro eliminar el DNI de la estructura')
    else
        WriteLn('NO se logro eliminar el DNI de la estructura');
end.