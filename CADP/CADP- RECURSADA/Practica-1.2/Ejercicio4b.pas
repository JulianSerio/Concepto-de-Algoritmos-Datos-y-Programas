program Ejercicio4b;

var
    min1,min2,num:Integer;
begin
    min1:=9999; min2:=9999;
    ReadLn(num);
    while (num <> 0) do begin 
        ReadLn(num);
        if (num < min1) then begin
            min2:=min1;
            min1:= num;
        end
        else if (num < min2) then begin
            min2:=num;
        end;
        ReadLn(num);
    end;
    WriteLn('Los numero mas chicos leidos fueron: ',min1, ' y ',min2);
end.