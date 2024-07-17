program Ejercicio3;
type
    viaje = record
        num:Integer;
        codAuto:Integer;
        dirOrigen:string;
        dirDestino:string;
        kmRecorridos:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:viaje;
        sig:lista;
    end;

procedure maximos (codActual,km:Integer; var max1,max2,cod1,cod2:Integer);
begin
    if (km > max1) then begin
        max2:= max1;
        max1:= km;

        cod2:= cod1;
        cod1:= codActual;
    end
    else 
    if (km > max2) then begin
        max2:= km;
        cod2:= codActual;
     end;
end;

procedure insertarOrd (var L:lista ; v:viaje);
var
    aux,ant,act:lista;
begin
    New(aux);
    aux^.elem:=v;
    act:=L;
    ant:=L;
    while ((ant <> nil) and (v.num < act^.elem.num)) do begin
        ant:=act;
        act:=act^.sig;
    end;

    if (ant = act) then l:=aux
    else ant^.sig:= aux;
    aux^.sig:=act;
end;

procedure procesoViajes (L:lista; var L2:lista);
var
    max1,max2,codActual,cod1,cod2,km:Integer;
    v:viaje;
begin
    max1:=-1;
    max2:=-1;

    while (L <> nil) do begin
        codActual:= L^.elem.codAuto;
        km:=0;
        while (L <> nil) and (L^.elem.codAuto = codActual) do begin
            km:= km + L^.elem.kmRecorridos;      
            if (L^.elem.kmRecorridos > 5) then
                insertarOrd(L2,L^.elem);
            L:=L^.sig;
        end;
        maximos(codActual,km,max1,max2,cod1,cod2);
    end;
end;

var
    L:lista;
    L2:lista;
begin
    L:=Nil;
    L2:=Nil;
    cargoListaViajes(L); // se dispone
    procesoLista(L);

end.