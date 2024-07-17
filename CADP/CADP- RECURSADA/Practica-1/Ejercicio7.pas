program Ejercicio7;

procedure leoDatos (var codigo:integer; var precioActual,precioNuevo:Real);
begin
    WriteLn('Ingrese codigo del producto');
    ReadLn(codigo);
    WriteLn('Ingrese precio del producto');
    ReadLn(precioActual);
    WriteLn('Ingrese precio del producto actualizado');
    ReadLn(precioNuevo);
end;

procedure condicion (codigo:Integer; aum,precioNuevo:Real);
begin
    if (aum > precioNuevo) then
		writeln('El aumento de precio del producto: ', codigo, ' no supera el 10%')
    else
        writeln('El aumento de precio del producto: ', codigo, ' es superior al 10%');
end;

var
    codigo:integer; 
    precioActual,precioNuevo,aum:Real;
begin
    leoDatos(codigo,precioActual,precioNuevo);
    while (codigo <>  32767) do begin
        aum:= (precioNuevo * 100) / precioActual ;
        condicion(codigo,aum,precioNuevo);
        leoDatos(codigo,precioActual,precioNuevo);
    end;
end.