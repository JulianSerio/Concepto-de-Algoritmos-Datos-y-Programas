program Ejercicio2;
var
    num,i,pos,max:Integer;
begin
    max:=0;counter:=0;
    for i:= 1 to 10 do begin
        WriteLn('Ingrese numero');
        ReadLn(num); 

        if (max < num) then begin
          max:= num;
          pos:=i;
        end;
    end;
    WriteLn('El mayor numero leido fue el ',max,' en la posicion ',i);

end.