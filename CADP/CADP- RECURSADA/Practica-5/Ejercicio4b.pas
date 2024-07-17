program Ejercicio4b;
type
cadena = string[50];
puntero_cadena = ^cadena;
var
pc: puntero_cadena;
begin
new(pc);
pc^:= 'un nuevo nombre';
writeln(sizeof(pc^), ' bytes');
writeln(pc^);
dispose(pc);
pc^:= 'otro nuevo nombre'; //ERRORR
end.


//HAY UN ERROR
//IMPRIME 51 bytes
//"un nuevo nombre"
