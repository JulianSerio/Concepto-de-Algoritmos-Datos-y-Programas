program p4;
type 
    str = String[20];
    pago = 1..4;

    pedido = record
        nombrePaisDestino:str;
        formaPago:pago;
    end;

    lista = ^nodo;
    nodo = record
        elem:pedido;
        sig:lista;
    end;

    vFpago = array [pago] of Integer;

procedure inicializoVector (var v:vFpago);
var
    i:Integer;
begin   
    for i:=1 to 6 do begin
        v[i]:=0;
    end;
end;

procedure FP (v:vFpago; var FP:Integer);
var 
    i:Integer;
    max:Integer;
begin
    max:=0;
    for i:=1 to 4 do begin
        if (v[i] > max) then begin
            max:=v[i];
            FP:= i;
        end;
    end;
end;

procedure procesoLista (L:lista; var v:vFpago; var FP:Integer);
var
    paisActual:str;
    pedidosEntregar:Integer;
begin
    while (L <> nil) do begin
        paisActual:=L^.elem.nombrePaisDestino;
        pedidosEntregar:=0;
        while (L <> nil) and (L^.elem.nombrePaisDestino = paisActual) do begin
            v[L^.elem.formaPago]:= v[L.elem.formaPago] + 1;
            pedidosEntregar:= pedidosEntregar + 1;
        end;
        WriteLn('La cantidad de pedidos que debera entregar este pais es: ',pedidosEntregar);
        FPmaximo(v,FP);
    end;
end;

var
    v:vFpago;
    L:lista;
    FP:Integer;
begin
    L:=nil;
    //cargoLista(L);
    inicializoVector(v);
    procesoLista(L);
    
    WriteLn('La forma de pago mas utilizada es: ',FP);
  
end.