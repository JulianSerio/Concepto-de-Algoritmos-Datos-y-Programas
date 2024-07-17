program Ejercicio9;
type
    str = string[20];
    rangoGenero = 1..8;

    pelicula = record
        codigo:Integer;
        titulo:str;
        genero:rangoGenero;
        puntajeProm:Real
    end;
    
    listaPelis = ^nodoPelis;
    nodoPelis = record
        elem:pelicula;
        sig:listaPelis;
    end;  //se dispone;

    critica = record
        DNIcritico:Integer;
        apellidoYnombre:str;
        codPeli:Integer;
        puntajeProm:real;
    end;

    listaCritico = ^nodoCritico;
    nodoCritico = record
        elem:critica;
        sig:listaCritico;
    end;

procedure leoCritica (var c:critica);
begin
    with c do begin
        WriteLn('Codigo Pelicula: ');ReadLn(codPeli);
        if (codPeli <> -1) then begin
            WriteLn('DNI critico: ');ReadLn(DNIcritico);
            WriteLn('Apellido y nombre: ');ReadLn(apellidoYnombre);
            WriteLn('Puntaje otorgado: ');ReadLn(puntajeProm);
        end;
    end;
end;

procedure cargoNodo (var L:listaCritico; c:critica);
var
    aux:listaCritico;
begin
    New(aux);
    aux^.elem:=c;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoListaCriticas (var L:listaCritico);
var
    c:critica;
begin
    leoCritica(c);
    while (c.codPeli <> -1) do begin
        cargoNodo(L,c);
        leoCritica(c);
    end;
end;


var

begin
  
end.