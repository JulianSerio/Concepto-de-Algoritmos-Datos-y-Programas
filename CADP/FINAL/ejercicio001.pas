program ejercicio001;

type 
    numeroProducto = 1..300;
    str = String[20];

    //se dispone
    venta = record
        numProd:numeroProducto;
        cantVendida:Integer;
        nombreProd:str;
    end;

    lista = ^nodo;
    nodo = record
        elem:venta;
        sig:lista;
    end;

    vTabla = array [numeroProducto] of Real;

procedure procesoInformacion (L:lista; v:vTabla ; var nombreMenos:str;)
var
    prodActual:numeroProducto;
    unidad,min,aux:Integer;
begin
    min:=9999;
    while (L <> nil) do begin
        unidad:= v[L^.elem.numProd];
        aux:= unidad * L^.elem.cantVendida;
        if (unidad < min) then begin
            min:= unidad;
            nombreMenos:= L^.elem.nombreProd;
        end;
       L:=L^.sig; 
    end;

end;


var
    L:lista
    v:vTabla;
    nombreMenos:str;
begin
    L:=Nil;
    cargoLista(L); //se dispone
    procesoInformacion(L,v,nombreMenos);
    WriteLn(nombreMenos);

end.