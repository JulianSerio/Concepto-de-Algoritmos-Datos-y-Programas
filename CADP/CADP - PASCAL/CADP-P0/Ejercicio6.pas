program Ejercicio6; 

var
    Dolar,valorDolar,comision,valorFinal,pesos:Real;
begin   
    WriteLn('Ingrese monto de USD:');
    ReadLn(Dolar);
    WriteLn('Ingrese el valor del dolar:');
    ReadLn(valorDolar);
    WriteLn('Ingrese porcentanje de comision:');
    ReadLn(comision);
    pesos:= (Dolar * valorDolar);
    valorFinal:= (Pesos) + ((Pesos) * comision) / 100;
    Write('La transaccion sera:  ', valorFinal:1:2,'  pesos argentinos');
end.