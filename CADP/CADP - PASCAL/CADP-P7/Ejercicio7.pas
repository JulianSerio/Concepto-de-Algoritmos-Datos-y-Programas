program Ejercicio7;

type 

    str = string [20];
    anios = 2000..2021;
    nota = 4..10;
    materias = 1..24;
    vNotas = array [materias] of nota;

    alumno = record
        numeroAlumno:Integer;
        nombre:str;
        apellido:str;
        correo:str;
        anioIngreso:anios;
        anioEgreso:anios;
        notas:vNotas;
    end;

    lista = ^nodo;
    nodo = record 
        elem:alumno;
        sig:lista;
    end;

procedure cargoNodo (var L:lista; a:alumno);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=a;
    aux^.sig:=L;
    L:=aux;
end;


procedure leoDatos (var a:alumno);
var
    i:integer;
begin
    with a do begin
        WriteLn('Ingrese codigo de alumno');
        ReadLn(numeroAlumno);
        WriteLn('Ingrese nombre del alumno');
        ReadLn(nombre);
        WriteLn('Ingrese apellido del alumno');
        ReadLn(nombre);
        WriteLn('Ingrese correo electronico del alumno');
        ReadLn(nombre);
        WriteLn('Ingrese anio de ingreso');
        ReadLn(anioIngreso);
        WriteLn('Ingrese anio de egreso');
        ReadLn(anioEgreso);
        for i:=1 to 24 do begin
            WriteLn('Ingrese nota de la materia que aprobo (no seas gil)');
            ReadLn(notas[i]);
        end;
    end;
end;

//2,a
function sumoNotas (v:vNotas):Integer;
var
    i:Integer;
begin
    for i:=1 to 24 do begin
        sumoNotas:= sumoNotas + v[i];
    end;
end;

function promedio (v:vNotas):Real;
begin
    promedio:= sumoNotas(v) / 24; 
end;

procedure informoProm (v:vNotas);
begin
    WriteLn('El promedio de todas las notas es', promedio(v));
end;

//2,b

procedure impares (L:lista; var cantAlumnos:Integer);
var
    dig,impar,par: integer;
    codigo:Integer;
begin
    cantAlumnos:=0;
    impar:=0;par:=0;
    codigo:= L^.elem.numeroAlumno;
    while (L <> nil) do begin
        if (L^.elem.anioIngreso = 2012) and (par = 0) then begin
            while (codigo <> 0) do begin
                dig:= codigo mod 10;
                    if((dig mod 2)= 0) then
                        par:= par + 1
                    else
                        impar:= impar + 1;
                codigo:= codigo DIV 10;
            end;
            L:=L^.sig
        end
        else 
            WriteLn('El numero posee digitos pares');
    end;
end;

//2,c
procedure masRapido (L:lista);
var
    apellido1,apellido2,
    nombre1,nombre2,
    correo1,correo2:str;
    min1,min2,anioEgresado:Integer;
begin
    apellido1:='';apellido2:='';nombre1:='';nombre2:='';correo1:='';correo2:='';
    anioEgresado:= (L^.elem.anioEgreso - L^.elem.anioIngreso);
    min1:=9999; 
    min2:=9999;
    while (L <> nil) do begin
        if (anioEgresado < min1) then begin
            min2:=min1;
            min1:=anioEgresado;

            apellido2:=apellido1;
            apellido1:=L^.elem.apellido;

            nombre2:=nombre1;
            nombre1:=L^.elem.nombre;

            correo2:=correo1;
            correo1:=L^.elem.correo;
        end
        else 
        if (anioEgresado < min2) then begin
            min2:=anioEgresado;
            apellido2:=L^.elem.apellido;
            nombre2:=L^.elem.nombre;
        end;
        L:=L^.sig;
    end;

    WriteLn('Los nombres, apellidos y correos de los alumnos que mas rapido terminaron la carrera son: ',nombre1, ' ', apellido1, ' ', correo1, ' y ',nombre2, ' ', apellido2, ' ', correo2);
end;


//3 
procedure eliminar (var L:lista; numeroAlumno:Integer);
var 
    act,ant:lista;
begin
    act:=L;
    while (act <> nil) and (act^.elem.numeroAlumno <> numeroAlumno) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act <> nil) then begin
        if (act = nil) then 
            L:=L^.sig
        else
            ant^.sig:= act^.sig;
        Dispose(act);
    end;
end;

var
    L:lista;
    a:alumno;
    cantAlumnos:Integer;
    numeroAlumno:Integer;
begin
    L:=nil;
    leoDatos(a);
    while (a.numeroAlumno <> -1) do begin
        cargoNodo(L,a);
        leoDatos(a);
    end;
    informoProm(L^.elem.notas);
    impares(L,cantAlumnos);
    masRapido(L);

    WriteLn('Ingrese numero de alumno a eliminar');
    ReadLn(numeroAlumno);
    eliminar(L,numeroAlumno);
end.