program Tema1; //MI PARCIAL

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

    vTickets = array [codVuelo] of Integer; 

procedure InicializoVector (var v:vTickets);
var
    i:Integer;
begin
    for i:= 1 to 1200 do begin
        v[i]:=0;
    end;
end;

procedure IncrementoContador (t:ticket; var v:vTickets); // PREGUNTAR SOBRE EL FUNCIONAMIENTO DEL SEGUNDO PARAMENTRO DEL VECTOR CONTADOR
begin
    if (t.paisOrigen = t.paisDestino) then
        v[t.codigoVuelo]:= v[t.codigoVuelo] + 1;
end;

procedure contarSiCumpleDNI (DNI:Integer; var cant:Integer);
var
    dig:Integer;
begin
    dig:= DNI mod 10;
    if ((dig =0) or (dig = 5)) then
      cant:= cant + 1;
end;
                     //DNI QUE PROCESO / GASTO DEL CLIENTE QUE PROCESO 
procedure actualizoMaximos (DNI:integer; gasto:real; var  DNImax:Integer; var maxGasto:Real);
begin
    if (gasto > maxGasto) then begin
        DNImax:= DNI;
        maxGasto:=gasto;
    end;
end;

function cantVuelosSuperanPasajeros (valor:Integer; v:vTickets):Integer;
var
    cant,i:Integer;
begin
    cant:=0;
    for i:=1 to 1200 do begin
      if (v[i] > valor) then 
        cant:=cant + 1;
    end;
    cantVuelosSuperanPasajeros:= cant;
end;


procedure procesoTickets (L:lista; var v:vTickets; var DNIMax:Integer; var cant:Integer);
var
    gasto,
    maxGasto:Real;
    DNIAct:Integer;
begin
    cant:=0;
    maxGasto:=0;
    while (L <> nil) do begin
        gasto:=0;
        DNIAct:= L^.elem.DNIcliente;
        while (L <> nil) and (DNIAct = L^.elem.DNIcliente) do begin
            IncrementoContador(L^.elem,v);
            gasto:= gasto + L^.elem.valorTicket;
            contarSiCumpleDNI(L^.elem.DNIcliente,cant);
            L:=L^.sig;
        end;
        actualizoMaximos(DNIAct,gasto,DNIMax,maxGasto);
    end;
end;

var
    L:lista;
    v:vTickets;//A
    DNImasGasto:Integer;//B
    cantClientes:Integer;//C
begin
    cargoLista(L);
    InicializoVector(v);

    procesoTickets(L,v,DNImasGasto,cantClientes); 

    write(cantVuelosSuperanPasajeros(50,v));
    WriteLn('El DNI del cliente que mas gasto es: ',DNImasGasto);
    WriteLn('La cantidad de clientes con DNI terminado en 0 o 5:',cantClientes);

end.