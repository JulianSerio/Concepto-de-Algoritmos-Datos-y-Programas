program Ejercicio4;

var
    num1,numaux: Real;
begin
    WriteLn('Ingrese primer numero');
    ReadLn(num1);
    WriteLn('Ingrese numero');
    ReadLn(numaux);
    while (num1*2<>numaux) do
    begin
	    writeln('Ingrese otro numero real');
		readln(numaux);
	end;
	writeln(numaux:1:2,' ', 'es el doble de ',num1:1:2);	//Espacios y DECIMALES 

end. 