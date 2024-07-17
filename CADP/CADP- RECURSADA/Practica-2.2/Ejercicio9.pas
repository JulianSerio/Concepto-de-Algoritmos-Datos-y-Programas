program Ejercicio9;

procedure leoDatos (var num:Integer);
begin
    WriteLn('Ingrese numero');
    ReadLn(num);
end;

procedure descomponer (num:integer; var suma,sumaDIG:Integer);
var
    cantDig,dig:Integer;
begin
    cantDig:= 0;                                    //INICIALIZO VARIABLES 
    while (num <> 0) do
    begin
        dig:= num mod 10;                          //DESCOMPONGO
        cantDig:= cantDig + 1;                      //CONTABILIZO DIGITOS
        suma:= suma + dig;                       //SUMO DIGITOS 
        num:= num div 10;
    end;
    sumaDIG:=sumaDIG+cantDig;
end;

var
    num,suma,sumaDIG:Integer;
begin
    sumaDIG:=0;
    suma:=0;
    repeat
        leoDatos(num);
        descomponer(num,suma,sumaDIG);
    until (suma = 10);
    WriteLn('Se leyeron: ', sumaDIG);
end.