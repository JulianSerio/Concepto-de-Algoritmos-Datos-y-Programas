program Ejercicio3;

type 
    escuelas = record
        cue:Integer;
        nombreEstablecimiento:String;
        Localidad:String;
        cantDocentes:Integer;
        cantAlumnos:Integer;
end;

procedure leer (var e:escuelas);
begin
    WriteLn('Ingrese Codigo unico de establecimiento');
    ReadLn(e.cue);
    WriteLn('Ingrese nombre del establecimiento');
    ReadLn(e.nombreEstablecimiento);
    WriteLn('Ingrese localidad');
    ReadLn(e.Localidad);
    WriteLn('Ingrese cantidad de docentes');
    ReadLn(e.cantDocentes);
    WriteLn('Ingrese cantidad de alumnos');
    ReadLn(e.cantAlumnos);
end;


procedure PrimeraParte (var e:escuelas; var cantEscuelaDA:Integer);
begin
    if ((e.cantDocentes >= 1) and (e.cantAlumnos >= 23.435)) then begin
        if (e.Localidad = 'La Plata') then begin
            cantEscuelaDA:= cantEscuelaDA + 1;
        end; 
    end;
end;



procedure SegundaParte (e:escuelas; var codmax1,codmax2:Real; var nombre1,nombre2:String);
var 
    cociente:Real;
begin
    cociente:= (e.cantDocentes / e.cantAlumnos);

    if (cociente > codmax1) then begin
        codmax2:=codmax1;
        codmax1:=cociente;

        nombre2:=nombre1;
        nombre1:=e.nombreEstablecimiento;
    end
    else if (cociente > codmax2) then begin
        codmax2:=cociente;
        nombre2:=e.nombreEstablecimiento;
    end;
end;

var
    codmax1,codmax2:Real;

    nombre1,nombre2:String;

    cantEscuelaDA,i:Integer;

    e:escuelas;
begin
    codmax1:=0;
    codmax2:=0;
    cantEscuelaDA:=0;
    nombre1:='';
    nombre2:='';
    for i:=1 to 3 do begin
        leer(e);
        PrimeraParte(e,cantEscuelaDA);
        SegundaParte(e,codmax1,codmax2,nombre1,nombre2);
    end;
    WriteLn('La cantidad de escuelas de La Plata con una relación superior a la sugerida por UNESCO es: ',cantEscuelaDA);
    WriteLn('El codigo y el nombre de los establecimientos con mejor relacion entre alumnos y docentes son:',nombre1,' con un codigo de ',codmax1, ' y ',nombre2, 'con un codigo de ',nombre2);
end.