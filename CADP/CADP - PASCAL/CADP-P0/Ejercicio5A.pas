program Ejercicio5A;

var 
    cantCaramelos,cantClientes:Byte;
    cantporCliente,cantparaSi:Integer;
    
begin
    cantporCliente:= 1;
    WriteLn('Introduce cantidad de caramelos');
    readln( cantCaramelos );
    WriteLn('Introduce cantidad de clientes');
    readln( cantClientes );
    cantparaSi := cantCaramelos - cantClientes;
    WriteLn('Los caramelos que le sobran son:', cantparaSi);
    WriteLn('Los caramelos que le corresponden a cada cliente son:', cantporCliente);
end.