program Ejercicio3;
type
    str = string[20];
    viaje = record
        numViaje:Integer;
        codAuto:Integer;
        dirOrigen:str;
        dirDestino:str;
        KmRecorridos:Real;
    end;

    lista = ^nodo;
    nodo = record
        elem:viaje;
        sig:lista;
    end;

procedure insertarOrd (var L2:lista; v:viaje);
var
    ant,act,aux:lista;
begin
    New(aux);
    aux^.elem:=v;
    act:=L2;
    ant:=L2;
    while (act <> nil) and (act^.elem.numViaje < v.numViaje) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (ant = act) then 
        L2:= aux
    else 
        ant^.sig:=aux;
    aux^.sig:=act;
end;

procedure NuevaLista (var L2:lista; v:viaje; L:lista);
begin
    if (L^.elem.KmRecorridos > 5) then
        insertarOrd(L2,v);
end;

procedure recorroLista (L:lista; var L2:lista); 
var
    codActual,max1,max2,cod1,cod2:Integer;
    v:viaje;
begin
    max1:=0;
    max2:=0;
    while (L <> nil) do begin
        codActual:= L^.elem.codAuto;
        while (L <> nil) and (codActual = L^.elem.codAuto) do begin
            NuevaLista(L2,v);
            L:=L^.sig; 
        end;
        if (L^.elem.KmRecorridos > max1) then begin
                max2:=max1;
                max1:= L^.elem.KmRecorridos;
                cod2:=cod1;
                cod1:= codActual; // o L^.elem.codAuto
            end
            else 
                if (L^.elem.KmRecorridos > max2) then begin 
                    max2:= L^.elem.KmRecorridos;
                    cod2:= codActual;
                end;
    end;
    WriteLn('Los codigos de auto que mas km recorridos son: ',cod1, ' y ', cod2);
end;

var
    L,L2:lista;
begin
    L:=Nil;L2:=Nil;
    cargoLista(L); // se dispone
    recorroLista(L,L2);
end.