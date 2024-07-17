program TemaB2;
type 
    RangoPartido = 1..52;
    gol = record    
        numPartido:RangoPartido;
        equipo:string;
        camisetaJugador:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:gol;
        sig:lista;      //Ordenado por pais/equipo
    end;                //SE DISPONE
                           
    partido = record
        num:RangoPartido;
        estadio:String;
        equipo1:String;
        equipo2:string;
    end;

    vPartido = array [RangoPartido] of partido;
    vContador = array [RangoPartido] of Integer;

procedure leoPartido (var p:partido);
begin
    ReadLn(p.num);
    ReadLn(p.estadio);
    ReadLn(p.equipo1);
    ReadLn(p.equipo2);
end;

procedure cargoPartidos (var v:vPartido);
var 
    i:Integer;
    p:partido;
begin
    for i:= 1 to 52 do begin
        leoPartido(p);
        v[p.num]:= p;
    end;
end;

procedure golesMax (paisActual,golesActual:Integer; var max:Integer; var paisMas:string);
begin
    if (golesActual > max) then begin 
        max1:=golesActual;
        paisMas:= paisActual;
    end;
end;

function maximos (vC:vContador):Boolean;
var
    cant,i:Integer;
begin
    for i:= 1 to 52 do begin
        if(v[i] > 5) then
          cant:= cant + 1;
    end;
    maximos:=cant;
end;

procedure procesoGoles (L:lista; v:vPartido);
var 
    paisActual,paisMas1,paisMas2:string;
    i,goles1,goles2,max1,max2:Integer;
    vC:vContador;
begin
    for i:= 1 to 52 do 
        vC[i]:=0;

    max1:=-1;
    max2:=-1;

    while (L <> nil) do begin
        paisActual:=L^.elem.equipo;
        goles1:=0;
        goles2:=0;
        while (L <> nil) and (L^.elem.equipo = paisActual) do begin
            vC[L^.elem.numPartido] := vC[L^.elem.numPartido] + 1; //sumo un gol para este partido
            if (v[L^.elem.numPartido].estadio = 'San Paolo') and (L^.elem.camisetaJugador = 9) then
                goles1:= goles1 + 1;
            if (L^.elem.camisetaJugador = 9) or (L^.elem.camisetaJugador = 7) then //EL OR ES INCLUSIVO ?
                goles2:= goles2 + 1;
            L:=L^.sig;
        end;
        golesMax(paisActual,goles1,max1,paisMas1);
        golesMax(paisActual,goles2,max2,paisMas2);
    end;
    WriteLn('La cantidad de partidos con mas de 5 goles son: 'maximos(vC));
    WriteLn('El nombre del pais con mayor cantidad de goles realizados en el estadio San Paolo por el jugador con la camisaeta 9 es: ',paisMas1);
    WriteLn('El nombre del pais con mayor cantidad de goles realizados por el jugador con camiseta 9 o 7 es: ',paisMas2);
end;


var
    L:lista;
    v:vPartido;
begin
    L:=Nil;
    cargoLista(L); //SE DISPONE
    cargoPartidos(v);
    procesoGoles(L,v);
end.