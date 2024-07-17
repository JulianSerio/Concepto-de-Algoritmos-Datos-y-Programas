program Ejercicio5B;

var 
    cantCaramelos,cantClientes:Integer;
    total:Real;
    
begin
    WriteLn('Introduce cantidad de caramelos');
    readln( cantCaramelos );
    WriteLn('Introduce cantidad de clientes');
    readln( cantClientes );
    total:= ((cantCaramelos * 1.60)/ (cantCaramelos div cantClientes));
    Write('El kioskero recaudo un total de:', total:0);
end.