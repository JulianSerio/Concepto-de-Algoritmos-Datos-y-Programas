program TemaE;

type 
    RangoPartido = 1..38;
    str = string[20];

    entradaV = record       //
        numP:RangoPartido;  //
        paisOrigen:str;     //
    end;                    //
                            //  SE DISPONE 
    lista = ^nodo;          //      
    nodo = record           //  Ordenada por pais del comprador
        elem:entradaV;      //
        sig:lista;          //
    end;                    //

    partido = record
        numero:RangoPartido;
        estadio:str;
        equipo1:str;
        equipo2:str;
    end;

    vPartidos = array [RangoPartido] of partido;
    vContador = array [RangoPartido] of Integer;

//////////////////////////parte 1 //////////////////////////////////

procedure leoPartido (var p:partido);
begin
    ReadLn(p.numero);
    ReadLn(p.estadio);
    ReadLn(p.equipo1);
    ReadLn(p.equipo2);
end;

procedure cargoPartido (var v:vPartidos);
var
    i:Integer;
    p:partido;
begin
    for i:= 1 to 38 do begin
        leoPartido(p);
        v[p.numero]:=p;
    end;
end;

/////////////////////////////////////////////////////////////////////

///////////////////////parte 2///////////////////////////////////////

procedure procesoVentas (L:lista; vP:vPartidos; var paisMax:str);
var
    paisActual:str;
    i:Integer;
    entradaPaisActual,entradasPaisMax,cantPartidos:integer;
    vC:vContador;
begin
    for i:= 1 to 38 do 
        vC[i]:= 0;

    cantPartidos:=0;

    while (L <> nil) do begin
        paisActual:=L^.elem.paisOrigen;
        entradas:=0;
        while (L <> nil) and (L^.elem.paisOrigen = paisAcutal) do begin
            vC[L^.elem.numP] := vC[L^.elem.numP] + 1; //a 

            if (L^.elem.paisOrigen = v[L^.elem.numP].equipo1) or (L^.elem.paisOrigen = v[L^.elem.numP].equipo2) then
                entradaPaisActual:= entradaPaisActual + 1 ; //b
            L:=L^.sig;
        end;
        actualizoMinimo(paisActual,entradaPaisActual,paisMax,entradasPaisMax);
    end;
    WriteLn(cantMenos(vC));
end;

function cantMenos (vC:vContador):Integer; //a 
var
    i,cant:Integer;
begin
    for i:= 1 to 38 do begin
        if (vC[i] < 30000) then 
            cant:= cant + 1;
    end;
    cantMenos:= cant;
end;

procedure actualizoMinimo (paisActual:str; cant:Integer; var paisMax:str; var max: integer); //b
begin
    if (cant < max) then begin
        max:= cant;
        paisMax:= paisActual;
    end;
end;



var
    L:lista;
    v:vPartidos;
    paisMax:str;
begin
    cargoListaVentas(L);
    cargoPartido(v);
    procesoVentas(L,v,paisMax);

    WriteLn('El pais que mayor cantidad de entradas adquirio para partidos en los que juega si equipo es: ',paisMax);

end.