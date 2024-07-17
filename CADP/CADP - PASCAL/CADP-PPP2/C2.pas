program C2;
type 
    RangoPartidos = 1..51;
    gol = record
        numPartido:RangoPartidos;
        equipo:string;
    end;

    lista = ^nodo;
    nodo = record   
        elem:gol;
        sig:lista;
    end;

    partido = record
        numPartido:RangoPartidos;
        estadio:String;
        equipo1:string;
        equipo2:String;
    end;

    vPartidos = array [RangoPartidos] of partido;

procedure leoPartido (var p:partido);
begin
    ReadLn(p.numPartido);
    ReadLn(p.estadio);
    ReadLn(p.equipo1);
    ReadLn(p.equipo2);
end;

procedure cargoPartidos (var v:vPartidos);
var
    i:Integer;
    p:partido;
begin
    for i:= 1 to 51 do begin
        leoPartido(p);
        v[p.numPartido]:= p;
    end;
end;

procedure procesoGoles (L:lista; v:vPartidos);
var
    equipoActual,equipoMasGoles:String;
    golesActual,max:Integer;
begin
    max:=-1;
    while (L <> nil) do begin
        golesActual:=0;
        equipoActual:= L^.elem.equipo;
        while (L <> nil) and (L^.elem.equipo = equipoActual) do begin
            if (v[L^.elem.numPartido].estadio = 'Estadio San Paolo') then
                golesActual:= golesActual + 1;
            L:=L^.sig;
        end;
        if (golesActual > max) then begin
            max:=golesActual;
            equipoMasGoles:=equipoActual;
        end;
    end;

    WriteLn('El equipo con mayor cantidad de goles realizados en el estadio san paolo es: ',equipoMasGoles);
end;

var
    L:lista;
    v:vPartidos;
begin
    cargoListaGoles(L);
    cargoPartidos(v);
    procesoGoles(L,v);
end.