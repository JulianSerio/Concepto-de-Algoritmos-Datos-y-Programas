program Tema5;

type
    codVuelo = 1..400;
    str = string[20];

    ticket = record
        codVuelo:codVuelo;
        numTicket:Integer;
        apellidoCliente:str;
        paisOrigen:str;
        paisDestino:str;
    end;

    vTicket = array [codVuelo] of Integer;

    lista = ^nodo;
    nodo = record 
        elem:ticket;
        sig:lista;
    end;

procedure InicializoVector (var v:vTicket);
var
    i:Integer;
begin   
    for i:= 1 to 400 do begin
        v[i]:=0
    end;
end;

procedure contador (t:ticket; var v:vTicket);
begin
    if (t.paisOrigen = t.paisDestino) then begin
        v[t.codVuelo]:= v[t.codVuelo] + 1;
    end  
end;

procedure cuentoTickets (ticket:Integer; var cant:Integer);
var
    dig:Integer;
begin
    dig:= ticket MOD 10;
    if (dig = 2) or (dig = 3) then begin
        cant:= cant + 1;
    end;
end;

function cantVuelosSuperanPasajeros (valor:Integer; v:vTicket):Integer;
var
    cant,i:Integer;
begin
    cant:=0;
    for i:=1 to 400 do begin
      if (v[i] > valor) then 
        cant:=cant + 1;
    end;
    cantVuelosSuperanPasajeros:= cant;
end;

procedure clienteMasTickets (Apellid:str; ticketsComprados:integer; var ApeCliente:str; var maxTickets:integer);
begin
    if ( ticketsComprados > cantTicketsComproElSujeto) then begin
        ApeCliente := Apellid;
        cantTicketsComproElSujeto:= ticketsComprados;
    end;
end;

procedure procesoTickets (L:lista; var v:vTicket; var CantTickets:integer; var ApeCliente:str);
var
    ApeActual:str;
    maxTickets:Integer;
    cantTickesCliente:Integer;
begin
    CantTickets:=0;
    maxTickets:=0;
    While (L <> Nil) do begin
        ApeActual:=L^.elem.apellidoCliente;
        cantTickesCliente:=0;
        while (L <> nil) and (L^.elem.apellidoCliente = ApeActual) do begin
            contador(L^.elem,v);
            cantTickesCliente:= cantTickesCliente + 1;
            cuentoTickets(L^.elem.numTicket, CantTickets);
            L:=L^.sig;
        end;
        clienteMasTickets(ApeActual,cantTickesCliente,ApeCliente,maxTickets);
    end;


end;

var
    L:lista;
    v:vTicket;//a
    ApeCliente:str; //b
    CantTickets:Integer; //c
begin
    //cargoLista(L);
    InicializoVector(v);

    procesoTickets(L,v,CantTickets,ApeCliente);
  
    WriteLn(cantVuelosSuperanPasajeros(65,v));
    WriteLn('El apellido del cliente que compro mas tickets es: ',ApeCliente);
    WriteLn('La cantidad de tickets cuyo numero termine en 2 o 3 es: ',CantTickets)

end.