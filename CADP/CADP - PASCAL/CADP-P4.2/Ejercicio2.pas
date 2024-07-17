program Ejercicio2;
const
    dF = 500;
type
    nombreAlumnos = array [1..dF] of String;

procedure CargoVector(var v:nombreAlumnos;var dL:integer); 
var
    i:Integer;
    nombre:String;
begin
    i:=0;                 
    ReadLn(nombre);
    while ((nombre<> 'ZZZ') and (dL<dF)) do begin      //MIENTRAS NOMBRE <> DE ZZZ y LA DL SEA MENOR QUE LA DF
        i:=i+1;                 //AUMENTO I
        dL:=dL+1;               //AUMENTO DL
        v[i]:=nombre;           //ASIGNO NOMBRE
        ReadLn(nombre);         //LEO OTRO NOMBRE   
    end;
end;

procedure borrar(var v:nombreAlumnos ; var dL:integer);
var
    nombre : string;
    eliminado : boolean;
    i,j:integer;
begin
	write('Escriba el nombre en el que quiere encontrar una ocurrencia : ');
    readln(nombre);
	eliminado := false;i:=1;
	while (not eliminado)and (i <= dL)do begin
        if (i <= dL) then begin
	        if(v[i] = nombre)then begin
			    for j:=i to (dL-1)do
			    begin
				    v[j]:=v[j+1];
			    end;
			    eliminado := true;
			    dl:=dl-1;
            end;
            i:= i + 1;
        end;
	end;
end;

procedure insertar (var v:nombreAlumnos; var dL:Integer); 
var
   i,num:Integer
   nombreInsertar:String;
begin
    num:=4;
	if(dL < dF)then
	begin
		for i:=dL downto num do
		begin
			v[i+1]:=v[i];
		end;
		write('Escriba un nombre para insertar en la 4ta posicion : ');readln(nombre);
		v[num] := nombreInsertar;
		dL:= dL+1;	
	end;
end;

procedure agregarElemento (v:nombreAlumnos; dL:Integer);
var
    agregadoPa:Boolean;
    nombreaAgregar:String;
begin
    agregadoPa:=False;
    WriteLn('Ingrese nombre a agregar');        //INGRESO NOMBRE
    ReadLn(nombreaAgregar);
    if ((dL + 1) <= dF) then begin          //SI LA DL + 1 ES <= A LA DF 
      agregadoPa:=True;         
      dL:=dL + 1;               //AUMENTO DIMENSIO LOGICA
      v[dL]:= nombreaAgregar;   //AGREGO NOMBRE 
    end;
end;


var
    dL: Integer;
    v:nombreAlumnos;
begin
    dL:=0;
    CargoVector(v,dL);  //a
    borrar(v,dL); // b 
    insertar(v,dL); //c
    agregarElemento(v,dL);  //d

end.