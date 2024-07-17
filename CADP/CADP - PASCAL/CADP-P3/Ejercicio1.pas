program Ejercicio1;

type
    prom = 1..10;
    str20 = string[20];
    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : prom;
    end;

procedure PromedioMaximo (var a:alumno; var maxProm: Real; var nombreMax:str20);
begin
    if (a.promedio > maxProm) then begin
            maxProm:= a.promedio;
            nombreMax:= a.nombre;
        end;
end;


procedure leer (var alu : alumno);
begin
    write ('Ingrese el codigo del alumno');
    readLn(alu.codigo);
    if (alu.codigo <> 0) then begin
        write ('Ingrese el nombre del alumno'); 
        ReadLn(alu.nombre);
        write ('Ingrese el promedio del alumno'); 
        ReadLn(alu.promedio);
    end;
end;    


var
    cantAlu:Integer;
    a:alumno;
    maxProm:real;
    nombreMax:str20;
begin
    cantAlu:= cantAlu + 1;
    maxProm:=0;
    leer(a);
    while (a.codigo <> 0) do begin
        cantAlu:=cantAlu + 1 ;
        PromedioMaximo(a,maxProm,nombreMax);
        leer(a);
    end;
    WriteLn('El alumno con promedio mas alto es: ',nombreMax, ' y su promedio es de ',maxProm:2:2);
    WriteLn('La cantidad de alumnos leidos fue de: ',cantAlu);
end.