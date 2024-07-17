program Ejercicio8;
type  
    rangoMotivo = 1..7;
    str = string[20];

    fech = record
        dia:Integer;
        mes:str;
    end;

    transferencia = record
        numCuentaOrigen:Integer;
        DNItitularCuentaOrigen:Integer;
        numCuentaDestino:Integer;
        DNItitularCuentaDestino:Integer;
        fecha:fech;
        hora:real;
        montoTransferido:Real;
        codMotivo:rangoMotivo;
    end;

    listaT = ^nodoT;
    nodoT = record
        elem:transferencia;
        sig:listaT;
    end; //se dispone

    lista = ^nodo;
    nodo = record
        elem:transferencia;
        sig:lista;
    end;

    vContador = array [rangoMotivo] of Integer;

procedure InsertarOrdenado (var L:lista ; t:transferencia);
var
    ant,nue,act:lista;
begin
    New(nue);
    nue^.elem:=t;
    act:=L;
    ant:=L;
    while (act <> nil) and (act^.elem.numCuentaOrigen < t.numCuentaOrigen) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (ant = act) then 
        L:= nue
    else 
        ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure recorroListaTransferencias (L:listaT; var L2:lista);
var
    t:transferencia;
begin
    while (L <> nil) do begin
        if (L^.elem.numCuentaOrigen <> L^.elem.numCuentaDestino) then
            InsertarOrdenado(L2,t);
        L:=L^.sig;
    end;
end;

procedure inicializoVc (var v:vContador);
var
    i:Integer;
begin
    for i:= 1 to 7 do begin
        v[i]:=0;
    end;
end;

function menosParesQueImpares (num:Integer):Boolean;
var
    dig,pares,impares:Integer;
begin
    pares:=0;impares:=0;
    while (num <> 0) do begin
        dig:= num mod 10;
        if ((dig mod 2)=0) then
            pares:= pares + 1
        else
            impares:= impares + 1;
        num:= num div 10;
    end;
    menosParesQueImpares:= (pares < impares);
end;

procedure maximos (v:vContador; var max,cod:Integer);
var
    i:Integer;
begin
    for i:= 1 to 7 do begin
        if (v[i] > max) then
          max:= v[i];
          cod:= i;
    end;
end;


procedure recorroLista2 (L:lista);
var
    vC:vContador;
    numCuentaActual,cantJunioPares,max,cod:Integer;
    montoTransferido:Real;

begin
    inicializoVc(vC);
    cantJunioPares:=0;
    max:=0;
    while (L <> nil) do begin
        montoTransferido:=0;
        numCuentaActual:= L^.elem.numCuentaOrigen;

        while (L <> nil) and (L^.elem.numCuentaOrigen = numCuentaActual) do begin
            montoTransferido:= montoTransferido + L^.elem.montoTransferido; //b
            vC[L^.elem.codMotivo] := vC[L^.elem.codMotivo] + 1; //c
            if (L^.elem.fecha.mes = 'Junio') and (menosParesQueImpares(L^.elem.numCuentaDestino)) then //d
                cantJunioPares:= cantJunioPares + 1;
            L:=L^.sig;
        end;
        WriteLn('El monto total tranferido por esta cuenta es: ',montoTransferido);

    end;
    maximos(vC,max,cod);
    WriteLn('El código de motivo que más transferencias a terceros tuvo es: ',cod);
    WriteLn('r la cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales el número de cuenta destino posea menos dígitos pares que impares es: ',cantJunioPares);
end;

var
    L:listaT;
    L2:lista;

begin
    L:=Nil;L2:=Nil;
    cargoLista(L); // se dispone
    recorroListaTransferencias(L,L2);
    recorroLista2(L2);
end.