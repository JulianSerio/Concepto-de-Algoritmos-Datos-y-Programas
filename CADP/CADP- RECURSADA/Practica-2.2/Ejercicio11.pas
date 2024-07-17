program Ejercicio11;

procedure leoAlumnos (var nroInscrip:Integer; var apellido,nombre:string);
begin
    WriteLn('Ingrese Nro de inscripcion');ReadLn(nroInscrip);
    WriteLn('Ingrese apellido');ReadLn(apellido);
    WriteLn('Ingrese nombre');ReadLn(nombre);
end;

procedure nroGrandeNom (nroInscrip:Integer; nombre:String; var nom1,nom2:String; var max1,max2:Integer); //nombres
begin
    if (nroInscrip > max1) then begin
        max2:=max1;
        max1:=nroInscrip;

        nom2:=nom1;
        nom1:=nombre;
    end
    else if (nroInscrip > max2) then begin
        max2:= nroInscrip;
        nom2:= nombre;
    end;
end;

procedure nroChicoApe (nroInscrip:Integer; apellido:String; var ape1,ape2:String; var min1,min2:Integer); //apellido
begin
    if (nroInscrip < min1) then begin
        min2:=min1;
        min1:=nroInscrip;

        ape2:=ape1;
        ape1:=apellido;
    end
    else if (nroInscrip < min2) then begin
        min2:= nroInscrip;
        ape2:= apellido;
    end;
end;

var
    nroInscrip,min1,min2,max1,max2,par,leidos:Integer;
    apellido,nombre,ape1,ape2,nom1,nom2:String;
    porcentaje:Real;

begin
    min1:=9999;
    min2:=9999;
    max1:=0;
    max2:=0;
    par:=0;
    leidos:=0;
    porcentaje:=0;
    repeat
        leidos:= leidos + 1;
        leoAlumnos(nroInscrip,apellido,nombre);
        nroGrandeNom(nroInscrip,nombre,nom1,nom2,max1,max2);
        nroChicoApe(nroInscrip,apellido,ape1,ape2,min1,min2);
        if ((nroInscrip mod 2)=0) then
            par:= par + 1;
    until nroInscrip = 1200;
    porcentaje:= (par / leidos) * 100;
    WriteLn('Apellido de los dos alumnos con nro de inscripción más chico: ', ape1, ' y ', ape2);
end.