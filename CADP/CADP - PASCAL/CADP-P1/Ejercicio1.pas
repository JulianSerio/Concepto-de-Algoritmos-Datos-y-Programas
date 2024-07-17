program Ejercicio1;

var
    numero1,numero2:Integer; 

begin   
    WriteLn('Ingrese numero entero');
    ReadLn(numero1);
    WriteLn('Ingrese otro numero entero');
    ReadLn(numero2);
    if (numero1 = numero2) then
        begin
            Write('Los numeros ingresados son iguales');
        end
    else
        begin
            Write('Los numeros ingresados no son iguales');
    
        end;
end.