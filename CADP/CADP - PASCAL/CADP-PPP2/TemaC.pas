program TemaC;
type
    RangoPartido = 1..51;
    str = String[20];

    entradaV = record               //
        codPartido:RangoPartido;    //
        codCliente:Integer;         //
        cantEntradas:Integer;       //
    end;                            //
                                    //  SE DISPONE 
    lista = ^nodo;                  //
    nodo = record                   //
        elem:entradaV;              //
        sig:lista;                  //
    end;                            //

    partido = record
        codigo:RangoPartido;
        estadio:str;
        capacidad:Integer;
        horaInicio:str;
    end;

    vPartido = array [RangoPartido] of partido;
    vContador = array [RangoPartido] of Integer;

    listaCodigo = ^carlo;
    carlo = record
        num:RangoPartido;
        sig:^listaCodigo;
    end;

/////////////////////PARTE A///////////////////////

procedure leoPartido (var p:partido);
begin
    ReadLn(p.codigo);
    ReadLn(p.estadio);
    ReadLn(p.capacidad);
    ReadLn(p.horaInicio);
end;

procedure cargoPartidos (var v:vPartido);
var
    i:RangoPartido;
    p:partido;
begin
    for i:= 1 to 51 do begin
        leoPartido(p);
        v[p.codigo]:= p;
    end;
end;

/////////////////////////////////////////////////////

///////////////////PARTE B///////////////////////////

procedure proceso (L:lista; v:vPartido; var L2:listaCodigo);
var
    i:RangoPartido;
    vC:vContador;
begin
    for i:=1 to 51 do begin
        vC[i]:=0; 
    end;
    
    while (L <> nil) do begin
        vC[L^.elem.codPartido] := vC[L^.elem.codPartido] + L^.elem.cantEntradas;
        L:=L^.sig;  
    end;
    
    L2:=Nil;
    for i:= 1 to 51 do begin              //revisar parte B, RETORNAR LISTA CON LOS CODIGOS DE PARTIDOS QUE YA TIENEN TODAS LAS ENTRADAS VENDIDAS 
        if (vC[i] = v[i]) then //** */
          agregarAdelante(L2,i) //i = codigo
    end;
end;

procedure agregarAdelante (var L:lista; num:RangoPartido);
var
    aux:listaCodigo;
begin
    New(aux);
    aux^.num:=num;
    aux^.sig:=L;
    L:=aux;
end;

//////////////////////////////////////////////

var
    L1:lista;
    v:vPartido;
    L2:listaCodigo;
begin
    cargoListaVentas(L1);
    cargoPartidos(v);
  
end.