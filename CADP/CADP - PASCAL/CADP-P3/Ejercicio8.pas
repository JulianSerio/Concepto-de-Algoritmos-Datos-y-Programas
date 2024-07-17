program Ejercicio8;

type
    persona = record
        dni:Integer;
        nombre:String;
        apellido:String;
        email:String;                 
    end;

    proyecto = record
        codigo:Integer;
        titulo:String;
        cantAlumnos:Integer;
        nombreEscuela:String;
        localidad:String;
        coordinador:persona;
    end;

procedure leer (var p:proyecto);
begin
    WriteLn('Ingrese codigo del proyecto');
    ReadLn(p.codigo);
    WriteLn('Ingrese localidad');
    ReadLn(p.localidad);
    WriteLn('Ingrese nombre de la escuela');
    ReadLn(p.nombreEscuela);
    WriteLn('Ingrese titulo del proyecto');
    ReadLn(p.titulo);
    WriteLn('Ingrese cantidad de alumnos en el proyecto');
    ReadLn(p.cantAlumnos);
    WriteLn('Ingrese docente a cargo de la coordinacion');
    ReadLn(p.coordinador.persona);
end;

var
    p:proyecto;
    locActual:String;
    escActual:String;
    proyActual:String;
    cantEscuelas:Integer;
    

begin
    leer(p);                                    //INFORMACION INGRESADA 
    while (p.codigo <> -1) do begin            //PRIMER WHILE 
        locActual:=p.localidad;

        while ((p.codigo <> -1) and (p.localidad= locActual)) do begin  //SEGUNDO WHILE
            escActual:= p.nombreEscuela; 

            while ((p.codigo <> -1 ) and (p.nombreEscuela = escActual) and (p.localidad = locActual)) do begin  //TERCER WHILE 
                leer(p);
            end;   // FIN 3ER WHILE
        end;    //FIN 2DO WHILE
        
        //INFORMAR CANT ESCUELAS DE LOCALIDAD X

    end;    //FIN 3ER WHILE 
end.