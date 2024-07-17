program Ejercicio9;
type
    str = string [20];
    rango = 1..8; 

    pelicula = record 
        codigoPelicula:Integer;
        tituloPelicula:str;
        codigoGenero:rango;
        puntajeProm:real;
    end;

    critico = record
        DNI:Integer;
        apellido:str;
        nombre:str;
        codigoPelicula:Integer;
        puntajOtorgado:real;
    end;

    lista = ^nodo;
    nodo = record
        elem:critico;
        sig:lista;
    end;

procedure cargonodo (var L:lista; c:critico);
var
    aux:lista;
begin
    New(aux);
    aux^.elem
  
end;
var
    L:lista;
    c:critico;
begin
  
end.