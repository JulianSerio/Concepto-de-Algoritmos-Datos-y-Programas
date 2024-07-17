program Ejercicio5;

procedure leoNumerosYproceso (var numA,numB:Integer);
begin
    WriteLn('Ingrese numero A');
    ReadLn(numA);
    WriteLn('Ingrese numero B');
    ReadLn(numB);
end;

var
    numA,numB:Integer;
    cantPares, cantMul:Integer;
begin
    cantPares:= 0;cantMul:=0;
    leoNumerosYproceso(numA,numB);
    while ((numA <> 0) OR (numB <> 0)) do begin
        cantPares:= cantPares + 1;
        if ((numA  *2)= numB) then
            cantMul:= cantMul + 1;
        leoNumerosYproceso(numA,numB);
    end;
    WriteLn('La cantidad de pares leidos es: ',cantPares);
    WriteLn('la cantidad de pares en las que numB es el doble de numA es: ',cantMul);
   
end.