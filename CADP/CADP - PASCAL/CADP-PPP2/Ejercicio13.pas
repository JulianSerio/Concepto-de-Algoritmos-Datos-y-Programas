program Ejercicio13;
type    
    RangoAreas = 1..35;

    libro = record  
        titulo:string;
        editorial:String;
        cantPag:integer;
        anoEdicion:integer;
        ventas:integer;
        codArea:RangoAreas;
    end;

    lista = ^nodo;
    nodo = record
        elem:libro;
        sig:lista;
    end;

procedure leoLibro (var l:libro);
begin
    ReadLn(l.titulo);
    ReadLn(l.editorial);
    ReadLn(l.cantPag);
    ReadLn(l.anoEdicion);
    ReadLn(l.ventas);
    ReadLn(l.codArea);
end;

procedure cargoNodo (var L:lista; l:libro);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=l;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoLista (L:lista);
var
    x:libro;
begin
    repeat
        leoLibro(l);
        
        cargoNodo(L,x);
    until x.titulo = 'Relato de un naufrago'
end;


var

begin
  
end.