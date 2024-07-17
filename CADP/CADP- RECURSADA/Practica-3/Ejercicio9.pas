program Ejercicio9;

type 
    str = String[20];

    candidato = record  
        localidad:str;
        apellido:str;
        cantVotos:Integer;
        cantVotosxLocalidad:Integer;
    end;

procedure leoCandidato (var c:candidato);
begin
    with c do begin
        WriteLn('Localidad: ');ReadLn(localidad);
        if (localidad <> 'Zarate') then begin
            WriteLn('Apellido: ');ReadLn(apellido);
            WriteLn('Cantidad de votos: ');ReadLn(cantVotos);
            WriteLn('Cantidad de votos en esta localidad: ');ReadLn(cantVotosxLocalidad);
        end;
    end;
end;

procedure maximos (cantVotos:integer; apellido:str; var max:Integer; var Ape1:str)
begin
    if (cantVotos > max) then begin
        max:=cantVotos;
        Ape1:=apellido;
    end;
end;


var
    c:candidato;
    Int1,Int2:str;
    cantVotos,cantIntendentes,max:Integer;
    prom:real;
begin
    max:=0; cantIntendentes:=0; cantVotos:=0;
    repeat
        leoCandidato(c);
        maximos(c.cantVotos,c.apellido,max,Int1);
        cantVotos:= cantVotos + c.cantVotos;
        cantIntendentes:= cantIntendentes + 1;
    until c.localidad = 'Zarate';

    prom := (cantVotos * cantIntendentes) / 100;
    WriteLn('El intendente que obtuvo la mayor cantidad de votos en la elección es: ',Ape1);
    WriteLn('El intendente con mejor promedio es: ', )
end.