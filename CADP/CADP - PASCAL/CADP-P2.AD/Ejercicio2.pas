program Ejercicio2;

procedure lectura (var x,y:Integer);
begin
    WriteLn('Ingrese par de numeros');
    read(x);
    read(y);
end;

function suma (x,y:Integer):Integer;
var
    aux,i:Integer;
begin
    aux:=0;
    for i:= x to y do 
        aux:=aux + i;
    suma:=aux;
         
end;

function producto (x,y:Integer):Integer;
var
    aux,i:Integer;
begin
    aux:=1;
    for i:= x to y do
      aux:=aux*i;
    producto:=aux;
end;

var
    x,y,i:Integer;
begin
    for i:= 0 to 10 do
    begin
        lectura(x,y);
        WriteLn('La suma es: ',suma(x,y));
        WriteLn('El producto es: ',producto(x,y));
    end;
end.