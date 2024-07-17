program Ejercicio12;

type 
    str = String[20];
    dispositivo = record
        version:str;    
        tamanioPantalla:Integer; //Pulgadas
        cantRAM:Integer; //GB
    end;
    
    lista = ^nodo;
    nodo = record
        elem:dispositivo;
        sig:lista;
    end;

procedure leoInfo (var d:dispositivo);
begin
    with d do begin
        WriteLn('Ingrese version de android');
        ReadLn(version);
        WriteLn('Ingrese tamanio de pantalla');
        ReadLn(tamanioPantalla);
        WriteLn('Ingrese cantidad de RAM');
        ReadLn(cantRAM);
    end;
end;


procedure agregarAtras (var L:lista; d:dispositivo);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=d;
    aux^.sig:=Nil;
    if (L = nil) then begin
      L:=aux
    end
    else begin
        aux^.sig:=L;
        L:= aux;
    end;
end;

procedure TresGByCincoPulgadas (L:lista; var masTresGB:Integer);
begin   
    if (L^.elem.tamanioPantalla >= 5) and (L^.elem.cantRAM >= 3) then begin
        masTresGB:= masTresGB + 1;
    end;
end;

var 
    Pi:lista;
    d:dispositivo;
    masTresGB,totalPantallas,sumaPantallas,promedioPantallas,sistemaActual:Integer;
begin
    Pi:=nil;
    masTresGB:=0;
    totalPantallas:=0;
    sumaPantallas:=0;
    promedioPantallas:=0;
    
    leoInfo(d);
    while ((Pi <> nil) and (sistemaActual = d.version))do begin
        totalPantallas:=totalPantallas + 1;
        sumaPantallas:= sumaPantallas + d.tamanioPantalla;


        

        agregarAtras(Pi,d);
        TresGByCincoPulgadas(Pi,masTresGB);
        leoInfo(d);
    end;
    promedioPantallas:= (totalPantallas * sumaPantallas) / 100;


    WriteLn('')
end.