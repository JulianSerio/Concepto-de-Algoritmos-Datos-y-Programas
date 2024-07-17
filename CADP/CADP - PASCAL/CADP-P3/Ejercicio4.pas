program Ejercicio4;

type 
    linea = record
        numero:Integer;
        cantMinutos:Real;
        cantMBconsumido:Real;
end;
    cliente = record
        codigo:Integer;
        cantLineas:linea;
        numeroDeLineas:Integer;
end;

procedure totales (c:cliente; var totalMB,totalMin:Real);
begin
    totalMin:= (c.cantLineas.cantMinutos * 3.40);
    totalMB:=(c.cantLineas.cantMBconsumido * 1.35);
end;

procedure leerLinea (var c:cliente);
begin
    WriteLn('Ingrese numero');
    ReadLn(c.cantLineas.numero);
    WriteLn('Ingrese cantidad de minutos');
    ReadLn(c.cantLineas.cantMinutos);
    WriteLn('Ingrese cantidad de mb consumidos');
    ReadLn(c.cantLineas.cantMBconsumido);
end;

procedure leerCliente (var c:cliente; var totalMB,totalMin:Real);
var
    i:Integer;
begin
    WriteLn('Ingrese codigo del cliente');
    ReadLn(c.codigo);
    WriteLn('Ingrese numero de lineas del cliente');
    ReadLn(c.numeroDeLineas);
    for i:=1 to c.numeroDeLineas do begin
        leerLinea(c);
        totales(c,totalMB,totalMin);
    end;
end;

var
    c:cliente;
    i:Integer;
    totalMB,totalMin:Real;
begin
	for i:=1 to 3 do begin
        totalMin:=0;
        totalMB:=0;

        leerCliente(c,totalMB,totalMin);
		writeln('El cliente debe pagar: ', totalMin:2:2, ' por minuto consumido y ', totalMB:2:2, ' por MB consumido');
    end;
end.