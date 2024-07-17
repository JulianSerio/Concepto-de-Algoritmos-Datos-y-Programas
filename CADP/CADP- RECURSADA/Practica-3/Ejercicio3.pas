program Ejercicio3;

type 
    str = String[20];

    escuela = record
        CUE:Integer;
        establecimiento:str;
        cantDocentes:Integer;
        cantAlumnos:Integer;
        localidad:str;
    end;

procedure leoDatos (var e:escuela);
begin
    with e do begin
        WriteLn('Ingrese CUE');ReadLn(CUE);
        WriteLn('Ingrese establecimiento');ReadLn(establecimiento);
        WriteLn('Ingrese cantidad de docentes');ReadLn(cantDocentes);
        WriteLn('Ingrese cantidad de alumnos');ReadLn(cantAlumnos);
        WriteLn('Ingrese localidad');ReadLn(localidad);
    end;
end;

procedure proceso (e:escuela ;var cantEscuelas,CUE1,CUE2:Integer; var min1,min2:Real; var nom1,nom2:str );
var
    prom:Real;
begin
    prom:= e.cantAlumnos / e.cantDocentes;
    if (e.localidad = 'La Plata') and (prom > 23.435) then
        cantEscuelas:= cantEscuelas + 1;
    if (prom < min1) then begin
        min2:=min1;
        min1:=prom;

        nom2:=nom1;
        nom1:=e.establecimiento;

        CUE2:=CUE1;
        CUE1:=e.CUE;
    end
    else if (prom > min2) then begin
        min2:= prom;
        nom2:= e.establecimiento;
        CUE2:=e.CUE;
    end;
end;
var
    e:escuela;
    cantEscuelas,CUE1,CUE2,i:Integer;
    min1,min2:Real;
    nom1,nom2:str;
begin
    min1:=9999;
    min2:=9999;
    cantEscuelas:=0;
    for i:= 1 to 2400 do begin
        leoDatos(e); 
        proceso(e,cantEscuelas,CUE1,CUE2,min1,min2,nom1,nom2);
    end;
end.