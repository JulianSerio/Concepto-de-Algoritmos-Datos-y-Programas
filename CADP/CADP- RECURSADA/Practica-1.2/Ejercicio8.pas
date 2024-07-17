program Ejercicio8;

var
    monto, montoT,ventMax: real;
    i,cantVentas,diaVentas: integer;

begin
montoT:=0;
ventMax:=-1;

  for i:= 1 to 31 do begin
    cantVentas:=0;

    writeln ('Dia: ',i,' .');
    writeln ('Ingrese monto: '); readln (monto);

    repeat

      montoT:= montoT + monto;
      cantVentas:= cantVentas + 1;

      writeln ('Ingrese otro monto: '); readln (monto);

    until (monto = 0);

    if (cantVentas > ventMax) then begin
      ventMax:= cantVentas;
      diaVentas:= i;
    end;

    writeln ('La cantidad de ventas del dia ',i,' fue de: ', cantVentas, '.');
end;

  writeln ('El monto total acumulado de ventas de todo el mes fue de: ',montoT:1:2,'.');
  writeln ('El dia con mas ventas fue el dia: ',diaVentas,'.');

end.    