program Ejercicio4c;
type
cadena = string[50];
puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
pun^:= 'Otro texto';
end;
var
pc: puntero_cadena;
begin
new(pc);
pc^:= 'Un texto';
writeln(pc^);
cambiarTexto(pc);
writeln(pc^);
end.


//IMPRIME UN TEXTO Y OTRO TEXTO 