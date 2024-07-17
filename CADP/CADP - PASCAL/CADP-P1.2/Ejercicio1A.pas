program Ejercicio1A;

var
    i,num,suma,sumaTotal,mayor5:Integer;
begin
    sumaTotal:=0;
  
    for i:= 1 to 10 do 
        begin
            suma:= 0;
            WriteLn('Ingrese numero');
            ReadLn(num);
            suma:= suma + num;
            sumaTotal:= sumaTotal + suma;
            if (num > 5) then 
            begin
                mayor5:= mayor5 + 1 
            end;
        end;
        WriteLn('La suma de numeros ingresados es: ',sumaTotal); 
        WriteLn('La cantidad de numeros mayores a 5 son: ', mayor5);
end.