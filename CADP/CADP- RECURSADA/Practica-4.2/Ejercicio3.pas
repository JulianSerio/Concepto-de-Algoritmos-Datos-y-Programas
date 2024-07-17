program Ejercicio3;
const
    dimF = 200;
type
    rangoDias = 1..31;

    viaje = record
        diaMes:rangoDias;
        montoTrans:Real;
        distanciaRecorrida:Integer;
    end;

    vViaje = array [1..dimF] of viaje;
    vContador = array [rangoDias] of integer;


procedure leoDatos (var v:viaje);
begin
    with v do begin
        Write('Distancia Recorrida: ');Read(distanciaRecorrida);
        if (distanciaRecorrida <> 0) then begin
            Write('Monto Transportado: ');Read(montoTrans);
            Write('Dia del mes: ');Read(diaMes);
        end;
    end;
end;

procedure cargoVector (var v:vViaje; var dimL:Integer);
var
    vi:viaje;
begin
    leoDatos(vi);
    while (vi.distanciaRecorrida <> 0) and (dimL < dimF) do begin
        dimL:= dimL + 1;
        v[dimL]:= vi;
        leoDatos(vi)
    end;
end;

procedure inicializoVc (var vC:vContador);
var
    i:Integer;
begin
    for i:= 1 to 31 do begin
        vC[i]:= 0;
    end;
end;

procedure informoVC (vC:vContador);
var
    i:Integer;
begin
    for i:= 1 to 31 do begin
        WriteLn('Dia: ',i, ' Viajes ', vC[i]);
    end;
end;

procedure procesoInformacion (v:vViaje; dimL:Integer);
var
    montoTotal,prom,min:Real;
    i,distancia:Integer;
    vC:vContador;
begin  
    inicializoVc(vC);
    montoTotal:=0;
    min:= 9999;
    distancia:=0;
    for i:= 1 to dimL do begin
        montoTotal:= montoTotal + v[i].montoTrans;
        if (v[i].montoTrans < min) then
            min:= v[i].montoTrans;
            distancia:= v[i].distanciaRecorrida;
        vC[v[i].diaMes] := vC[v[i].diaMes] + 1;
    
    end;
    prom:= montoTotal / dimL;
    WriteLn('El monto promedio transportado por viaje es: ',prom);
    WriteLn('La distancia recorrida es: ',distancia,' y el dia del mes en que se realizo el viaje que transporto menos dinero es: ', min:2:0);
    informoVC(vC);
end;

var
    v:vViaje;
    dimL:Integer;
begin
    dimL:=0;
    cargoVector(v,dimL);
    procesoInformacion(v,dimL);
end.