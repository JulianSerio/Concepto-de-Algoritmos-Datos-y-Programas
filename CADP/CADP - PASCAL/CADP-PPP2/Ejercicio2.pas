program Ejercicio2;
type
    RangoPoliza = 1..6;

    cliente = record
        codigo:Integer;
        DNI:Integer;
        apellido:String;
        nombre:String;
        codPoliza:RangoPoliza;
        monto:Real;
    end;
    
    lista = ^nodo;
    nodo = record
        elem:cliente;
        sig:lista;
    end;

    vAdicional = array [RangoPoliza] of real;

procedure leoCliente (var c:cliente);
begin
    ReadLn(c.codigo);
    ReadLn(c.DNI);
    ReadLn(c.apellido);
    ReadLn(c.nombre);
    ReadLn(c.codPoliza);
    ReadLn(c.monto);
end;

procedure cargoNodo (var L:lista ; c:cliente);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=c;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoListaCliente (L:lista);
var
    c:cliente;
begin
    repeat
        leoCliente(c);
        cargoNodo(L,c);
    until c.codigo = 1122;
end;

function cumpleDOSnueve (dni:Integer):Boolean;
var
    digito,
    cantNueve:Integer;
begin
    cantNueve:=0;
    while (DNI <> 0) do begin
        digito:= dni mod 10; 
        if (digito = 9) then 
            cantNueve:= cantNueve + 1;
        DNI:= DNI div 10;
    end;
    if (cantNueve >= 2) then begin
        cumpleDOSnueve:= True;
    end
    else 
        cumpleDOSnueve:=False;
end;

procedure procesoLista (L:lista; v:vAdicional);
var
    vC:vContador;
    i:Integer;
    montoApagar:Real
begin
    for i:= 1 to 6 do 
        vC[i]:=0;
    
    while (L <> nil) do begin
        montoApagar:= L^.elem.monto + v[L^.elem.codPoliza];
        WriteLn('El cliente ',L^.elem.apellido,' ',L^.elem.nombre, ' dni ',L^.elem.DNI, ' debe pagar: ',montoApagar);
        if (cumpleDOSnueve) then begin
            WriteLn(L^.elem.nombre);
            WriteLn(L^.elem.apellido);
        end;
        L:=L^.sig;
    end;
end;

procedure eliminar (var L:lista; c:Integer);
var
    act,ant:lista;
begin
    act:=l;
    while (act <> nil) and (act^.elem <> c) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act <> nil) then begin
        if (act = L) then
            L:= L^.sig
        else
            ant^.sig:= act^.sig;
        Dispose(act);
    end;
End;

var
    L:lista;
    v:vAdicional;
    cod:Integer; // si dice seguro existe no hace falta el ok:boolean en caso contario si xd
begin
    L:= Nil;
    cargoListaCliente(L);
    cargoTabladeAdicionales(v);
    procesoLista(L,v);

    WriteLn('Ingrese codigo a eliminar');
    ReadLn(cod);
    eliminar(L,cod);

end.