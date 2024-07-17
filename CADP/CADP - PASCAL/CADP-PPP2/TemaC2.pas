program TemaC2;

type 
    RangoPartido = 1..51;
    gol = record    
        num:RangoPartido;
        equipoRealizo:String;
    end;        //SE DISPONE, ORDENADA POR EQUIPO

    lista = ^nodo;
    nodo = record
        elem:gol;
        sig:lista;
    end;

    partido = record 
        num:RangoPartido;
        estadio:String;
        equipo1:String;
        equipo2:string;
    end;

    vPartido = array [RangoPartido] of partido;

///////////////////////////////////////////

procedure leoPartido (var p:partido);
begin
    ReadLn(p.num);
    ReadLn(p.estadio);
    ReadLn(p.equipo1);
    ReadLn(p.equipo2);
end;

procedure cargoPartidos (var v:vPartido);
var
    p:partido;
    i:Integer;
begin
    for i:=1 to 51 do begin
        leoPartido(p);
        v[p.num]:=p;
    end;
end;

/////////////////////////////////////////////

procedure procesoGoles (L:lista; v:vPartido);
var 
    equipo,equipoActual:string;
    i,goles,golesMax:Integer;

begin
    for i:= 1 to 51 do
        vC[i]:=0;
    golesMax:=-1;

    while (L <> nil) do begin
        equipoActual:=L^.elem.equipoRealizo;
        goles:= 0;
        while (L <> nil) and (L^.elem.equipoRealizo = equipoActual) do begin
            if (v[L^.elem.num].estadio = 'Estadio San Paolo') then
                goles:= goles + 1;
            L:=L^.sig;
        end;
        maximos(equipoActual,equipo,goles,golesMax);
    end;
    WriteLn('El equipo que mas goles realizo en el estadio San Paolo es: ',equipo);
end;

procedure maximos (equipoActual:string; var equipo:string; golesActual:Integer; var golesMax);
begin
    if (golesActual > golesMax) then begin
        golesMax:=golesActual;
        equipo:=equipoActual;
    end;
end;

var
    L:lista;
    v:vPartido;
begin
    cargoGoles(L);
    cargoPartidos(v);
    procesoGoles(L,v);
end.