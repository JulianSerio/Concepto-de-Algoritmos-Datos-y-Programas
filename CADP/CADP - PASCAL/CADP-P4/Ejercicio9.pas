program ejercicio9;
const
    dimF=400;
type
    InfoAlumnos=record
        NroInscripcion:integer;
        DNI:integer;
        Apellido:string;
        Nombre:string;
        AnoDeNacimiento:integer;
    end;

    CantAlumnos=Array [1 .. dimF] of InfoAlumnos;

procedure CargoVector (var v:CantAlumnos; var dL: Integer);
var
    i:integer;
begin
    i:=0;
    WriteLn ('Ingrese el DNI del alumno: ');
    ReadLn(v[i].DNI);
    while (v[i].DNI <> -1) or (dL <= dimF) do begin
        i:=i+1;
        WriteLn ('Ingrese el Numero de inscripcion del alumno');
        ReadLn(v[i].NroInscripcion);
        WriteLn ('Ingrese el apellido del alumno');
        ReadLn(v[i].Apellido);
        WriteLn ('Ingrese el nombre del alumno');
        ReadLn(v[i].Nombre);
        WriteLn('Ingrese el anio de nacimiento del alumno');
        ReadLn(v[i].AnoDeNacimiento);
        dL:= dL + 1;
    end;
end;


function DNIhechosporpares(v:CantAlumnos;dL:Integer):Real;
var
    i,numero,digito,CantDigitos,Cantpares,HechoTodoXPares:Integer;
begin
    i:=0;
    Cantpares:=0;
    CantDigitos:=0;
    HechoTodoXPares:=0;

    while (v[i].DNI <> -1) or (dL <= dimF) do begin
        numero:=v[i].DNI;
        while (numero<>0) do begin
            digito:=numero mod 10;
            if ((digito mod 2)=0) then begin
                Cantpares:=Cantpares+1;
            end;
            CantDigitos:=CantDigitos+1;
            numero:=numero div 10;
        end;
        if (Cantpares=CantDigitos) then begin
            HechoTodoXPares:=HechoTodoXPares+1;
        end;
    end;
    DNIhechosporpares:=((HechoTodoXPares*100)/dimF);
end;

procedure BuscoApeyNom(v:CantAlumnos;dL:Integer);
var
    i,EdadMayor1,EdadMayor2:integer;
    MuestroApellido1,MuestroApellido2,MuestroNombre1,MuestroNombre2:string;
begin
    i:=0;
    EdadMayor1:=2020;
    MuestroApellido1:='';
    MuestroNombre1:='';
    while (v[i].DNI <> -1) or (dL <= dimF) do begin
        if (v[i].AnoDeNacimiento<EdadMayor1) then begin
            EdadMayor2:=EdadMayor1;
            MuestroNombre2:=MuestroNombre1;
            MuestroApellido2:=MuestroApellido1;
            EdadMayor1:=v[i].AnoDeNacimiento;
            MuestroNombre1:=v[i].Nombre;
            MuestroApellido1:=v[i].Apellido;
        end
        else if (v[i].AnoDeNacimiento<EdadMayor2) then begin
            EdadMayor2:=v[i].AnoDeNacimiento;
            MuestroNombre2:=v[i].Nombre;
            MuestroApellido2:=v[i].Apellido;
        end;
    end;
    WriteLn('Los 2 alumnos de mayor edad son: ',MuestroNombre1,' ',MuestroApellido1);
    Write ('y ',MuestroNombre2,' ',MuestroApellido2);
end;

var
    v:CantAlumnos;
    dL:Integer;
begin
    dL:=0;
    CargoVector(v,dL);
    WriteLn('El porcentaje de DNI con todos numeros pares es del ',DNIhechosporpares(v,dL):0:2);
    BuscoApeyNom(v,dL);
end.