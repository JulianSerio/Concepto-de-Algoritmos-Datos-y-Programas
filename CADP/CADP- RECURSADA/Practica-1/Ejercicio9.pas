program Ejercicio9;

var
    signo:Char;
    num,suma,resta:Integer;
begin
    suma:=0;resta:=0;
    WriteLn('Ingrese signo');
    ReadLn(signo);
    if (signo = '+') then begin
        repeat
        //while (num <> 0) do begin
            WriteLn('Ingrese secuencia de caracteres');
            ReadLn(num);
            suma:= num + suma
        //end;
        until num = 0;
        WriteLn('El resultado de suma fue: ',suma);
    end
    else if (signo = '-') then begin
        while (num <> 0) do begin
            ReadLn(num);
            resta:= num - resta;
        end;
        WriteLn('El resultado de la resta fue: ',resta);
    end
    else 
        WriteLn('El caracter ingresado no corresponde con ninguna operacion!');

end.