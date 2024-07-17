program Ejercicio4a;

var
    min1,min2,num:Integer;
begin
    min1:=9999; min2:=9999;
    repeat 
        ReadLn(num);
        if (num < min1) then begin
            min2:=min1;
            min1:= num;
        end
        else if (num < min2) then begin
            min2:=num;
        end;
    until num = 0;
    WriteLn('Los numero mas chicos leidos fueron: ',min1, ' y ',min2);
end.