program Ejercicio8;


type 
    RangoMotivos = 1..7;
    fech = record   
        dia:Integer;
        mes:String
    end;

    transferencia = record  
        numCuentaOrigen:Integer;
        DNIcuentaOrigen:Integer;
        numCuentaDestino:Integer;
        DNIcuentaDestino:Integer;
        fecha:fech;
        monto:Real;
        motivo:RangoMotivos;
    end;

    listaTrans = ^nodo1;
    nodo1 = record
        elem:transferencia;
        sig:listaTrans;
    end;                     //SE DISPONE

    listaTerceros = ^nodo2;
    nodo2 = record
        elem:transferencia;
        sig:listaTerceros;
    end;

    vContador = array [RangoMotivos] of Integer;

procedure InsertarOrd (var L:listaTerceros; t:transferencia);
var
    aux,ant,act:listaTerceros;
begin
    New(aux);
    aux^.elem:=t;
    act:=L;
    ant:=L;
    while ((ant <> nil) and (t.numCuentaOrigen < act^.elem.numCuentaOrigen)) do begin
        ant:=act;
        act:=act^.sig;
    end;

    if (ant = act) then L:=aux
    else ant^.sig:=aux;
    aux^.sig:=act;
end;

procedure recorroLista1 (L1:listaTrans ; L2:listaTerceros);
var
    t:transferencia;  
begin
    while (L1 <> nil) do begin
        if (L1.elem.DNIcuentaOrigen <> L1.elem.DNIcuentaDestino) then
            InsertarOrd(L2,t);
        L1:= L1.sig;
    end;
end;

function cumple (num:Integer):Boolean;
var
    par,impar,dig:Integer;
begin
    while (num <> 0) do begin
        dig:= num mod 10;
        if ((dig mod 2)=0) then
            par := par + 1
        else 
            impar := impar + 1;
        num:=num div 10;
    end;
    if (par < impar) then
        cumple:=True
    else
        cumple:=False;
end;

procedure maximos (v:vContador; var max, codigoMayor:Integer);
var 
    i:Integer;
begin
    for i:=1 to 7 do begin
        if(v[i] > max) then begin
            max:=v[i];
            codigoMayor:=i;
        end;
    end;
end;

procedure recorroLista2 (L:listaTerceros);
var 
    i,cuentaActual,montoActual,cantTransferencias,max,codigoMayor:Integer;
    vC:vContador;
begin
    for i:= 1 to 7 do
        vC[i]:=0;
    max:=-1;
    cantTransferencias:=0;

    while (L <> nil) do begin
        cuentaActual:= L^.elem.numCuentaOrigen;
        montoActual:=0;
        while (L <> nil) and (L^.elem.numCuentaOrigen = cuentaActual) do begin
            montoActual:= montoActual + L^.elem.monto;
            vC[L^.elem.motivo] := vC[L^.elem.motivo] + 1;
            if (L^.elem.fecha.mes = 'Junio') and (cumple(L^.elem.numCuentaDestino)) then
                cantTransferencias:= cantTransferencias + 1;
            L:=L^.sig;
        end;
        WriteLn('El monto total transferido por esta cuenta es: ',montoActual); //B
        maximos(vC,max,codigoMayor);
        
    end;
    WriteLn('El codigo de motivo que mas transferencias a terceros tuvo fue: ',codigoMayor); //C
    WriteLn('la cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales el número de cuenta destino posea menos dígitos pares que impares son: ',cantTransferencias); //D
end;


var
    L1:listaTrans;
    L2:listaTerceros;
begin   
    cargoListaTransferencias(L1);
    recorroLista1(L1,L2); //A
    recorroLista2(L2)
  
end.