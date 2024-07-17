program Ejercicio12;

function esVocal(c:char):boolean;
begin
  esVocal:=((c='a')or(c='e')or(c='i')or(c='o')or(c='u')or(c='A')or(c='E')or(c='I')or(c='O')or(c='U')); 
end;    


procedure cumpleA (var cumple:boolean);
var
  letra:char;
begin 
  write('Ingrese la secuencia A: ');
  read(letra);
  while (letra <> '$')and (cumple) do
    begin
      if (not esVocal(letra)) then 
        cumple:=false
      else
        read(letra);
    end;
end;                         
 

function esLetra (letra:char):boolean;
begin
  esLetra:= ((letra>='a')and (letra<='z')) or ((letra>='A')and (letra<='Z'))
end;  


procedure cumpleB (var cumple:boolean);
var
  letra:char;
begin
  write('Ingrese la secuencia B: ');
  read(letra);
  while (letra <>'#')and (cumple) do
    begin
      if ((not (esLetra(letra))) and (esVocal(letra))) then
        cumple:=false
      else
        read(letra);
      end;
end;  

var
  cumple:boolean;
begin
  cumple:=true;
  cumpleA (cumple);
  if (cumple) then
    begin
      cumpleB(cumple);
      if (cumple)then
        writeln('Cumple con la secuencia')
      else
        writeln('No cumple con B');
    end
  else
    writeln('No cumple con A');
end.