program Ejercicio13;

procedure primeraParte(var verdadero:boolean; var cantidad:integer);
var
	caracter:char;
begin
	writeln('Diga un caracter para la primera parte');
	readln(caracter);
	while(caracter <> '$')and(caracter <> '%')and(verdadero = true)do
		begin
			writeln('Diga un caracter para la primera parte');
			readln(caracter);
			cantidad:= cantidad + 1;
		end;
	if(caracter = '$')then
		verdadero:= false
	else
		if(caracter = '%')then
			begin
				verdadero:= true;
				cantidad:= cantidad + 1;
			end;
end;
procedure segundaParte(var verdadero:boolean; var cantidad:integer);
var
	caracter:char;
	total,i:integer;
begin
	total:= 0; caracter:= '0';
	for i:= 1 to cantidad do
		begin
			writeln('Diga el ',i,' de ',cantidad,' caracteres para la segunda parte');
			readln(caracter);
			
			if(caracter = '@')then
				total:= total + 1;
		end;
	if(total = 3)and(caracter = '*')then
		verdadero:= true
	else
		verdadero:= false;
end;
var
	parte1,parte2:boolean;
	cantidad:integer;
begin
	parte1:= true; parte2:= true; cantidad:= 0;
	primeraParte(parte1,cantidad);
	segundaParte(parte2,cantidad);
	if(parte1 = false)then
		writeln('No se cumplio la primera parte');
	if(parte2 = false)then
		writeln('No se cumplio la segunda parte');
	if(parte1 = true) and (parte2 = true)then
		writeln('Todo salio perfecto');
end.