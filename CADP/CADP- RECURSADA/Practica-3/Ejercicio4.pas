program Ejercicio4;
type
	cliente=record
		codigo:integer;
		cantlin:integer;
	end;

	linea=record
		numtel:integer;
		cantmin:real;
		cantmb:real;
	end;

procedure leerlinea (var lineax:linea);
begin
	writeln('Ingrese el numero de telefono de la linea');
	readln(lineax.numtel);
	writeln('Ingrese la cantidad de minutos consumidos con la linea');
	readln(lineax.cantmin);
	writeln('Ingrese la cantidad de MB consumidos');
	readln(lineax.cantmb);
end;

procedure leercliente(var cliente:movistar);
var
	suma, sumamb, precmb,prec:real;
	i:integer;
	lineax:linea;
begin
	suma:=0;
	sumamb:=0;
	writeln('Ingrese el codigo del cliente');
	readln(cliente.codigo);
	writeln('Ingrese la cantidad de lineas a su nombre');
	readln(cliente.cantlin);
	for i:= 1 to cliente.cantlin do begin
		leerlinea(lineax);
		suma:=(suma + lineax.cantmin);
		sumamb:=(sumamb + lineax.cantmb);
	end;
	prec:= suma * 3.40;
	precmb:= sumamb * 1.35;
	writeln('Por los MB consumidos usted debe pagar ', precmb:0:3, ' y por los minutos consumidos ',prec:0:3);
end;

var
	i:integer;
	cliente:cliente;
BEGIN
	for i:= 1 to 9300 do
	begin
		leercliente(cliente);
	end;
	
END.