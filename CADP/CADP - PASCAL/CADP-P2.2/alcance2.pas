program alcance2;
   function descomponer (x : integer) : integer;
     var
         cant, dig : integer;
     begin
        cant := 0;
        while (x <> 0) do begin
             dig := X mod 10;
             if ( (dig MOD 2) = 0 ) then
                 cant := cant + 1;
              x := x DIV 10;
        end;
        descomponer := cant;
    end;
var
   total, num : integer;
begin
    total := 0;
    repeat
    readln(num);
    total := total + descomponer(num);
    until (num = 10);
    writeln(total);
end.