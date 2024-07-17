program Ejercicio5;

var
    num1,numaux: Real;
    contador:Integer;
begin
    WriteLn('Ingrese primer numero');
    ReadLn(num1);
    WriteLn('Ingrese numero');
    ReadLn(numaux);
    contador:= 0;
    while (num1*2<>numaux) and (contador <= 10) do
    begin
	    writeln('Ingrese otro numero real');
		readln(numaux);
        contador:= contador + 1;
	end;
    if (numaux = num1*2) then
    begin
        WriteLn('Se encontro el doble de: ', num1:2:0);
    end
    else
    begin
        WriteLn('No se encontro el doble de: ', num1:2:0)
    end;
end. 
