program Ejercicio7;
const
    max = 10;

type
    str = string[20];
    rango = 5..max;

    alumno = record
        numAlumno:Integer;
        apellido:str;
        nombre:str;
        correo:str;
        ingreso:Integer;
        egreso:Integer;
        materias:vMaterias;
    end;

    lista = ^nodo;
    nodo = record
        elem:alumno;
        sig:lista;
    end;

    vMaterias = array [rango] of Integer;

procedure leoAlumno (var a:alumno);
var
    n:Materias;
begin
    ReadLn(a.numAlumno);
    if (a.numAlumno <> -1) then begin
        ReadLn(a.apellido);
        ReadLn(a.nombre);
        ReadLn(a.correo);
        ReadLn(a.ingreso);
        ReadLn(a.egreso);
        ReadLn(a.materias);
        leoNotas(n);
        OrdenarVectorNotasxAlumno(n);
    end;
end;

procedure leoNotas (var n:Materias);
var
    i:rango;
begin
    for i:= 5 to max do begin
        WriteLn('Para la materia ',i, ' ingrese la nota');
        ReadLn(v[i]);
    end;
end;

Procedure OrdenarVectorNotasxAlumno (var vec : Materias);
var
  i,j,p,item : integer;
Begin
  for i := 1 to tope-1 do begin
    p := i;
    for j := i + 1 to tope do
      if (vec[j] < vec[p]) then
        p := j;
    item := vec[p];
    vec[p] := vec[i];
    vec[i] := item;
  end;
End;

function cumple (NUM:Integer):Boolean;
var
    dig,par,impar:Integer;
begin
    while (NUM <> 0) do begin
        if (par = 0) then begin
            dig:= NUM mod 10;
            if ((dig mod 2)  = 0) then
                par:= par + 1
            else 
                impar:= impar + 1;
            NUM:= NUM div 10;
        end;
    end;
    if (par = 0) then
        cumple:= True
    else 
        cumple:=False;
end;

procedure minimos (apellidoActual,nombreActual,correoActual:str;var min1,min2:integer; anios:integer; var nombre1,nombre2,apellido1,apellido2,correo1,correo2:str);
begin
    if (anios < min1) then begin
        min2:=min1;
        min1:=anios;

        apellido2:= apellido1;
        apellido1:= apellidoActual;

        nombre2:= nombre1;
        nombre1:= nombreActual;

        correo2:= correo1;
        correo1:= correoActual;
    end
    else if (anios < min2) then begin
            apellido2:= apellidoActual;
            nombre2:= nombreActual;
            correo2:= correoActual;           
        end;
end;

Procedure PromedioXAlumno (var prom : real; notas : Materias);
var
  i : rango;
Begin
  for i := 1 to max do 
    prom := prom + notas[i];
End;

procedure procesoLista (l:lista; v:Materias);
var
    cantAlumnos,anios,min1,min2,prom,i:Integer;
    apellido1,nombre1,correo1:str;
    apellido2,nombre2,correo2:str;
begin
    cantAlumnos:=0;
    min2:=9999;
    min1:=9999;
    totalNota:=0;
    while (L <> nil) do begin
        PromedioXAlumno(totalNota,v);
        prom:= prom / 24; //total de materias
        WriteLn('El promedio de este alumno es: ',prom); //a
        if (L^.elem.ingreso = 2012) and (cumple(L^.elem.numAlumno)) then
            cantAlumnos:= cantAlumnos + 1;
        anios:= L^.elem.egreso - L^.elem.ingreso;
        minimos(L^.elem.apellido,L^.elem.nombre,L^.elem.correo,min1,min2,anios,nombre1,nombre2,apellido1,apellido2,correo1,correo2);
        L:=L^.sig;
    end;    
    WriteLn('Datos del alumno que re recibio mas rapido: ',nombre1,' ', apellido1, ' ', correo1); //c
    WriteLn('Datos del segundo alumno que re recibio mas rapido: ',nombre2,' ', apellido2, ' ', correo2);
    WriteLn('La cantidad de alumnos ingresantes 2012 cuyo numero esta compuesto por impares: ',cantAlumnos ); //b
end;

Procedure EliminarElementoDeLaLista (var L : Lista; nuevoNum : integer; var ok : boolean);
var
  act,ant : Lista;
Begin
  ok := false;
  act := L;
  while (act <> nil) and (act^.dato.numAlumno <> nuevoNum) do begin
    ant := act;
    act := act^.sig;
  end;
  if (act <> nil) then begin
    if (act = L) then
      L := L^.sig
    else
      ant^.sig := act^.sig;
    dispose(act);
    ok := true;
  end;
End;

var
    L:lista;
    v:Materias;
    num:Integer;
    ok:Boolean;
begin
    L:=Nil;
    cargoLista(L);
    procesoLista(L,v);
    WriteLn('Ingrese numero de alumno para eliminar');
    ReadLn(num);
    EliminarElementoDeLaLista(L,num,ok);
    if (ok) then
        writeln(' se elimino el numero de alumno')
    else
        writeln('no se elimino el numero de alumno ya que no existe'); //3
END.