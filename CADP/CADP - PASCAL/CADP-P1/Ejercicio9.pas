program Ejercicio9; 

var
    simbolo:Char;
    num1,num2,num3,num4,num5:Integer;
begin
    WriteLn('Ingresar operacion a realizar');
    ReadLn(simbolo);

    if (simbolo <> '+') and (simbolo <> '-') then
    begin
        WriteLn('ERROR!');
        exit;
    end
    else 
        WriteLn('Ingrese secuencia de numeros finalizando con 0');
        ReadLn(num1,num2,num3,num4,num5);

        if (simbolo= '+') then
        begin
            WriteLn(num1,'(',num2,simbolo,num3,simbolo,num4,'(',num5,')',')');
            Write(num1*(num2+num3+num4*(num5)));
        end
        else
        begin
            WriteLn(num1,'(',num2,simbolo,num3,simbolo,num4,'(',num5,')',')');
            Write(num1*(num2-num3-num4*(num5)));
        end;
end.



begin
    leer caracter
    
    si el caracter es valido
        //leer la secuencia ?  sec: 5 2 0 -> 3  
        leer el num        --> 5
        //1er iteracion 
        resultado := num 
        
        mientras num <> 0
            leer el num     
            si es +
                resultado = resultado + num  
            sino
                resultado = resultado - num =3  
        informar el resultado 
    sino
        informar --> error
end.