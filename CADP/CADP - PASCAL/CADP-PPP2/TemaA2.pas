program TemaA2;
type 
    RangoPartido = 1..18;

    gol = record                    //
        numPartido:RangoPartido;    //
        equipo:string;              //
    end;                            //
                                    //  SE DISPONE 
    lista = ^nodo;                  //  ORDENADA POR EQUIPO      
    nodo = record                   //
        elem:gol;                   //
        sig:lista;                  //
    end;                            //

    partido = record 
        numPartido:RangoPartido;
        estadio:string;
        equipo1:String;
        equipo2:String;
    end;

    vPartido = array [RangoPartido] of partido;
    vContador = array [RangoPartido] of Integer; //2A

///////////////////parte 1//////////////////////

procedure leoPartido (var p:partido);
begin
    ReadLn(p.numPartido);
    ReadLn(p.estadio);
    ReadLn(p.equipo1);
    ReadLn(p.equipo2);
end;

procedure cargoPartidos (var v:vPartido);
var
    i:Integer;
    p:partido;
begin
    for i:=1 to 18 do begin
        leoPartido(p);
        v[p.numPartido] := p;
    end;
end;

/////////////////////////////////////////////////

/////////////////////parte 2////////////////////

procedure actualizoMaximo (equipoActual:string;  golesActual:Integer; var golesMax:Integer; var equipoMax:string);
begin
    if (golesActual > golesMax) then begin
        golesMax:= golesActual;
        equipoMax:=equipoActual;
    end;
end;

function menosGoles (vC:vContador):Integer;
var
    i,cant:Integer;
begin
    for i:= 1 to 18 do begin
        if (v[i] < 5) then          //para cada elemento que tiene el vector (goles de un partido x) compara si es menos a 5 
          cant:= cant + 1;
    end;
    menosGoles:= cant;
end;


procedure procesoGoles (L:lista; v:vPartido);
var
    equipoActual,equipoMax:string;
    vC:vContador;
    p:partido;
    i,golesActual,golesMax:Integer;
begin
    for i:= 1 to 18 do 
        vC[i]:=0;
    golesMax:= -1;

    while (L <> nil) do begin
        equipoActual:= L^.elem.equipo;
        golesActual:= 0;

        while (L <> nil) and (L^.elem.equipo = equipoActual) do begin
            vC[L^.elem.numPartido] := vC[L^.elem.numPartido] + 1; //sumo un gol en este partido
            if (v[L^.elem.numPartido].estadio = 'Centenario') then  
                golesActual := golesActual + 1;
            L:= L^.sig;
        end;
        actualizoMaximo(equipoActual,golesActual,golesMax,equipoMax);

    end;
    WriteLn('La cantidad de partidos con menos de 5 goles son: 'menosGoles(vC));
    WriteLn('El equipo con mas goles en el estadio centenario es: ',equipoMax);

end;

var 
    L:lista;
    v:vPartido;
begin
    cargoGoles(L); //SE DISPONE
    cargoPartidos(v);
    procesoGoles(L,v);
end.