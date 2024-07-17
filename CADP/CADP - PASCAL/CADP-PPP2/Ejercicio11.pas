program Ejercicio11;
type 
    RangoEvento = 1..100;

    evento = record
        nombre:String;
        tipoEvento:string;
        lugar:String;
        cantMax:Integer;
        costo:Real;
    end;

    vEvento = array [RangoEvento] of evento;
    vContador = array [RangoEvento] of Integer;

    ventaE = record 
        codigoVenta:Integer;
        numero:RangoEvento;
        DNI:Integer;
        cantEntradas:Integer;
    end;
    
    lista = ^nodo;
    nodo = record
        elem:ventaE;
        sig:lista;
    end;


procedure leoVenta (var v:ventaE);
begin
    ReadLn(v.codigoVenta);
    if (v.codigoVenta <> -1) then begin
      readLn(v.numero);
      ReadLn(v.DNI);
      ReadLn(v.cantEntradas);
    end;
end;

procedure cargoNodo (var L:lista; v:ventaE);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=v;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoListaVentas (L:lista);
var
    v:ventaE;
begin
    leoVenta(v);
    while (v.codigoVenta <> -1) do begin
        cargoNodo(L,v);
        leoVenta(v);
    end;
end;
        
//////////////////////////////////////////////


function cumple (DNI:integer):Boolean;
var
    dig,impar,par:Integer;
begin
    while (DNI <> 0) do begin
        dig:= DNI mod 10;
        if ((dig mod 2)=0) then
            par:= par + 1
        else
            impar:= impar + 1;
        DNI:= DNI div 10;
    end;
    if (par > impar) then
        cumple:=True
    else
        cumple:=False;
end;

procedure minimos (v:vContador; var nombre1,nombre2,lugar1,lugar2:String; var min1,min2);
begin
    for i:= 1 to 100 do begin   //A
        if (v[i] < min1) then begin
            min2:=min1;
            min1:=v[i];

            nombre2:=nombre1;
            nombre1:=v[i].nombre;

            lugar2:=lugar1;
            lugar1:=v[i].lugar;
        end
        else if (v[i] < min2) then begin
            min2:=v[i];
            nombre2:=v[i].nombre;
            lugar2:=v[i].lugar;
        end;
    end;
end;


procedure proceso (L:lista; v:vEvento);
var 
    nombre1,nombre2,lugar1,lugar2:String;
    vC:vContador;
    i,min1,min2:Integer;
    cantEntradas:Integer;
begin
    for i:= 1 to 100 do 
        vC[i]:=0;
    min1:=999;min2:=9999;
    cantEntradas:=0;
  
    while (L <> nil) do begin
        vC[L^.elem.numero]:= vC[L^.elem.numero] + v[L^.elem.numero].costo;
        if (v[L^.elem.numero].tipoEvento = 'obra de teatro') and (cumple(L^.elem.DNI)) then //B
            cantEntradas:= cantEntradas + 1;
        if (v[L^.elem.numero] = 50) then
            if (L^.elem.cantEntradas = v[L^.elem.numero].cantMax) then
                    WriteLn('Alcanzo')
            else
                    WriteLn('No alcanzo pa');              
        L:=L^.sig;
    end;

    minimos(vC,nombre1,nombre2,lugar1,lugar2,min1,min2);
    WriteLn('El nombre y lugar de los dos eventos que han tenido menos recaudación son: ',nombre1,lugar1,nombre2,lugar2);
    WriteLn('La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que impares y que sean para el evento de tipo obra de teatro son: ', cantEntradas);
    
end;


var
    L:lista;
    v:vEvento;
begin
    cargoEventos(v);
    cargoListaVentas(L);
    proceso(L,v);
end.