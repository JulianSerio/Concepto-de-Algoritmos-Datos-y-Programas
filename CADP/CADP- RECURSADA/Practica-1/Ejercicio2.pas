program Ejercicio2;

procedure leoNum (var num:Integer);
begin
    WriteLn('Ingrese numero: ');
    ReadLn(num);
end;

procedure convierto (num:Integer);
var
    abs:integer;
begin
  if (num < 0) then begin
        abs:= num * (-1);
        WriteLn(abs);
    end
    else 
        WriteLn(num);
end;

var
    num:Integer;
begin
    leoNum(num);
    convierto(num);
end.