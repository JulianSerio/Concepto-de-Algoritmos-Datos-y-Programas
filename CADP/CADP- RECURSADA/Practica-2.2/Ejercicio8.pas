program Ejercicio8;

procedure leoDatos (var precio:Real; var codigo:Integer; var tipo:String);
begin
    WriteLn('Ingrese tipo de prenda');ReadLn(tipo);
    WriteLn('Ingrese precio de la prenda');ReadLn(precio);
    WriteLn('Ingrese codigo de la prenda');ReadLn(codigo);
end;

procedure minimos (precio:Real;codigo:Integer; var prod1,prod2:Integer);
var
    min1,min2:Real;
begin
    min1:=9999;min2:=9999;
    if (precio < min1) then begin
        min2:=min1;
        min1:=precio;

        prod2:=prod1;
        prod1:= codigo;
    end
    else if (precio < min2) then begin
        min2:=precio;
        prod2:=codigo;
    end;
end;

procedure pantalonCaro (precio:Real;codigo:integer;tipo:String; var codPantalon:Integer);
var
    max:Real;
begin
    max:= 0;
    if (tipo = 'pantalon') then begin
        if (precio > max) then begin
            max:= precio;
            codPantalon:= codigo;
        end;
    end;
end;

var
    i,codigo,prod1,prod2,codPantalon:Integer;
    tipo:string;
    precio,iteraciones,total,prom:Real;
begin
    iteraciones:=0; total:=0;prom:=0;
    for i:= 1 to 100 do begin
        leoDatos(precio,codigo,tipo);
        minimos(precio,codigo,prod1,prod2);
        pantalonCaro(precio,codigo,tipo,codPantalon);

        iteraciones:= iteraciones + 1;
        total:= total + precio;        
    end;

    prom:= total / iteraciones;
    WriteLn('Codigo de los dos productos mas baratos', prod1, ' y ', prod2);
    WriteLn('Cpdigo del producto de tipo “pantalon” más caro.');
    WriteLn('El precio promedio si: ', prom);
end.