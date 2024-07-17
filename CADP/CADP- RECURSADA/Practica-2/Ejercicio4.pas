program Ejercicio4;
var a,b: integer;
procedure uno;
begin
 a := 1;
 writeln(a);
end;
begin
 a:= 1;
 b:= 2;
 uno;
 writeln(b, a);
end.

                    //LA DIFERENCIA ENTRE ESTOS DOS PROGRAMAS ES QUE EN EL SEGUNDO SE DEFINEN VARIABLES DEL PPAL DESPUES DEL PROCESO 
                    //EN EL ANTERIOR SE DEFINEN ANTES DEL PROCESO
program alcance4b;
procedure uno;
begin
 a := 1;
 writeln(a);
end;
var a,b: integer;
begin
 a:= 1;
 b:= 2;
 uno;
 writeln(b, a);
end.