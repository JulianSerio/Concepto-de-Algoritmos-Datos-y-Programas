program Ejercicio6;

procedure leoDatos (var cantUSD,precioUSD,porcentanje:Real);
begin
    WriteLn('Ingrese monto a transferir');
    ReadLn(cantUSD);
    WriteLn('Ingrese precio del dolar hoy');
    ReadLn(precioUSD);
    WriteLn('Ingrese comision');
    ReadLn(porcentanje);
end;

var
    cantUSD,precioUSD,total,porcentanje,pesos:Real;
begin
    leoDatos(cantUSD,precioUSD,porcentanje);
    pesos:= (cantUSD * precioUSD);
    total:= pesos + ((pesos * porcentanje) / 100);
    WriteLn('La transaccion sera de ',total:2:2 ,' pesos argentinos');
end.