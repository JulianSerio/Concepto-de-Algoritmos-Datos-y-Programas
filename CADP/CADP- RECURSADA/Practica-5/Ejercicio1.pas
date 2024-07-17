
program Ejercicio1;
type
    cadena = string[20];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    writeln(sizeof(pc), ' bytes');
    new(pc);
    writeln(sizeof(pc), ' bytes');
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc), ' bytes');
    writeln(sizeof(pc^), ' bytes');
    pc^:= 'otro nuevo nombre distinto al anterior';
    writeln(sizeof(pc^), ' bytes');
end.


//Imprime 
//4 bytes  por el puntero 
//4 bytes  por el puntero 
//4 bytes  por el puntero 
//21 bytes tamano del string
//21 bytes tamano del string
