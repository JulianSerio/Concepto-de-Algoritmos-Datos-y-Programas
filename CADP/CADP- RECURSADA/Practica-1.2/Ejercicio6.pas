program Ejercicio6;

var
    i,codigo,codmin1,codmin2,cant:Integer;
    precio,min1,min2:Real;

begin
    cant:=0;
    min2:=9999;
    min2:=9999;
    for i:= 1 to 200 do begin
        WriteLn('Ingrese codigo del producto');
        ReadLn(codigo);
        WriteLn('Ingrese precio del producto');
        ReadLn(precio);

        if (precio < min1) then begin
            min2:= min1;
            min1:= precio;

            codmin2:= codmin1;
            codmin1:=codigo
        end
        else if (precio < min2) then begin 
            min2:= precio;
            codmin2:= codigo
        end;

        if (precio > 16) and ((codigo mod 2)= 0) then
            cant:= cant + 1;  
    end;

    WriteLn('Los codigos de los productos de menor precio son: ',codmin1, ' y ',codmin2);
    WriteLn('La cantidad de productos de mas de 16 pesos con codigo par es: ',cant);
end.