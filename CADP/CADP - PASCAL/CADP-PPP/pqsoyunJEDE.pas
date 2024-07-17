program pqsoyunJEDE;
type 
    codVuelo = 1..1200;
    str = String[20];

    ticket = record
        codigoVuelo:codVuelo;
        DNIcliente:Integer;
        paisOrigen:str;
        paisDestino:str;
        valorTicket:Real;
    end;
    
    lista = ^nodo;
    nodo = record
        elem:ticket;
        sig:lista;
    end;

    vVuelo = array [codVuelo] of Integer;

procedure inicializoVector (var v:vVuelo);
var
    i:Integer;
begin
    for i:=1 to 1200 do begin
      v[i]:=0;
    end;
end;

procedure contador (t:ticket; var v:vVuelo);
begin
    if (t.paisOrigen = t.paisDestino) then begin
        v[t.codigoVuelo]:= v[t.codigoVuelo] + 1;
    end;
end;

procedure AnalizoDNI (DNI:integer; var cant:Integer);
var
    dig:Integer;
begin
    dig:= DNI mod 10;
    if (dig = 0) or (dig = 5) then begin
        cant:=cant + 1;
    end;
end;

procedure maximos (DNI:integer; gastoCliente:integer; var DNImasGasto:Integer);
var
    max:Integer;
begin
    if (gastoCliente > max) then begin
        max:= gastoCliente;
        DNImasGasto:=DNI;
    end;
end;

procedure procesoLista (L:lista; var v:vVuelo; var DNIcliente:Integer; var CantDNI:Integer);
var
    gastoCliente:Integer;
    DNIactual:Integer;
begin
    CantDNI:=0;
    while (L <> nil) do begin
        DNIactual:=L^.elem.DNIcliente;
        gastoCliente:=0;
        while (L <> Nil) and (L^.elem.DNIcliente = DNIacutal) do begin
            contador(L^.elem,v);
            gastoCliente:= gastoCliente + L^.elem.valorTicket;
            AnalizoDNI(L^.elem.DNIcliente,CantDNI);
            L:=L^.sig;
        end;
        maximos(DNIactual,gastoCliente,DNIcliente);
    end;  
end;

function cantVuelosSuperanPasajeros (valor:Integer; v:vVuelo):Integer;
var
    i,cant:Integer;
begin
    for i:=1 to 1200 do begin
      if (v[i] > valor) then
        cant:= cant + 1
    end;
    cantVuelosSuperanPasajeros:=cant;
end;


var
    L:lista;
    vV:vVuelo;
    t:ticket;
    DNIcliente,cantDNI:integer;
begin
    //cargoLista(L); se dispone
    inicializoVector(vV);

    procesoLista(L,vV,DNIcliente,cantDNI);

    cantVuelosSuperanPasajeros(50,vV); //VUELOS CON PASAJEROS MAYORES A 50;
    WriteLn('El DNI del cliente que mas gasto dinero en tickets fue: ',DNIcliente);
    WriteLn('La cantidad de DNI que terminen en 0 o en 5 son: ',cantDNI);

  
end.