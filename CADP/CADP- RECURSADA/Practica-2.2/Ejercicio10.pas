program Ejercicio10;

procedure leoNum (var num:Integer);
begin
    WriteLn('Ingreso num');
    ReadLn(num);
end;

procedure descomponer (num:integer; var suma, impar:Integer);
var
    cantDig,dig:Integer;
begin
    cantDig:= 0;                                    //INICIALIZO VARIABLES 
    suma:=0;
    impar:=0;
    while (num <> 0) do
    begin
        dig:= num mod 10;                          //DESCOMPONGO
        cantDig:= cantDig + 1;                    //CONTABILIZO DIGITOS
        if ((dig mod 2)=0) then
            suma:= suma + dig                    //SUMO DIGITOS
        else 
            impar:= impar + 1;

        num:= num div 10;
    end;
end;

var
    num,suma,impar:Integer;
begin
    leoNum(num);
    while (num <> 123456) do begin
        descomponer(num,suma,impar);
        leoNum(num);
        WriteLn('La suma de sus digitos pares: ',suma);
        WriteLn('La cantidad de numeros impares es: ',impar);
    end;
end.