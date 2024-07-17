program TemaB;
type 
    RangoPartido = 1..48;
    str = string[20];

    VentaEntradas = record          //
        codPartido:RangoPartido;    //
        codCliente:Integer;         //
        cantEntradasV:Integer;      //
    end;                            //  SE DISPONE 
                                    //
    lista = ^nodo;                  // INFO NO ORDENADA
    nodo = record                   //
        elem:VentaEntradas;         //
        sig:lista;                  //
    end;                            //

    Partido = record
        codigo:RangoPartido;
        estadio:str;
        capacidadMax:Integer;
        horaInicio:str;
    end;

    vectorPartido = array [RangoPartido] of Partido;
    vectorContador = array [RangoPartido] of Integer;

    listaCodigos = ^loscodigospa;
    loscodigospa = record
        num:RangoPartido;
        sig:^listaCodigos;
    end;

procedure agregarAdelante (var L:lista ; num: RangoPartido);
var
    aux:listaCodigos;
begin
    New(aux);
    aux^.num:=num;
    aux^.sig:=L;
    L:=aux;
end;

    
//////////////////// punto a /////////////////////////////

procedure leoDatos (var p:Partido);
begin
    ReadLn(p.codigo);
    ReadLn(p.estadio);
    ReadLn(p.capacidadMax);
    ReadLn(p.horaInicio);
end;

procedure cargoDatosPartidos (var vp:vectorPartido);
var
    i:RangoPartido;
    p:Partido;
begin
    for i:= 1 to 48 do begin
        leoDatos(p);
        vp[p.codigo] := p; 
    end;
end;

///////////////////////////////////////////////////////////

procedure procesoVentas (L:lista; var L2:listaCodigos; v:vectorPartido; var cantVentas:Integer);
var
    i:RangoPartido;
    cod:Integer;
    vC:vectorContador;
begin
    for i:=1 to 48 do 
        vC[i]:=0;
    cantVentas:=0;

    while (L <> Nil) do begin
        vC[L^.elem.codPartido]:= vC[L^.elem.codPartido] + L^.elem.cantEntradasV;
        cod:= L^.elem.codCliente mod 100;
        if (cod = 10) or (cod = 20) and (L^.elem.cantEntradasV > 5) then
          cantVentas:= cantVentas + 1;        
        L:=L^.sig;
    end;

    L2:=Nil;
    for i:= 1 to 48 do 
        if (vC[i] = v[i].capacidadMax) then 
            agregarAdelante(L2,i);
end;
//////////////////////////////////////////////////////////

var
    L1:lista;
    L2:listaCodigos;
    v:vectorPartido;
    cantVentas:Integer;
begin
    cargoListaVentas(L1);
    cargoDatosPartidos(v);

    procesoVentas(L1,L2,v,cantVentas);
    
    WriteLn('La cantidad ventas de mas de 5 entradas cuyo codigo del cliente terminar en 10 o en 20 son: ',cantVentas);
end.