program Ejercicio3;

var
    numero1:Real;
    numero2:Real;
    division:Real;

begin
    WriteLn('Ingrese numero real');
    ReadLn(numero1);
    WriteLn('Ingrese otro numero');
    ReadLn(numero2);
    write('El resultado de dividir  ',numero1:2:2,'  por  ',numero2:2:2,'  es  ');
    division:= (numero1/numero2);
    Write(division:4:2);
end.