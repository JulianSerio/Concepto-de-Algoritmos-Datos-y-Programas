program Ejercicio1;

var
    i,num,suma,sumaTotal:Integer;
begin
    sumaTotal:=0;
  
    for i:= 1 to 10 do 
        begin
            suma:= 0;
            WriteLn('Ingrese numero');
            ReadLn(num);
            suma:= suma + num;
            sumaTotal:= sumaTotal + suma;
        end;
        Write(sumaTotal); 
end.