program Ejercicio6;

type 
    str = String[20];
    micro = record
        marca:str;
        linea:str;
        cantCores:Integer;
        velocidad:Integer;
        tamanoT:Integer;
    end;

procedure leoDatos (var m:micro);
begin
    with m do begin
        WriteLn('Ingrese cantidad de cores');
        ReadLn(cantCores);
        if (cantCores <> 0) then begin
            WriteLn('Ingrese marca');
            ReadLn(marca);
            WriteLn('Ingrese tamano de transistores');
            ReadLn(tamanoT);
            WriteLn('Ingrese velocidad del reloj');
            ReadLn(velocidad);
            WriteLn('Ingrese linea');
            ReadLn(linea);
        end;
    end;
end;

procedure analizoMarca (cant:Integer;var max1,max2:Integer; marca:str; var mc1,mc2:str);
begin
    if (cant > max1) then begin
        max2:= max1;
        max1:= cant;

        mc2:=mc1;
        mc1:=marca;
    end
    else if (cant > max2) then begin
        max2:= cant;
        mc2:= marca;
    end;
end;

var 
    m:micro;
    marcaActual,mc1,mc2:str;
    max1,max2,cant,cantMulticore:integer;
begin
    max1:=0;
    max2:=0;
    cant:=0;
    cantMulticore:=0;
    leoDatos(m);
    while (m.cantCores <> 0) do begin
        marcaActual:=m.marca;
        while ((m.cantCores <> 0) and (marcaActual = m.marca)) do begin
            if (m.cantCores > 2) and (m.tamanoT >= 22) then begin //a
                WriteLn(M.marca, ' ---- ', M.linea);
            end;
            if (m.tamanoT = 14) then begin
                cant:= cant + 1;
            end;
            if (m.cantCores > 1) and (m.velocidad >= 2) and ((m.marca = 'AMD') or (m.marca = 'INTEL')) then begin
                cantMulticore:= cantMulticore + 1;
            end;


            leoDatos(m);
        end;
        analizoMarca(cant,max1,max2,marcaActual,mc1,mc2); 
    end;
    WriteLn('Las 2 marcas con transistores de 14 nm es: ',mc1, ' y ',mc2);
    WriteLn('La cantidad de procesadores multicore de INTEL o AMD, cuyos relojes alcancen velocidades 2Ghz es: ',cantMulticore);
end.