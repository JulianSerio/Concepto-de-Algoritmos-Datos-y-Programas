program Ejercicio5;

var
	caramelos,clientes,caramClien,caramKios: integer;
	cobro: real;
begin
	writeln('Ingrese la cantidad de caramelos que posee el kioskero');
	read(caramelos);
	writeln('Ingrese la cantidad de clientes');
	read(clientes);

	caramClien:= caramelos div clientes;
	caramKios:= caramelos mod clientes;

	cobro:= 1.60 * caramClien * clientes;

	writeln('A cada cliente le corresponden ',caramClien,' caramelos');
	writeln('Al kioskero le quedaran ',caramKios,' caramelos');
	writeln('El kioskero debera cobrar $',cobro:1:2,'.');
end.