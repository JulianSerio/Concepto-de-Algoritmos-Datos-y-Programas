program Ejercicio4;

procedure leoNum (var num:real);
begin
    WriteLn('Ingrese numero');
    ReadLn(num);
end;

var
    num,x:Real;
begin
    leoNum(num); //busco el doble de este numero
    ReadLn(x);
    while (num*2 <> x ) do begin
        WriteLn('Ingrese otro numero');
        ReadLn(x);
    end;

end.