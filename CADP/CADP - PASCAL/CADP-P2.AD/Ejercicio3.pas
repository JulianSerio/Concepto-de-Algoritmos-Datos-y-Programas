program Ejercicio3;

function codigoValido (codigo:Integer):boolean;
var
    ok:Boolean;
begin
    if (codigo > 1) and (codigo < 200) then begin
        ok:=True;
    end
    else begin
        ok:=False;
    end;
    codigoValido:=ok;
    
end;

procedure leer (codigo:Integer;precio:Real);
begin
    WriteLn('Ingrese codigo del producto');
    ReadLn(codigo);
    WriteLn('Ingrese precio del producto');
    ReadLn(precio);
end;

procedure ProdMasBarato (codigo:Integer;precio:Real; var CodigoMasBajo1,CodigoMasBajo2:Real);
var 
    min1,min2:Real;
    codigo1,codigo2:Integer;
begin
    min1:=9999;
    min2:=9999;

    if (precio < min1) then begin
        min2:=min1;
        CodigoMasBajo2:=CodigoMasBajo1;

        min1:=precio;
        CodigoMasBajo1:=codigo;
    end
    else if (precio < min2) then begin
            min2:=precio;
            CodigoMasBajo1:=codigo;
    end;
end;

procedure DieciseisYPar (codigo:Integer;precio:Real; var cantProd:Integer);
begin
    if ((codigo mod 2)= 0) then begin
        if (precio>16) then
        begin
            cantProd:=cantpProd + 1;
        end;
    end;
end;


var
    codigo,i,cantProd:Integer;
    precio,CodigoMasBajo1,CodigoMasBajo2:Real;
begin
    cantProd:=0;
    CodigoMasBajo1:=0;
    CodigoMasBajo2:=0;

    for i:=1 to 100 do begin
        leer(codigo,precio);
        if (codigoValido(codigo)) then begin
            ProdMasBarato(codigo,precio,CodigoMasBajo1,CodigoMasBajo2);
            DieciseisYPar(codigo,precio,cantProd);
        end
        else begin
            WriteLn('El codigo no es valido');
        end;
    end;
     WriteLn('Los productos mas baratos son: ',CodigoMasBajo1, 'y',CodigoMasBajo2);
     WriteLn ('La cantidad de productos especiales son: ',cantProd);
     
end.