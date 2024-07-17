program PrimeraFecha;
type
    codVuelo = 1..1200;
    str = string[20];

    ticket = record
        codigoVuelo:codVuelo;
        DNIcliente:integer; 
        paisOrigen:str;
        paisDestino:str;
        valorTicket:Real;
    end;

    lista = ^nodo;
    nodo = record
        elem:ticket;
        sig:lista;
    end;

    vContador = array [codVuelo] of Integer; 

procedure InicializoVector (var v:vContador);
var
    i:Integer;
begin
    for i:= 1 to 1200 do begin
        v[i]:=0;
    end;
end;

function cumple (DNI:Integer):Boolean;
var
    dig:Integer;
begin
    dig:= DNI mod 10;
    if ((dig =0) or (dig = 5)) then
        cumple:=True
    else
        cumple:=False;
end;

procedure maximos (DNI:integer; gasto:real; var  DNImax:Integer; var max:Real);
begin
    if (gasto > max) then begin
        max:=gasto;
        DNImax:=DNI;
    end;
end;

procedure cantVuelosMismoPais (v:vContador; var cantV:Integer);
var
    i:integer;
begin
    for i:=1 to 1200 do begin
      if (v[i] > 50) then 
        cantV:=cantV + 1;
    end;
end;


procedure procesoTickets (L:lista; var cantV,DNIMAX,cant0o5:Integer);
var
    gasto,
    max:Real;
    DNIAct:Integer;
    vC:vContador;
begin
    cantV:=0;
    max:=0;
    cant0o5:=0;
    InicializoVector(vC);
    while (L <> nil) do begin
        gasto:=0;
        DNIAct:= L^.elem.DNIcliente;
        while (L <> nil) and (DNIAct = L^.elem.DNIcliente) do begin
            if (L^.elem.paisOrigen = L^.elem.paisDestino) then
                vC[L^.elem.codigoVuelo] := vC[L^.elem.codigoVuelo] + 1;
            gasto:= gasto + L^.elem.valorTicket;
            if (cumple(L^.elem.DNIcliente)) then
                cant0o5:= cant0o5 + 1;
            L:=L^.sig;
        end;
        maximos(DNIAct,gasto,DNIMAX,max);
    end;
    cantVuelosMismoPais(vC,cantV);
end;

var
    L:lista;
    cantV,cant0o5,DNIMAX:Integer;
begin
    L:=Nil;
    cargoLista(L); //se dispone
    procesoTickets(L,cantV,DNIMAX,cant0o5); 

    write('La cantidad de vuelos dentro del mismo pais con mas de 50 pasajeros es: ',cantV);
    WriteLn('El DNI del cliente que mas gasto es: ',DNIMAX);
    WriteLn('La cantidad de clientes con DNI terminado en 0 o 5:',cant0o5);

end.