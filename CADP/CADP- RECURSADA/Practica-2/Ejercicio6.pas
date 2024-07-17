program Ejercicio6;

procedure noneg (var max,num:Integer);
begin
    max:=0;
    ReadLn(num);
    while (num > 0) do begin
        if ((num mod 2)=0) then begin
          if (num > max) then
            max:= num;
        end;
        ReadLn(num);
    end;
    WriteLn('El numero par mas alto fue el: ', max);
end;

var
    max,num:Integer;
begin
    noneg(max,num);
end.