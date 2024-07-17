program Ejercicio8;
type
    tipoTranferencia = 1..7; //1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios
    rangoD = 1..30;
    str = string[20];

    VTrans = array [tipoTranferencia] of Integer;

    f = record 
        dia:rangoD;
        mes:str;
    end;

    transferencia = record //SE DISPONE
        numCuentaOrigen:Integer;
        DNICuentaOrigen:Integer;
        numCuentaDestino:Integer;
        DNICuentaDestino:Integer;
        fecha:f;
        hora:str;
        montoTranferido:Real;
        codigoMotivo:VTrans;
    end;


    lista = ^nodo;
    nodo = record
        elem:transferencia;
        sig:lista;   
    end;

procedure leerInfo (var t:transferencia);   //SE DISPONE
begin
end;

procedure cargoNodo(var L:lista;t:transferencia);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=t;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoNodoSub (var sublista:lista;L:lista);
var
    ant,act,aux:lista;
begin
    if(L^.elem.numCuentaOrigen <> L^.elem.numCuentaDestino) then begin
        New(aux);
        aux^.elem:=L^.elem;
        aux^.sig:=sublista;
        if (sublista = nil) then
            sublista:=aux
        else begin
            act:=sublista;
            ant:=sublista;
            while ((act <> nil) and (t.numCuentaOrigen < aux^.elem.numCuentaOrigen)) do begin
                ant:=act;
                act:=act^.sig;
            end;
        end;
        if (act = sublista) then begin
            aux^.sig:=sublista;
            sublista:= aux;
        end
        else if (act <> nil) then begin
            ant^.sig:=aux;
            aux^.sig:=act;
        end
        else begin
            ant^.sig:= aux;
            aux^.sig:=Nil;
        end;
    end;
end;

//b
procedure montoTotal (CuentaOrigen:Integer;Monto:Real);
begin
    Write ('En la cuenta de origen: ', CuentaOrigen,' se transfieron: ',Monto:0:2);
end;

//c
procedure inicializoContado (var v:VTrans);
var 
    i:Integer;
begin
    for i:= 1 to 7 do begin
        v[i]:=0;
    end;
end;

procedure contarTipos (var v:VTrans; cant:tipoTranferencia);
begin
    v[cant]:= v[cant] + 1;
end;

procedure vectorMaximo (v:VTrans);
var
    max,i:Integer;
    codigoMotivo:tipoTranferencia
begin
    max:= 0;
    for i:=1 to 7 do begin
        if (v[i] > max) then begin
            max:=v[i];
            codigoMotivo:=i;
        end;
    end;
    WriteLn('El codigo de motivo que mas transferencias tuvo es: el ',codigoMotivo);
end;

//d
function masParesQueImpares (Num:Integer):Boolean;
var
    dig,par,impar:Integer;
begin
    par:=0;
    impar:=0;
    while (Num <> 0) do begin
        dig:= Num mod 10;
        if((dig mod 2)= 0) then
            par := par + 1
        else
            impar:= impar + 1;
        Num:= Num DIV 10;
    end;
    if (par < impar) then 
        masParesQueImpares:=True
    else
        masParesQueImpares:=False;
end;

procedure cuentoTranferencias (M:str; var cantTransferencias:Integer;NumCDestino:Integer);
begin
    if (M = 'Junio') and (masParesQueImpares(NumCDestino)) then begin
        cantTransferencias:= cantTransferencias + 1;
    end;
        
end;


procedure informoTodo (L:lista);
var
    v:VTrans;
    cantTransferencias:Integer;
begin
    cantTransferencias:=0;
    inicializoContado(v);
    while (L <> nil) do begin
        montoTotal(L^.elem.numCuentaOrigen,L^.elem.montoTranferido);
        contarTipos(v,cantTransferencias);
        cuentoTranferencias(L^.elem.fecha.mes,cantTransferencias,L^.elem.numCuentaDestino);
        L:=L^.sig;
    end;
    vectorMaximo(v);    
end;
  
procedure CargoSublista(L:lista;var sub:lista);
begin
    while (L<>Nil) do begin
        cargoNodoSub(sub,L);
        L:=L^.sig;
    end;
end;



var
    L:lista;
    subLista:lista;
    t:transferencia;
begin
    subLista:=Nil;
    L:=Nil;
    leerInfo(t);
    while (t.numCuentaOrigen <> 0) do begin
        cargoNodo(L,t);
        leerInfo(t);
    end;
    CargoSublista(L,sublista);
    informoTodo(subLista);
end.