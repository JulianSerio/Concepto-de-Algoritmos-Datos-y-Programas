program Ejercicio4;

var
    min1,min2,num,i:Integer;
begin
    min1:=9999; min2:=9999;
    for i:=1 to 5 do begin
        ReadLn(num);
        if (num < min1) then begin
            min2:=min1;
            min1:= num;
        end
        else if (num < min2) then begin
            min2:=num;
        end;
    end;
    WriteLn('Los numero mas chicos leidos fueron: ',min1, ' y ',min2);
end.