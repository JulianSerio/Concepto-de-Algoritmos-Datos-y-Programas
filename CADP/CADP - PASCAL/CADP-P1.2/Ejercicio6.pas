program Ejercicio6;

var
    i,precio,codigo,ProdPar16,codBarat1,codBarat2,precioMin1,precioMin2:Integer;
begin
    precioMin1:=2000;
    precioMin2:=2000;
    ProdPar16:= 0;
    for i:=1 to 4 do 
    begin   
        WriteLn('Ingrese codigo');
        Read(codigo);
        WriteLn('Ingrese precio');
        Read(precio);
        if ((codigo mod 2) = 0) and (precio > 16) then
            ProdPar16:= ProdPar16 + 1;
        if (precio < precioMin1) then begin
            precioMin2:= precioMin1;
            codBarat2:= codBarat1;
            precioMin1:= precio;
            codBarat1:= codigo;
        end
        else if (precio < precioMin2) then
            begin
                precioMin2:= precio;
                codBarat2:= codigo;
            end;
    end;
    writeln('Los codigos de los productos mas baratos son ', codBarat1, ' y ', codBarat2);
	writeln('La cantidad de productos de mas de 16 pesos y de codigo par son: ', ProdPar16);
end.