program Ejercicio4;
const
    dimF = 5;
type    
    RangoAlu = 1..dimF;
    str = String[20];

    alumno = record
        nroAlu:RangoAlu;
        apellido:str;
        nombre:str;
        cantAsistencias:Integer;
    end;
    
    vAlumnos = array [1..dimF] of alumno;

procedure leoAlumno (var a:alumno);
begin
    with a do begin
        WriteLn('Nro de Alumno: ');ReadLn(nroAlu);
        WriteLn('Apellido: ');ReadLn(apellido);
        WriteLn('Nombre: ');ReadLn(nombre);
        WriteLn('Cantidad de asistencias: ');ReadLn(cantAsistencias);
    end;
end;

procedure cargoVector (var v:vAlumnos; var dimL:Integer);
var
    a:alumno;
begin
    leoAlumno(a);
    while (dimL < dimF) do begin
        dimL:= dimL + 1;
        v[dimL]:= a;
        leoAlumno(a);
    end;
end;

//A
function returnPosicion(v:vAlumnos ; valor:Integer):integer; 
var 
    i:integer;
    encontre:boolean;
begin
    encontre:= False;
    i:= 0;
    while (not encontre) do begin
        i:= i + 1;
        if (v[i].nroAlu = valor) then begin
            returnPosicion:= i;
            encontre:= true
        end;
    end;

end;

//B
procedure insertar (var v:vAlumnos; var dimL:Integer; alumno:alumno);
begin
    if (dimL < dimF) then begin
        v[dimL + 1] := alumno; 
        dimL:= dimL + 1;
    end;
end;

//C
procedure eliminarAluPos (var v:vAlumnos; var dimL: Integer; pos:Integer);
var
    i: Integer;
begin
    for i:= pos to dimL do begin
        v[pos] := v[pos + 1];
    end;
    dimL:= dimL - 1;
end;

//D
procedure eliminoAlumno (var v:vAlumnos; var dimL:Integer; num:Integer);
var 
    encontre:Boolean;
    i,j:Integer;
begin
    i:=0;
    encontre:= False;
    while (not encontre) and (i <= dimL) do begin
        i:= i + 1;
        if (v[i].nroAlu = num) then
            encontre:= true
        else 
            i:= i+ 1;
    end;
    for j:= i to dimL do begin
        v[j]:= v[j + 1];
    end;
    dimL:= dimL - 1;
end;

//E 
procedure eliminoAluAsis (var v:vAlumnos; var dimL:Integer);
var 
    i,j:Integer;
begin
    for i:= 1 to dimL do begin
        if (v[i].cantAsistencias = 0) then begin
            for j:= i to dimL do begin
                v[j]:= v[j + 1];
            end;
            dimL:= dimL - 1;
        end;
    end;
end;
var
    a:alumno;
    v:vAlumnos;
    dimL,num,numAlu,pos:Integer;
begin
    dimL:= 0;
    cargoVector(v,dimL);

    Write('Nro Alumno: ');Read(num);
    WriteLn('Su pos en el vector es', returnPosicion(v,num)); //A

    leoAlumno(a);
    insertar(v,dimL,a); //B

    Write('Pos: ');Read(pos);
    eliminarAluPos(v,dimL,pos); //C

    Write('Numero de Alumno: ');Read(numAlu);
    eliminoAlumno(v,dimL,numAlu); //D

    eliminoAluAsis(v,dimL);
    
end.