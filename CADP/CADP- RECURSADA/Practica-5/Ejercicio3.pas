program Ejercicio3;
type
numeros = array[1..10000] of integer;
puntero_numeros = ^numeros;
var
n: puntero_numeros;
num: numeros;
i:integer;
begin
writeln(sizeof(n), ' bytes');
writeln(sizeof(num), ' bytes');
new(n);
writeln(sizeof(n^), ' bytes');
for i:= 1 to 5000 do
n^[i]:= i;
writeln(sizeof(n^), ' bytes');
end.

//imprime
//4 bytes el puntero 
//20000 bytes si un entero ocupa 2 bytes un vector de 10.000 enteros es 2 * 10.000 
//20000 bytes
//20000 bytes
//20000 bytes