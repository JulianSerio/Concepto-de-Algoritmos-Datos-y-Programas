program Ejercicio8;
const
    dimF = 400;

type    
    str = string[20];

    alumno = record
        nroInscrip:Integer;
        DNI:Integer;
        apellido:str;
        nombre:str;
        anioNacimiento:Integer;
    end;

    vAlumno = array [1..400] of alumno;

procedure leoInfo (var a:alumno);
begin
    with a do begin
        Write('Nro inscripcion: ');Read(nroInscrip);
        Write('DNI: ');Read(DNI);
        Write('Apellido: ');Read(apellido);
        Write('Nombre: ');Read(nombre);
        Write('Anio de nacimiento: ');Read(anioNacimiento);
    end;
end; 


procedure cargoVector (var v:vAlumno);
var
    i:Integer;
begin
    for i:= 1 to dimF do begin
        leoInfo(v[i]);
    end;
end;

function esTodoPar (num:Integer):Boolean;
var
    dig,cantDig,pares:Integer;
begin
    pares:=0;
    cantDig:=0;
    while (num <> 0) do begin
        dig:= dig mod 10;
        cantDig:= cantDig + 1;
        num:= num div 10;
        if ((dig mod 2)=0) then
            pares:= pares + 1;
    end;
    esTodoPar:= (pares = cantDig);
end;

procedure apeynom (apellido,nombre:str; edad:integer; var ape1,ape2,nom1,nom2:str; var max1,max2:Integer);
begin
    if (edad > max1) then begin
        max2:= max1;
        max1:= edad;

        ape2:= ape1;
        ape1:= apellido;

        nom2:= nom1;
        nom1:= nombre;
    end
    else 
    if (edad  > max2) then begin
        max2:= edad;
        ape2:= apellido;
        nom2:= nombre;
    end;
end;


procedure recorroVector (v:vAlumno; var max1,max2:Integer; var nom1,nom2,ape1,ape2:str; var porcentaje: Real);
var
    i,edad,cantPar:Integer;
begin
    max1:=0;
    max2:=0;
    cantPar:=0;
    for i:= 1 to dimF do begin
        edad:= 2021 - v[i].anioNacimiento;
        if (esTodoPar(v[i].DNI)) then begin
            cantPar:= cantPar + 1;
        end;
        apeynom(v[i].apellido,v[i].nombre,edad,ape1,ape2,nom1,nom2,max1,max2);
    end;
    porcentaje:= (cantPar * 100) / dimF;
end;

var
    v:vAlumno;
    cantPar,max1,max2:Integer;
    ape1,ape2,nom1,nom2:str;
    porcentaje:Real;
begin
    cargoVector(v);
    recorroVector(v,max1,max2,nom1,nom2,ape1,ape2,porcentaje);
    WriteLn('El porcentaje de alumnos con DNI compuesto solo por dig pares es: ',porcentaje);
    WriteLn('El apellido del alumno mas grande es: ',nom1, ' ',ape1, ' y el segundo es: ', nom2, ' ', ape2);

end.