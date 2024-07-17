program Ejercicio14;
type 
    dias = 1..31;

    prestamo = record
        nroPrestamo:Integer;
        ISBN:Integer;
        nroSocio:Integer;
        diaPrestamo:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:prestamo;
        sig:lista;
    end;

    vContador = array [1..31] of integer;

procedure leoPrestamo (var p:prestamo);
begin
    ReadLn(p.ISBN);
    if (p.ISBN <> -1) then begin
        ReadLn(p.nroPrestamo);
        ReadLn(p.nroSocio);
        ReadLn(p.diaPrestamo);
    end;
end;

procedure cargoNodo (var L:lista; p:prestamo);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=p;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoLista (L:lista);
var
    p:prestamo;
begin
    leoPrestamo(p);
    while (p.ISBN <> -1) do begin
        cargoNodo(L,p);
        leoPrestamo(p);
    end;
end;

var
    L:lista;

begin
    cargoLista(L);

  
end.