program Ejercicio5;

procedure leoNum (var num:Real);
begin
    WriteLn('Ingrese numero');
    ReadLn(num); // buscar su doble
end;

procedure comparoyproceso(var count: Integer; var x: real; num:Real);
begin
    ReadLn(x);
    while ((num*2 <> x) and (count <> 10)) do begin
        count:= count + 1;
        ReadLn(x);
    end;
end;

procedure condicion (count:Integer; num,x:Real);
begin
    if (count = 10) then begin
        WriteLn('No se ha ingresado el doble de X');
    end
    else if (num*2 = x) then
        WriteLn('Se encontro el doble del numero');
end;
var
    count:Integer;
    num,x:Real;
begin
    count:=0;
    leoNum(num);
    comparoyproceso(count,x,num);
    condicion(count,num,x);
end.