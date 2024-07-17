program Ejercicio8;
type 
    str = string[20];

    datos = record
        DNI:Integer;
        nombre:str;
        apellido:str;
        email:str;
    end;

    proyecto = record
        cod:Integer;
        titulo:str;
        docCordinador:datos;
        cantAlumnos:Integer;
        escuela:str;
        localidad:str;
    end;


procedure leoProyecto (var p:proyecto);
begin
    Writeln('Codigo: ');Readln(p.cod);
    if (p.cod <> -1) then begin
        Writeln('Titulo: ');Readln(p.titulo);
        Writeln('Cantidad de Alumnos: ');Readln(p.cantAlumnos);
        Writeln('DNI: ');Readln(p.docCordinador.DNI);
        Writeln('Nombre: ');Readln(p.docCordinador.nombre);
        Writeln('Apellido: ');Readln(p.docCordinador.apellido);
        Writeln('Email: ');Readln(p.docCordinador.email);
        Writeln('Escuela: '); Readln(p.escuela);
        Writeln('Localidad: ');Readln(p.localidad);
    end;
end;

procedure maximos (cantAlumnos:Integer; escuela:str ;var max1,max2:Integer; var nom1,nom2:str);
begin
    if (cantAlumnos > max1) then begin
        max2:= max1;
        max1:= cantAlumnos;
        nom2:= nom1;
        nom1:= escuela;
    end
    else if (cantAlumnos > max2) then begin
        max2:= cantAlumnos;
        nom2:= escuela;
    end;
end;

function cumple (num:Integer):Boolean;
var
	pares,impares:integer;
begin
	pares:=0;impares:=0;
	while(num<>0)do begin
		if(num MOD 2)=0 then
			pares:=pares+1
		else
			impares:=impares+1;
		num:=num DIV 10;
	end;
	cumple:=(pares=impares);
end;

var
    p:proyecto;
    escuelaActual,localidadAct,nom1,nom2:str;
    cantEscuelasXlocalidad,TotalEscuelas,max1,max2,aluTotalesXescuela:Integer;
begin
    max1:=0;max2:=0;TotalEscuelas:=0;
    leoProyecto(p);

    while (p.cod <> -1) do begin
        localidadAct:= p.localidad;
        cantEscuelasXlocalidad:=0;

        while ((p.cod <> -1) and (localidadAct = p.localidad)) do begin
            cantEscuelasXlocalidad:= cantEscuelasXlocalidad + 1;
            TotalEscuelas:= TotalEscuelas + 1;
            escuelaActual:= p.escuela;
            aluTotalesXescuela:=0;

            if (localidadAct = 'Daireaux') and (cumple(p.cod)) then
                WriteLn(p.titulo);

            while ((p.cod <> -1) and (localidadAct = p.localidad) and (escuelaActual = p.escuela)) do begin
                aluTotalesXescuela:= aluTotalesXescuela + p.cantAlumnos;
            
                leoProyecto(p);
            end;// 3er while
            maximos(aluTotalesXescuela,p.escuela,max1,max2,nom1,nom2);
        end;// 2do while
        WriteLn('Son ',cantEscuelasXlocalidad,' escuelas de la localidad de ',localidadAct);
    end;// 1er while
      

end.