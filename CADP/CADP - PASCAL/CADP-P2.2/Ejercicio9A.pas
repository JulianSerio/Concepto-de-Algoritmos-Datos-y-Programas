program Ejercicio9A;

procedure descomponer (num:integer);
var
    suma,cantDig,dig:Integer;

begin
    cantDig:= 0;                                    //INICIALIZO VARIABLES 
    suma:=0;

    WriteLn('Ingrese numero a descomponer');
    Read(num);

    while (num <> 0) do
    begin
        dig:= num mod 10;                          //DESCOMPONGO
        WriteLn(dig);

        cantDig:= cantDig + 1;                      //CONTABILIZO DIGITOS
                    
        suma:= (suma + dig);                       //SUMO DIGITOS 
        num:= (num div 10);
    end;


    WriteLn('La suma de los digitos es: ',suma);
    WriteLn('La cantidad de digitos del numero es: ',cantDig);
end;

var
    num:Integer;
begin
    descomponer(num);
end.