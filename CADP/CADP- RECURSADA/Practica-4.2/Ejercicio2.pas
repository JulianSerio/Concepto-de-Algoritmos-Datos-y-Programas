program Ejercicio2;
const 
	DimF=500;
type
	vector = array [1..DimF] of string;

//A
procedure CargarVec (var VecAlumnos:vector;var DimL:integer);
var
	nombre:string;
begin
	write('Ingrese un nombre: ');
	readln(nombre);
	while(nombre <> 'ZZZ') and (DimL <> DimF) do begin
	    DimL:=DimL + 1;
		VecAlumnos[DimL]:= nombre;
		write('Ingrese otro nombre: ');
		readln(nombre);
	end;
end;

//B
procedure EliminarNombre (var VecAlumnos:vector;var DimL: integer;var ok:boolean);
var
    nombre:string;
	i,b:integer;
begin
	ok:= false;
	i:=0;
	write('Ingrese el nombre que desea eliminar: ');
	readln(nombre);
	while (i <> DimL) and (not ok) do begin
		i:= i + 1;
	    if (vecAlumnos[i] = nombre) then begin
		    for b:= i to (DimL - 1) do begin
				VecAlumnos[b]:= VecAlumnos[b + 1];
			end;
			ok:=true;
			DimL -= 1;
		end;
	end;
end;

//C
Procedure InsertarPos (var v:vAlu; var dimL: integer; var exito: boolean);
var 
    i,pos:integer;
    nombre:string;
Begin
    exito:= false;
    WriteLn('Ingrese nombre que desea insertar: ');ReadLn(nombre);
    WriteLn('Ingrese posicion donde desea insertar: ');ReadLn(pos);
    if ((dimL + 1) <= dimF) then begin      
        for i:= dimL downto pos do 
            v[i+1] := v[i];
        exito:= true;
        v [pos] := nombre;     
        dimL := dimL + 1;
    end;
end;

//D
procedure AgregarNombre (var VecAlumnos:vector;var DimL:integer;var ok:boolean);
var
    nombre:string;
begin
	ok:=false;
	write('Ingrese el nombre que desea agregar:');
	readln(nombre);
	if ((DimL + 1) <= DimF) then begin
	    DimL += 1;
		VecAlumnos[DimL]:=nombre;
		ok:=true;
	end;
end;

var
	VecAlumnos:vector;
	dimL,pos:integer;
	ok:boolean;
begin
	pos:=4;
	DimL:=0;
    //////////////////////////////////////
	CargarVec(vecAlumnos,DimL);
    //////////////////////////////////////
	EliminarNombre(vecAlumnos,DimL,ok);
	if (ok) then
		writeln('Se logro eliminar el nombre indicado.')
	else
		write('El nombre indicado no existe dentro del vector.');
    //////////////////////////////////////
	InsertarNombre(vecAlumnos,DimL,pos,ok);
	if (ok) then
	    writeln('Se logro insertar el nombre deseado.')
	else
		writeln('No se pudo insertar el nombre deseado.');
    //////////////////////////////////////
	AgregarNombre(VecAlumnos,DimL,ok);
	if (ok) then
		writeln('Se logro agregar el nombre con exito.')
	else
		writeln('No se pudo agregar el nombre.');
end.