program Ejercicio1; 
type
    rangoCod = 1..5;
    str = string[50];

    persona = record
        DNI:Integer;
        apellidoYnombre:str;
        edad:Integer;
        codGenero:rangoCod;
    end;

    lista = ^nodo;
    nodo = record
        elem:persona;
        sig:lista;
    end;

    vContador = array [rangoCod] of Integer;

procedure leoPersona (var p:persona);
begin
    WriteLn('DNI: ');ReadLn(p.DNI);
    WriteLn('Apellido y nombre: ');ReadLn(p.apellidoYnombre);
    WriteLn('Edad: ');ReadLn(p.edad);
    WriteLn('Codigo de genero: ');ReadLn(p.codGenero);
end;

procedure cargoNodo (var L:lista; p:persona);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=p;
    aux^.sig:= L;
    L:=aux;
end;

procedure cargoLista (var L:lista);
var
    p:persona;
begin
    repeat
        leoPersona(p);
        cargoNodo(L,p);
    until p.DNI = 33555444
end;

procedure inicializoVC (var v:vContador);
var
    i:Integer;
begin
    for i:= 1 to 5 do begin
        v[i]:=0;
    end;
end;

procedure maximos (v:vContador; var max1, max2, cod1, cod2:Integer);
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
        else 
        if (v[i] > max2) then begin
            max2:= v[i];
            cod2:= i;
        end;
    end;
end;


function cumple (DNI:Integer):boolean;
var
    dig,pares,impares:Integer;
begin
    pares := 0; impares := 0;
    while (DNI <> 0) do begin
        dig:= DNI mod 10;
        if ((dig mod 2 )=0) then 
            pares:= pares + 1
        else 
            impares:= impares + 1;
        DNI:= DNI div 10;
    end;
    if (pares > impares) then
        cumple:= true
    else 
        cumple:= False;
end;

procedure procesoLista (L:lista);
var
    cantDNI,max1,max2,cod1,cod2:Integer;
    vC:vContador;
begin
    max1:=0;max2:=0;
    inicializoVC(vC);
    cantDNI:=0;
    while (L <> nil) do begin
        if (cumple(L^.elem.DNI)) then   //a
            cantDNI:= cantDNI + 1;
        vC[L^.elem.codGenero] := vC[L^.elem.codGenero] + 1; //b
        L:=L^.sig;
    end;
    maximos(vC,max1,max2,cod1,cod2); //b
    WriteLn('Los codigos de genero mas elegidos son: ',cod1,' y ',cod2);    
end;

procedure eliminar (var L:lista; DNIeliminar:Integer; var exito:Boolean);
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
    DNIeliminar:Integer;
    exito:Boolean;
begin
    L:=nil;
    cargoLista(L);
    procesoLista(L);

    WriteLn('Ingrese DNI a eliminar');Readln(DNIeliminar);
    eliminar(L,DNIeliminar,exito);
    if (exito) then
        Write('Se logro eliminar')
    else
        Write('No se logro eliminar');
end.