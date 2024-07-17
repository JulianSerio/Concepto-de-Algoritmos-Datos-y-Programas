program Ejercicio3;

type 
    str = string [15];
    viaje = record
        numViaje:Integer;
        codigoAuto:Integer;
        direccionOrigen:str;
        direccionDestino:str;
        kmRecorridos:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:viaje;
        sig:lista;
    end;

procedure cargarNodo (var L:lista; v:viaje);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=v;
    aux^.sig:=L;
    L:=aux;
end;

procedure maximos (totalKM:Integer; v:viaje); //A
var
    max1,max2:Integer;
begin
    max1:=0;
    max2:=0;
    if (totalKM > max1) then begin
        max2:=max1;
        max1:= v.codigoAuto;
    end
    else if (totalKM > max2) then begin
        max2:= v.codigoAuto;
    end;
end;

procedure cortedeControl (L:lista);
var
    codigoActual,totalKM:Integer;
    v:viaje;
begin
    //cargoDatos(v) se dispone 
    while (L <> nil) do begin
        v:= L^.elem;
        codigoActual:= v.codigoAuto;
        totalKM:= 0;

        while ((L <> nil) and (codigoActual = v.codigoAuto)) do begin
            totalKM:= totalKM + v.kmRecorridos;
            L:=L^.sig;
        end;
        maximos(totalKM,v);
    end;
end;

procedure insertarOrdenado (var L:lista; v:viaje);
var
    aux,act,ant:lista;
begin
    New(aux); aux^.elem:=v; aux^.sig:=Nil;
    if (L = nil) then
      L:= aux
    else begin 
        act:=L; 
        ant:=L;
        while (act <> nil) and (act^.elem. < aux^.elem) do begin
            ant:=act;
            act:=act^.sig;
        end;
    end;
    if (act = L) then begin
        aux^.sig:= L;
        L:=aux;
    end
    else if (act <> nil) then begin
        ant^.sig:= aux;
        aux^.sig:=act;
    end
    else 
        begin
            ant^.sig:=aux;
            aux^.sig:= nil;
        end;
end;

procedure listaViajes (v:viaje); //B
var
    Pi:lista;
begin
    if (v.kmRecorridos > 5) then begin
        insertarOrdenado(Pi,v);
        cargarNodo(Pi,v);
    end;
end;

var
    v:viaje;
    L:lista;
begin
    //cargarDato(v) se dispone
    cargarNodo(L,v);
    insertarOrdenado(L,v);
    listaViajes(v);
end.