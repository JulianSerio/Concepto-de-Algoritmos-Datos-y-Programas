program Ejercicio4;
const
    DF = 1000;
type
    alumno = record
        nroAlumno:Integer;
        nombre:String;
        apellido:String;
        cantAsistencias:Integer;
    end;

    infoAlu = array [1..DF] of alumno;


procedure leoVector (var a:alumno; dL:Integer);
begin
    WriteLn('Ingrese numero de alumno');
    ReadLn(v[i].nroAlumno);
    WriteLn('Ingrese apellido del alumno');
    ReadLn(v[i].apellido);
    WriteLn('Ingrese nombre del alumno');
    ReadLn(v[i].nombre);
    WriteLn('Ingrese cantidad de asistencias a clase');
    ReadLn(v[i].cantAsistencias);
    dL:=dL + 1;
end;

procedure cargoVector (var v:infoAlu; var dL:Integer);
var
    i:Integer;
    aux:alumno
begin
    For i:= 1 to DF do begin
        leoVector(aux);
        v[i]:= aux;
    end;
end;

function buscarAlumno (v:infoAlu; dL:Integer ;nroAlumnoIngresado:Integer):Integer;   //a
var
    pos:Integer;
begin
    pos:=1;
    while (v[pos].nroAlumno < nroAlumnoIngresado) do begin                      //REVISAR 
        pos:=pos + 1;
    end;
    buscarAlumno:=pos;
end; 


procedure insertarAlumno (v:infoAlu; var dL:Integer; alu:alumno);
var
   i,num:Integer;
   nombreInsertar:String;
begin
    num:=0;
	if(dL < dF)then     //REVISAR
	begin
		for i:=dL downto num do
		begin
			v[i+1]:=v[i];
		end;
		v[num] := alu;
		dL:= dL+1;	
	end;
end;

procedure borrarAlumno (var v:infoAlu; var dL:Integer; pos:Integer);
var
    i:Integer;
begin
    if (pos >= 1) and (pos <=dL) then begin
        for i:=pos to (dL - 1) do
            v[i]:= v[i+1];
        dL:=dL - 1;
    end;
end;


procedure eliminarAlumno (var v:infoAlu; var dL,nroAlumnoEliminar:Integer);
begin
    borrarAlumno(v,dL,buscarAlumno(v,dL,nroAlumnoEliminar))
end;

procedure eliminarAluAsistencias (var v:infoAlu; var dL:Integer);
var
    i:Integer
begin
    i:=1;
    while (i < dL) do begin
        if (v[i].cantAsistencias = 0) then begin
            borrarAlumno(v,dL,i);
        end;
        i:=i + 1;
    end;
end;

var
    v:infoAlu;
    dL:Integer;
    nroAlumnoIngresado:Integer;
    alumnoIngresado:String;
    pos:Integer;
    nroAlumnoEliminar:Integer;
    alu:alumno;
begin
    dL:= 0;
    cargarVector(v,dL);
    WriteLn('Ingrese nro de alumno a buscar');
    ReadLn(nroAlumnoIngresado);
    writeLn(buscarAlumno(v,dL,nroAlumnoIngresado)); //a

    write('Escriba un nombre para insertar: ');
    readln(nombreInsertar);
    insertarAlumno(v,dL,alu); //b

    WriteLn('Ingrese posicion del alumno a eliminar');
    ReadLn(pos);
    borrarAlumno(v,dL,pos); //c 

    WriteLn('Ingrese nro de alumno a eleminar');
    ReadLn(nroAlumnoEliminar);
    eliminarAlumno(v,dL,nroAlumnoEliminar); //d


    eliminarAluAsistencias(v,dL); //e    
end.