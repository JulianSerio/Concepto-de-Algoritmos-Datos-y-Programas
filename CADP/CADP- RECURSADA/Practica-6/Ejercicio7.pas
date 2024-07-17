program Ejercicio7;
type
    rango = 1..7;    
    str = String[20];

    sonda = record
        nombre:str;
        duracion:Integer;
        costo:Real;
        costoManteni:Real;
        espectro:rango;
    end;

    lista = ^nodo;
    nodo = record
        elem:sonda;
        sig:lista;
    end;

    vContador = array [rango] of Integer;

procedure leoSonda (var s:sonda);
begin
    with s do begin
        WriteLn('Nombre');ReadLn(nombre); 
        WriteLn('Duracion: ');ReadLn(duracion);
        WriteLn('Costo: ');ReadLn(costo);
        WriteLn('Costo mantenimiento: ');ReadLn(costoManteni);
        WriteLn('Espectro electromagnetico: ');ReadLn(espectro);
    end;
end;

procedure cargoNodo (var L:lista; s:sonda);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=s;
    aux^.sig:=L;
    L:=aux;
end;


function cumpleH2020 (L:lista):Boolean;
var
    costoTotalManteni:Real;
begin
    costoTotalManteni:= (L^.elem.costoManteni * L^.elem.duracion);
    if ((L^.elem.costo > costoTotalManteni) and (L^.elem.espectro <> 1)) then
        cumpleH2020:= True
    else    
        cumpleH2020:= False;
end;

procedure procesoLista (L:lista;  var NOcumplen,SIcumplen:lista);
var
    s:sonda;
begin
    while (L <> nil) do begin
        if (cumpleH2020(L)) then
            cargoNodo(SIcumplen,s)
        else
            cargoNodo(NOcumplen,s);
    end;
end;

procedure InformoNocumplen (NOcumplen:lista);
var
    costoTotal:real;
    cantidadNocumplen:Integer;
begin   
    costoTotal:= 0;
    cantidadNocumplen:= 0;
    while (NOcumplen <> nil) do begin
        cantidadNocumplen:= cantidadNocumplen + 1;
        costoTotal:= costoTotal + (NOcumplen^.elem.costo + (NOcumplen^.elem.costoManteni * NOcumplen^.elem.duracion));
        NOcumplen:= NOcumplen^.sig;
    end;
    WriteLn('La cantidad de proyectos que no fueron aceptados es de: ',cantidadNocumplen, ' su gasto total es de: ',costoTotal);
end;


var 
    L:lista;
    NOcumplen,SIcumplen:lista;
    s:sonda;
begin
    NOcumplen:=Nil;
    SIcumplen:=Nil;
    L:= nil;
    repeat
        leoSonda(s);
        cargoNodo(L,s);
    until (s.nombre = 'GAIA');

    procesoLista(L,NOcumplen,SIcumplen);
    InformoNocumplen(NOcumplen);

end.