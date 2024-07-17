program Ejercicio1;
type
    vnums = array [1..10] of integer;
var
    numeros : vnums;
    i ,j: integer;
begin
    for i:=1 to 10 do {primer bloque for}
        numeros[i] := i;
    for i := 2 to 10 do {segundo bloque for}
        numeros[i] := numeros[i] + numeros [i-1];
end.
a)

{1,2,3,4,5,6,7,8,9.10} //Nums despues del primer For

b)

{1,3,5,7,9,11,13,15,17,19}//Nums despues del segundo For

c)

for i:=1 to 9 do
numeros[i]:= numeros[i]+numeros[i+1];

d)

{1,1,1,1,1,1,1,1,1,1}