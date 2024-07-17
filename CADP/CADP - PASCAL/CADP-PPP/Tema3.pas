program Tema3;
type
    codMod = 1..200;
    mPago = 1..6;
    str = string[20];


    notVendida = record
        codigoCliente:Integer;
        codigoModelo:codMod;
        marca:str;
        medioPago:mPago;
    end;

    lista = ^nodo;
    nodo = record
        elem:notVendida;
        sig:lista;
    end;

    VPrecio = array [codMod] of Real;
    VmedioPago = array [mPago] of Real;

procedure leoDatos (var n:notVendida);
begin
    with n do begin
        WriteLn ('Ingrese el codigo de cliente');ReadLn(codigoCliente);
        if (n.codigoCliente <> -1) then begin
            WriteLn('Ingrese codigo del modelo');ReadLn(codigoModelo);
            WriteLn('Ingrese marca de la notebook');ReadLn(marca);
            WriteLn('Ingrese medio de pago');ReadLn(medioPago);
        end;
    end;
end;

procedure cargoNodo (var L,ult:lista ; n:notVendida);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=n;
    aux^.sig:=Nil;
    if(L = nil) then
        L:=aux
    else 
        ult^.sig:=aux;
    ult:=aux;
end;

procedure InicializoVectorPagos (var v:VmedioPago);
var 
    i:Integer;
begin
    for i:=1 to 6 do begin
      v[i]:=0;
    end;
end;

procedure cargoInfoVentas (var L:lista);
var
    n:notVendida;
    ult:lista;
begin
    leoDatos(n);
    while (n.codigoCliente <> -1) do begin
        cargoNodo(L,ult,n);
        leoDatos(n); 
    end;
end;

procedure procesoVentas ( L:lista; vectorPrecio:VPrecio; var vectorFpago:VmedioPago; var cant:Integer);
begin
    cant:=0;
    while (L <> nil) do begin
        vectorFpago[L^.elem.medioPago]:= vectorFpago[L^.elem.medioPago] + vectorPrecio[L^.elem.codigoModelo]; //EN ESA POSICION SUMO EL PRECIO DE LA NOTEBOOK QUE SE VENDIO
        if ((L^.elem.marca = 'Lenovo') and ((L^.elem.codigoCliente MOD 2) = 0)) then
          cant:= cant + 1;
        L:=L^.sig;
    end;
end;

procedure calculoDosMaximos (v:VmedioPago; var FormaPago1,FormaPago2:Integer);
var
    max1,max2:Real;
    i:Integer;
begin   
    max1:=0;
    max2:=0;
    for i:= 1 to 6 do begin
        if (v[i] > max1) then begin
            max2:=max1;
            FormaPago2:=FormaPago2;

            max1:=v[i];
            FormaPago1:= i;
        end
        else 
            if (v[i] > max2) then begin
              max2:=v[i];
              FormaPago2:=i;
            end;
    end;
end;


var
    L:lista; 
    vectorPrecio:VPrecio;
    vectorFpago:VmedioPago;
    FormaPago1,FormaPago2,cant:Integer;

begin
    L:=Nil;
    cargoInfoVentas(L);
    InicializoVectorPagos(vectorFpago);
    //cargoPrecios(vectorPrecio) se disponee

    procesoVentas(L,vectorPrecio,vectorFpago,cant);

    calculoDosMaximos(vectorFpago,FormaPago1,FormaPago2);

    WriteLn('La cantidade de PC Lenovo con cliente con DNI par fue: ',cant);
    WriteLn('Los 2 formas de pago que generaron mas ganancia fueron: ',FormaPago1, ' y ', FormaPago2);
    
end.