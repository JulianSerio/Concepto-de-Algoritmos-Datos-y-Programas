program Ejercicio11;

procedure parOno (nroInscrip:Integer; var alumnos:Integer);
var
    promedio,
    numeroPar:Real;
begin
    numeroPar:=0;
    promedio:=0;

    if ((nroInscrip mod 2)=0) then
    begin 
        numeroPar:= numeroPar + 1;
    end
    else 
        WriteLn('El numero de inscripcion no era par!');

    promedio:= (alumnos / numeroPar);

    WriteLn('El porcetaje de alumnos con nro de incripcion par es: ', promedio:2:0);
end;

procedure AlumnosNumChicoYGrande (nombre,apellido:String;nroInscrip:Integer);
var
    min1,
    min2,
    max1,
    max2:Integer;
    
    ape1,
    ape2,
    nom1,
    nom2:String;
begin
    ape1:='';
    ape2:='';
    nom1:='';
    nom2:='';
    max1:=0;
    max2:=0;
    min1:=9999;
    min2:=9999;

    if (nroInscrip < min1) then                                 //ALUMNOS POR APELLIDO CON NUMERO MAS CHICO         
    begin
        min2:=min1;
        min1:=nroInscrip;

        ape2:=ape1;
        ape1:=apellido;
    end;
    if (nroInscrip < min2) then
    begin
        min2:=nroInscrip;
        ape2:=apellido;
    end;   

    if (nroInscrip > max1) then                                 //ALUMNOS POR NOMBRE CON NUMERO MAS GRANDE
    begin
        max2:=max1;
        max1:=nroInscrip;
        
        nom2:=nom1;
        nom1:=nombre;
    end;
    if (nroInscrip > max2) then
    begin
        max2:=nroInscrip;
        nom2:=nombre;
    end;

    WriteLn('Los nombres de los 2 alumnos con nro de inscripcion mas grande son: ',nom1,' y ', nom2);
    WriteLn('Los apellidos de los 2 alumnos con nro de inscripcion mas chico son: ',ape1,' y ', ape2);

end;

procedure leoyprocesodatos (nombre,apellido:String;nroInscrip:Integer;var alumnos:Integer);
begin
    WriteLn('Ingrese nombre del alumno');                   //LEO DATOS 
    ReadLn(nombre);
    WriteLn('Ingrese apellido del alumno');
    ReadLn(apellido);
    WriteLn('Ingrese numero de inscripcion');
    ReadLn(nroInscrip);

    alumnos:= alumnos + 1;                                  //CONTABILIZO NRO DE ALUMNOS   

    AlumnosNumChicoYGrande (nombre,apellido,nroInscrip);        //ALUMNOS CON NRO MAYOR Y MENOR

    parOno(nroInscrip,alumnos);                             //PORCENTAJE DE ALUMNOS CON NRO DE INSCRIPCION PAR
end;

var
    nombre,apellido:String;
    nroInscrip,alumnos:Integer;
begin
    nombre:='';
    apellido:='';
    nroInscrip:=0;
    alumnos:=0;
    repeat
        leoyprocesodatos(nombre,apellido,nroInscrip,alumnos);
    until nroInscrip = 1200;

end.