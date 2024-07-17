program Ejercicio7;

var
    producto,PrecioProducto1,PrecioProducto2:Integer;
    porcentaje:Real;
begin
    WriteLn('Ingrese codigo del producto');
    ReadLn(producto);
    WriteLn('Ingrese el valor del producto');
    ReadLn(PrecioProducto1);
    WriteLn('Ingrese el precio del producto actualizado');
    ReadLn(PrecioProducto2);
    porcentaje:= (producto*PrecioProducto1) / 100;
    write(porcentaje:2:0);
end.