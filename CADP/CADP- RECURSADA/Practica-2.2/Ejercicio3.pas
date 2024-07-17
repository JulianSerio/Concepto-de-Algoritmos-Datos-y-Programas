program ejercicio3;
{ suma los números entre a y b, y retorna el resultado en c } // 5to error, ningun parametro esta pasado por referencia, por lo
procedure sumar(a, b, c : integer) //1er error falta el ;     // tanto, no se va a ver modificado el valor de ninguna var
var
    suma : integer;
begin
    for i := a to b do //3er error? 
        suma := suma + i;
    c := c + suma;
end;

var
    result : integer;
begin
    result := 0;
    readln(a); readln(b);
    sumar(a, b, 0);
    write('La suma total es ',result); //4to error, result esta en 0 y no se modifica
    { averigua si el resultado final estuvo entre 10 y 30}
    ok := (result >= 10) or (result <= 30);
    if (not ok) then    //2do error variable ok no declarada
        write ('La suma no quedó entre 10 y 30');
end.
