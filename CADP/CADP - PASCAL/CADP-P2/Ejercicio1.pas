program Ejercicio1;

procedure uno (var x:Integer);
begin
  x:= x+1;
  write (x);
end;

var 
    num:Integer;
begin
  num:= 9;
  uno(num);
  write(num);
end.