program TemaA;
type 

    str = string[20];
    RangoPartido = 1..38;

    venta = record                      //  
        codPartido:RangoPartido;        //
        codCliente:Integer;             //
        cantEntradasVendidas:Integer;   // 
    end;                                //ESTA INFO NO SE ENCUENTRA ORDENADA
                                        //
    lista = ^nodo;                      // SE DISPONE 
    nodo = record                       //
        elem:venta;                     //
        sig:lista;                      //
    end;

    Partido = record
        codigo:RangoPartido;
        nombreEstadio:str;
        capacidadMaxEstadio:Integer;
        HoraInicio:str;
    end;                                //ESTA INFO SE INGRESA SIN ORDEN (38.11.56.1.7..)


    vectorPartido = array [RangoPartido] of Partido;  // POR CADA ITERACION DEL PARTIDO SE PIDE EL CODIGO,NOMBRE ESTADIO, CAPACIDAD, ETC
    vectorContador = array [RangoPartido] of Integer; //CANT ENTRADAS VENDIDAS PARA CADA PARTIDO, PARA DESPUES CUAL SUPERABA EL 50% DE CAPACIDAD

    listaCodigos = ^registroCodigos; //b) i) 
    registroCodigos = record
        num:RangoPartido;
        sig:^listaCodigos;
    end;

procedure agregarAdelante (var L:listaCodigos; num:RangoPartido);
var
    aux:listaCodigos;
begin
    New(aux);
    aux^.sig:=L;
    aux^.num:=num;
    L:=aux;
end;

///////////////////punto A////////////////////////////////////

procedure leoPartido (var p:Partido);
begin
    ReadLn(p.codigo);
    ReadLn(p.nombreEstadio);
    ReadLn(p.capacidadMaxEstadio);
    ReadLn(p.HoraInicio);
end;

procedure cargoPartido (var v:vectorPartido);
var 
    i:RangoPartido;
    p:Partido;
begin
    for i:=1 to 38 do begin
        leoPartido(p);      //leo un partido 
        v[p.codigo]:= p;    //en la posicion del codigo guardaba el partido que acababa de leer
    end;
end;

///////////////////////////////////////////////////////////////

////////////////////punto B///////////////////////////////////

procedure procesoVentas (L:lista ; v: vectorPartido ; var codigos : listaCodigos; var cantVentas: Integer);
var 
    i:RangoPartido;
    cod:Integer;
    vC:vectorContador;
begin
    for i:= 1 to 38 do 
        vC[i]:=0;
    cantVentas:=0;

    while (L <> nil) do begin
        vC[L^.elem.codPartido]:= vC[L^.elem.codPartido] + L^.elem.cantEntradasVendidas; // EN LA POSICION COD PARTIDO SUMO CANT ENTRADAS VENDIDAS EN ESA VENTA
        cod:= L^.elem.codCliente mod 100;  //SI MOD 10 ME SEPARA EL ULTIMO DIGITO, MOD 100 ME SEPARA LOS ULTIMOS 2 DIGITOS, MOD 1000 LOS ULTIMOS 3, ETC
        if (cod >= 30) and (cod <=39) and (L^.elem.cantEntradasVendidas < 5) then 
            cantVentas:= cantVentas + 1;
        L:=L^.sig;
    end;   
     
    codigos:= Nil;
    for i:= 1 to 38 do  //b) ii)
        if (vC[i] > (v[i].capacidadMaxEstadio / 2)) then
            agregarAdelante(codigos,i);
end;

/////////////////////////////////////////////////////////////

var
    L1:lista;
    v:vectorPartido;
    L2:listaCodigos;
    cantVentas:Integer;
begin
    L1:=Nil;
    cargarListaVentas(L1); //SE DISPONE PADRE
    cargoPartido(v);
    procesoVentas(L1,v,L2,cantVentas);

    WriteLn('La cantidad de ventas con menos de 5 entradas cuyo codigo del cliente termina entre 30 y 39 son: ',cantVentas);
end.