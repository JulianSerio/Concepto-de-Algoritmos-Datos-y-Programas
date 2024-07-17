program Ejercicio6;

procedure elementoMaximoMinimo (v:vnumeros;dmL:integer;var posMin,posMax:integer; var max,min:Integer);
var
	i,max,min:integer;
begin
	max:= -999;
	min:= 999;
	for i:= 1 to dmL do begin
		if (v[i] > max) then begin
			max:= v[i];
			posMax:= i;
		end;
		if (v[i] < min) then begin
			min:= v[i];
			posMin:= i;
		end
	end;
end;

begin
  
end.