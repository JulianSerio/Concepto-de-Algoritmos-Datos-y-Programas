program Ejercicio5;

type 
    str = string[20];

    producto = record 
        codigo:Integer;
        descripcion:str;
        stockActual:Integer;
        stockMinimo:Integer;
        precio:Real;
    end;

    lista = ^nodo;
    nodo = record
        elem:producto;
        sig:lista;
    end;

procedure leoProducto (var p:producto);
begin
    with p do begin
        WriteLn('Codigo: ');ReadLn(codigo);
        if (codigo <> -1) then begin
            WriteLn('Descripcion: ');ReadLn(descripcion);
            WriteLn('Stock Actual: ');ReadLn(stockActual);
            WriteLn('Stock Minimo: ');ReadLn(stockMinimo);
            WriteLn('Precio: ');ReadLn(precio);
        end;
    end;
end;

procedure cargoNodo (var L:lista; p:producto);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:= p;
    aux^.sig:= L;
    L:= aux;
end;

procedure cargoLista (var L:lista);
var
    p:producto;
begin
    leoProducto(p);
    while (p.codigo <> -1) do begin
        cargoNodo(L,p);
        leoProducto(p);
    end;
end;

///////////CARGAR LISTA///////////////

procedure minimos (cod:Integer; precio:real ;var min1,min2:Real; var cod1,cod2:Integer);
begin
    if (precio < min1) then begin
        min2:= min1;
        min1:= precio;

        cod2:=cod1;
        cod1:=cod;
    end
    else 
    if (precio < min2) then begin
        min2:=precio;
        cod2:=cod;
    end;
end;

function TresPares (cod:Integer):Boolean;
var
    dig,pares:Integer;
begin
    pares:= 0;
    while (cod <> 0) do begin
        dig:= cod mod 10;
        if ((dig mod 2)=0) then
            pares:= pares + 1;
        cod:= cod div 10;
    end;
    if (pares >= 3) then
        TresPares:= True
    else    
        TresPares:= False;
end;

procedure recorroLista (L:lista);
var
    cantProd,cantStockMenor,cod1,cod2:Integer;
    porcentaje,min1,min2:Real;
begin
    cantProd:=0; cantStockMenor:=0;min1:=9999; min2:=9999; cod1:=0; cod2:=0;
    while (L <> nil) do begin
        cantProd:= cantProd + 1;
        if (L^.elem.stockActual < L^.elem.stockMinimo) then
            cantStockMenor:= cantStockMenor + 1;
        if (TresPares(L^.elem.codigo)) then
            WriteLn(L^.elem.descripcion);
        minimos(L^.elem.codigo,L^.elem.precio,min1,min2,cod1,cod2);
        L:=L^.sig;
    end;
    porcentaje := (cantStockMenor / cantProd) * 100;
    WriteLn('El porcentaje de prod con stock actual por debajo de su stock minimo es: ',porcentaje:2:2); //A
    WriteLn('El codigo de los 2 productos mas economicos es: ',cod1, ' y ', cod2);
end;


var
    L:lista;
begin
    L:=Nil;
    cargoLista(L);
    recorroLista(L);
end.