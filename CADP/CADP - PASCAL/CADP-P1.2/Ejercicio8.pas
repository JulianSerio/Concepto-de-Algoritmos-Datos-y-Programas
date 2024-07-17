program Ejercicio8;

var
    monto, montoTotal:Real;
    i,ventaDia:Integer;
begin
    ventaDia:=0;                                     //INICIALIZO VARIABLES 
    montoTotal:= 0;

    for i:= 1 to 31 do                              //CANT DIAS X MES
    begin
        ventaDia:= 0;                                //INICIALIZO VENTAS POR DIA
        WriteLn('Ingrese monto a leer');
        ReadLn(monto);
        while (monto > 0) do                        //MONTO MAYOR A 0
            begin
                montoTotal:= montoTotal + monto;
                ventaDia:= ventaDia + 1;
                WriteLn('Ingrese monto');
                ReadLn(monto);
            end;
        WriteLn('Ventas totales del dia ', i,': ',ventaDia);
    end;
    writeln('El monto acumulado en el mes es de: ',montoTotal:0:2);
end.