program ejercicio3p7;
type    
    

    viaje = record
        numViaje:Integer;
        codAuto:Integer;
        direccionOrigen:str;
        direccionDestino:str;
        KmRecorridos:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:viaje;
        sig:lista;
    end;            //se dispone

procedure maximos (Km:Integer; codigo:Integer; var max1,max2,cod1,cod2:Integer);
begin
    if (Km > max1) then begin
        max2:= max1;
        max1:= Km;
        cod2:= cod1;
        cod1:= codigo;
    end
    else if (Km > max2) then begin
        max2:= Km;
        cod2:= codigo 
    end;
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

procedure procesoEinformo (L:lista; var L2:lista);
var
    max1,max2,cod1,cod2:Integer;
    codigoActual:Integer;
    v:viaje;
begin
    max1:=0;max2:=0;
    while (L <> nil) do begin
        codigoActual:= L^.elem.codAuto;

        while (L <> nil) and (codigoActual = L^.elem.codAuto) do begin
            if (L^.elem.KmRecorridos > 5) then
                insertarOrd(L2,v);
            L:=L^.sig;
        end;

        maximos(L^.elem.KmRecorridos,codigoActual,max1,max2,cod1,cod2);

    end;

    WriteLn(cod1,cod2);
end;


var
    L:lista;
    L2:lista;
begin
    L:=Nil;
    L2:=Nil;
    procesoEinformo(L,L2);
end.