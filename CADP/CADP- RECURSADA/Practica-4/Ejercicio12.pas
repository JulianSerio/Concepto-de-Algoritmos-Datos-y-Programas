program Ejercicio12;
type
    str = String[20];
    rangoTipo = 1..4;
    rango = 1..53;

    galaxia = record
        nombre:str;
        tipo:rangoTipo;
        masa:Integer;
        distancia:Integer;
    end;

    vGalaxy = array [rango] of galaxia;

procedure leoGalaxia (var g:galaxia);
begin
    with g do begin
        Write('Nombre: ');Read(nombre);
        Write('Tipo: ');Read(tipo);
        Write('Masa: ');Read(masa);
        Write('Distancia: ');Read(distancia);
    end;
end;

procedure cargoVector (var v:vGalaxy);
var
    i:Integer;
begin
    for i:= 1 to 53 do begin
        leoGalaxia(v[i]);
    end;
end;

procedure galaxias (var G1,G2,G3,G4:Integer; galaxia:Integer);
begin
    if (galaxia = 1) then 
        G1:= G1 + 1;
    if (galaxia = 2) then
        G2:= G2 + 1;
    if (galaxia = 3) then
        G3:= G3 + 1;
    if (galaxia = 4) then
        G4:= G4 + 1;
end;

procedure maximos (masa:Integer;nombre:str;var max1,max2:Integer;Var GalaxiaMayorMasa1,GalaxiaMayorMasa2:str);
begin
    if (masa > max1) then begin
        max2:= max1;
        max1:= masa;
        GalaxiaMayorMasa2:=GalaxiaMayorMasa1;
        GalaxiaMayorMasa1:=nombre;
    end
    else if (masa > max2) then begin
        max2:= masa;
        GalaxiaMayorMasa2:=nombre;
    end;
end;

procedure minimos (masa:Integer;nombre:str;var min1,min2:Integer; var GalaxiaMenorMasa1,GalaxiaMenorMasa2:str);
begin
    if (masa < min1) then begin
        min2:= min1;
        min1:= masa;

        GalaxiaMenorMasa2:=GalaxiaMenorMasa1;
        GalaxiaMenorMasa1:= nombre;
    end
    else if (masa > min2) then begin
        min2:=masa;
        GalaxiaMenorMasa2:=nombre;
    end;
end;


var
    v:vGalaxy;
    i,G1,G2,G3,G4,masaTotal,cantNoReg,max1,max2,min1,min2:Integer;
    GalaxiaMayorMasa1,GalaxiaMayorMasa2, GalaxiaMenorMasa1,GalaxiaMenorMasa2:str;
begin
    cargoVector(v);
    masaTotal:=0;
    cantNoReg:=0;
    min1:=9999;
    min2:=9999;
    max1:=0;
    max2:=0;
    for i:= 1 to 53 do begin
        galaxia(G1,G2,G3,G4,v[i].tipo);
        if (v[i].tipo = 4) and (v[i].distancia < 1000) then 
            cantNoReg:= cantNoReg + 1;
        maximos(v[i].masa,v[i].nombre,max1,max2,GalaxiaMayorMasa1,GalaxiaMayorMasa2);
        minimos(v[i].masa,v[i].nombre,min1,min2,GalaxiaMenorMasa1,GalaxiaMenorMasa2);
    end;

    WriteLn('');

end. 