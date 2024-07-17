program Ejercicio10;
type
    str = string[20];

    especie = record
        nombre:str;
        promVida:integer;
        tipo:str;
        clima:str;
        paises:str;
    end;



var
    e:especie;
    tipoActual:str;
begin
    for i:= 1 to 320 do begin
        while (e.paises <> 'zzz') do begin
            tipoActual:= e.tipo;

            while (e.paises <> 'zzz') and (tipoActual = e.tipo)do begin
            

        end;
    end;
end.