program Ejercicio11;
type
    str = string[20];
    rangoTipo = 1..5;
    rangoEvento = 1..100;

    evento = record
        nombreEvento:str;
        tipo:rangoTipo;
        lugar:str;
        cantMaxPersonas:Integer;
        costoEntrada:Real;
    end;
    
    vEventos = array [1..100] of evento;

    venta = record
        codVenta:Integer;
        numEvento:rangoEvento;
        DNIcomprador:Integer;
        cantEntradasAdquiridas:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:venta;
        sig:lista;
    end;

procedure leoVenta (var v:venta);
begin
    with v do begin
        WriteLn('Codigo de venta: ');ReadLn(codVenta);
        if (codVenta <> -1) then begin
            WriteLn('Numero eveto: ');ReadLn(numEvento);
            WriteLn('DNI del comprador: ');ReadLn(DNIcomprador);
            WriteLn('Cantidad de entradas adquiridas: ');ReadLn(cantEntradasAdquiridas);
        end;
    end;
end;

procedure cargoNodo (var L:lista; v:venta);
var 
    aux:lista;
begin
    New(aux);
    aux^.elem:=v;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoLista (var L:lista);
var
    v:venta;
begin
    leoVenta(v);
    while (v.codVenta <> -1) do begin
        cargoNodo(L,v);
        leoVenta(v);
    end;
end;

function cumple (DNI:Integer):Boolean;
var
    dig,pares,impares:Integer;
begin
    pares:=0;impares:=0;
    while (DNI <> 0) do begin
        dig:= DNI mod 10;
        if ((dig mod 2)=0) then
            pares:= pares + 1
        else 
            impares:= impares + 1;
        DNI:= DNI div 10;
    end;
    cumple:= (pares > impares);
    
end;

procedure minimos (recaudacion:Real; nombre,lugar:str; var min1,min2:Integer; var nom1,nom2,lugar1,lugar2:str);
begin
    if (recaudacion < min1) then begin
        min2:= min1;
        min1:= recaudacion;
        
        nom2:= nom1;
        nom1:=nombre;

        lugar2:=lugar1;
        lugar1:=lugar;
    end
    else 
    if (recaudacion < min2) then begin
        min2:= recaudacion;
        nom2:= nombre;
        lugar2:=lugar;
    end;
     
end;


procedure procesoListayVector (L:lista; v:vEventos);
var
    cantEntradas:Integer;
    total:Real;
    nom1,nom2,lugar1,lugar2:str;
begin
    cantEntradas:=0;total:=0;min1:=9999;min2:=9999;
    while (L <> nil) do begin
        
        for i:= 1 to 100 do begin
            total:= total + v[i].costoEntrada;

            if (cumple(L^.elem.DNIcomprador)) and (v[i].tipo = 3) then
                cantEntradas:= cantEntradas + 1;

            minimos(total,v[i].nombreEvento,v[i].lugar,min1,min2,nom1,nom2,lugar1,lugar2);
        
            L:= L^.sig;
        end;
    end;
end;


var
    L:lista;
    v:vEventos;
begin
    L:=Nil;
    cargoLista(L);
    procesoListayVector(L,v);
 
end.