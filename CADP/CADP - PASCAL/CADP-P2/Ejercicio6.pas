program Ejercicio6;

var                                             //VAR GLOBAL
    max: Integer;

procedure numeritos (num,numParA: Integer);
begin 
    WriteLn('Ingrese numero');                  //CONFIRMO SI SE CUMPLE LA CONDICION PARA ENTRAR AL WHILE
    ReadLn(num);
    while (num > 0) do
    begin
        WriteLn('Ingrese numero');
        ReadLn(num);
        if ((num mod 2)= 0) then            
        begin
            if (num > max) then
                numParA:= num;        
        end;
    end;
    Write('El numero par mas alto fue el:  ',numParA);

end;
var
    x,y: Integer;
begin
    max:=0;
    numeritos(x,y);
end.