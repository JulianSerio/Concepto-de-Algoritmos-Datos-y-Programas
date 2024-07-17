program TemaB;
type
    rangoPartidos = 1..52;
    str = string[20];

    gol = record
        numPartido:rangoPartidos;
        equipo:str;
        numCamiseta:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:gol;
        sig:lista;
    end;

    partido = record
        num:rangoPartidos;
        estadio:str;
        PaisA:str;
        PaisB:str;
    end;

    vPartidos = array [rangoPartidos] of partido;
    vContador = array [rangoPartidos] of Integer;

procedure inicializoVc (var v:vContador);
var
    i:Integer;
begin
    for i:= 1 to 52 do begin
        v[i]:=0;
    end;    
end;

procedure leoPartido (var p:partido);
begin
    ReadLn(p.num);
    ReadLn(p.estadio);
    ReadLn(p.PaisA);
    ReadLn(p.PaisB);
end;

procedure cargoVector (var v:vPartidos);
var
    i:Integer;
    p:partido;
begin
    for i:= 1 to 52 do begin
        leoPartido(p);
        v[p.num]:=p;
    end;
end;

procedure maximos (pais:str; cantGoles:Integer; var max:Integer; var paisMax:str);
begin
    if (cantGoles > max) then begin
        max:=cantGoles;
        paisMax:=pais;
    end;
end;

procedure procesoLista (L:lista; v:vPartidos; var vC:vContador; var paisMax:str);
var
    cantGoles1,cantGoles2,max:Integer;
    paisActual:str;
begin
    max:=0;
    while (L <> nil) do begin
        cantGoles1:= 0;
        cantGoles2:= 0;
        paisActual:=L^.elem.equipo;
        while (L <> nil) and (L^.elem.equipo = paisActual) do begin
            vC[L^.elem.numPartido] := vC[L^.elem.numPartido] + 1;
            if (v[L^.elem.numPartido].estadio = 'San Paolo') and (L^.elem.numCamiseta = 9) then
                cantGoles1:= cantGoles1 + 1;
            if (L^.elem.numCamiseta = 9) or (L^.elem.numCamiseta = 7) then
                cantGoles2:= cantGoles2 + 1;
            L:=L^.sig;
        end;
        maximos(paisActual,cantGoles1,max,paisMax);
    end;
end;

function masGoles (v:vContador):Integer;
var 
    i:Integer;
    cantGoles:Integer;
begin
    cantGoles:=0;
    for i:= 1 to 52 do begin
        if (v[i] > 5) then 
            cantGoles:= cantGoles + 1;
    end; 
    masGoles:= cantGoles;
end;


var
    L:lista;
    v:vPartidos;
    vC:vContador;
    paisMax:str;
begin
    L:=Nil;
    cargoLista(L); //se dispone
    cargoVector(v);
    inicializoVc(vC);
    procesoLista(L,v,vC,paisMax);

    WriteLn('La cantidad de partidos de mas de 5 goles es: ',masGoles(vC));
    WriteLn('El nombre del pais con mayor cantidad de goles realizados en el estadio San Paolo por el jugador con camiseta nro 9: ',paisMax);

end.