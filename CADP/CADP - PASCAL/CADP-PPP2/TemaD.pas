program TemaD;
type 
    RangoPartido = 1..52;           //
    str = string[20];               //
    entradasV = record              //
        numPartido:RangoPartido;    //
        paisComprador:str;          //
    end;                            // SE DISPONE 
                                    // ORDENADA POR PAIS DEL COMPRADOR 
    lista = ^nodo;                  //
    nodo = record                   //
        elem:entradasV;             //
        sig:lista;                  //
    end;                            //

    partido = record
        numero:RangoPartido;
        estadio:str;
        equipo1:str;
        equipo2:str;
    end;

    vPartido = array [RangoPartido] of partido;
    vContador = array [RangoPartido] of partido;

////////////////////parte 1///////////////////////////////

procedure leoPartido (var p:partido);
begin
    ReadLn(p.numero);
    ReadLn(p.estadio);
    ReadLn(p.equipo1);
    ReadLn(p.equipo2);
end;

procedure cargoPartidos (var v:vPartido);
var
    i:RangoPartido;
    p:partido;
begin
    for i:=1 to 52 do
        leoPartido(p);
        v[p.numero]:= p;
end;


////////////////////parte 2///////////////////////////////

procedure procesarVentas (L:lista; v:vPartido);
var
    i:RangoPartido;
    vC:vContador;
    paisActual,paisMaximo:str;
    entradaPaisActual,entradaPaisMax:Integer;
begin
    for i:= 1 to 52 do 
        vC[i]:=0;
    entradaPaisMax:=-1;

    while (L <> nil) do begin
        paisActual:= L^.elem.paisComprador;
        entradaPaisActual:=0;
        while (L <> nil) and (paisActual = L^.elem.paisComprador) do begin
            vC[L^.elem.numPartido] := vC[L^.elem.numPartido] + 1;

            if (L^.elem.paisComprador <> v[L^.elem.numPartido].equipo1) and (L^.elem.paisComprador <> v[L^.elem.numPartido].equipo2) then
                entradaPaisActual:= entradaPaisActual + 1;
            L:=L^.sig;
        end;
        actualizoMaximos(paisActual,entradaPaisActual,paisMaximo,entradaPaisMax); //para el punto b
    end;

    WriteLn(muchasVentas(vC)); //a
    WriteLn(paisMaximo); //b
end;

procedure actualizoMaximos (paisActual:str; entradaPaisActual: Integer; var paisMaximo:str ; var entradaPaisMax:integer );
begin
    if (entradaPaisActual > entradaPaisMax) then begin
        entradaPaisMax:=entradaPaisActual;
        paisMaximo:= paisActual;
    end;
end;

function muchasVentas (vC:vContador):Integer;
var
    i:RangoPartido;
    cantMenos30mil:integer;
begin
    cantMenos30mil:=0;
    for i:= 1 to 52 do 
      if (vC[i] > 30000) then //para cada partida el valor es mayor a 30 mil, sumo 1
        cantMenos30mil:= cantMenos30mil + 1;
    muchasVentas:=cantMenos30mil;
end;

//////////////////////////////////////////////////////////

var
    L:lista;
    v:vPartido;
begin
    cargoEntradasVendidas(L); //se dispone padre
    cargoPartidos(v);
    procesarVentas(L,v)
end.