program Tema4;
type
    codModelo = 1..130;
    mPago = 1..6;
    str = string[20];

    telefono = record
        codigo:codModelo;
        codCliente:Integer;
        marcaTel:str;
        medioPago:mPago;
    end;

    lista = ^nodo;
    nodo = record 
        elem:telefono;
        sig:lista;
    end;

    vMediosPago = array  [mPago] of Integer;
    vPrecio = array [codModelo] of Integer; // porque real?

procedure leoDatos (var t:telefono);
begin
    with t do begin
        WriteLn('Ingrese codigo del telefono');ReadLn(codigo);
        WriteLn('Ingrese codigo del cliente');ReadLn(codCliente);
        WriteLn('Ingrese marca del telefono');ReadLn(marcaTel);
        WriteLn('Ingrese medio de pago');ReadLn(medioPago);
    end;
end;

procedure cargoNodo (var L,ult:lista ; t:telefono);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=t;
    aux^.sig:=Nil;
    if(L = nil) then
        L:=aux
    else 
        ult^.sig:=aux;
    ult:=aux;
end;

procedure cargoLista (var L:lista);
var
    t:telefono;
    ult:lista;
begin
    repeat
        leoDatos(t);
        cargoNodo(L,ult,t);
    until t.codCliente = 11111
end;

procedure InicializoVectorPagos (var v:vMediosPago);
var
    i:Integer;
begin
    for i:=1 to 6 do begin
        v[i]:=0;
    end;
end;
  
procedure calculoDosMaximos (v:vMediosPago; var MedioPago1,MedioPago2:Integer);
var i,max1,max2:Integer;
begin
    max1:=0;
    max2:=0;
    for i:= 1 to 6 do begin
        if (v[i] > max1) then begin
            max2:=max1;
            MedioPago2:=MedioPago1;
            
            max1:=v[i];
            MedioPago1:=i;
        end
        else 
            if (v[i] > max2) then begin
                max2:=v[i];
                MedioPago2:=i;
            end;
    end;
end;

function cumple (codigo:Integer):Boolean;
var
    dig:Integer;
begin   
    dig:= codigo MOD 10;
    if (dig = 0) or (dig = 1) then
        cumple:=False
    else 
        cumple:=True;
end;


procedure procesoLista (L:lista; var vM:vMediosPago; var vP:vPrecio; var cant:Integer);
begin
    cant:=0;
    while (L <> nil) do begin
        vM[L^.elem.medioPago]:= vM[L^.elem.medioPago] + vP[L^.elem.codigo];
        if (L^.elem.marcaTel = 'Motorola') and (cumple(L^.elem.codCliente)) then begin
            cant:=cant + 1;
        end;
        L:=L^.sig;
    end;
end;

var
    L:lista;
    vM:vMediosPago;
    vP:vPrecio;   
    MedioPago1,MedioPago2,cant:Integer;
begin
    L:=Nil;
    cargoLista(L);
    InicializoVectorPagos(vM); //porque no inicializo el vector de precios??
    //cargoTabla, se dispone

    procesoLista(L,vM,vP,cant);
    calculoDosMaximos(vM,MedioPago1,MedioPago2);

    WriteLn('Los 2 medios de pago que generaron mas ventas son: ',MedioPago1,MedioPago2);
    WriteLn('La cantidad de telefonos motorola vendidos a clientes cuyo codigo de cliente no termine en 0 ni 1 es: ',cant);

end.