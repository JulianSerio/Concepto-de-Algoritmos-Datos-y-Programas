program Ejercicio13;

type    
    str = string[20];
    rangoAreas = 1..35;

    vAreas = array [rangoAreas] of str;

    libro = record
        titulo:str;
        nombreEditorial:str;
        cantPaginas:Integer;
        anioEdicion:Integer;
        cantVentas:Integer;
        codArea:rangoAreas;
    end;

    editorialPL = record
        nombre:str;
        anioEdicion:Integer;
        cantTotalVentas:integer;
        cantTotalEdiciones:integer;
        detalle:lista;
    end;

    elemento = record
        titulo:str;
        nombreArea:str;
        cantPagina250Ventas:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:elemento;
        sig:lista;
    end;

procedure leerLibro (var l:libro);
begin
    ReadLn(l.titulo);
    ReadLn(l.nombreEditorial);
    ReadLn(l.cantPaginas);
    ReadLn(l.anioEdicion);
    ReadLn(l.cantVentas);
    ReadLn(l.codArea);
end;

procedure procesarLibros (var e:editorialPL; v:vAreas );
var
    li:libro;
    elem:elemento;
begin
    e.nombre:= 'Planeta Libros';
    e.anioEdicion:= 3000;
    e.cantTotalVentas:= 0;
    e.cantTotalEdiciones:= 0;
    e.detalle:= Nil;
    repeat
        leerLibro(Li);
        if (Li.nombreEditorial = 'Planeta Libro') then begin
            e.cantTotalEdiciones:= e.cantTotalEdiciones + 1;
            e.cantTotalVentas:= e.cantTotalVentas + li.cantVentas;
            if (li.anioEdicion < e.anioEdicion) then
                e.anioEdicion:= li.anioEdicion;
            if (li.cantVentas > 250) then
                elem.titulo := li.titulo;
                elem.nombreArea:= v[li.codArea];
                elem.cantPagina250Ventas:= li.cantPaginas;
                agregarAdelante(e.detalle,elem);
            end;
    until (Li.titulo = 'Relato de un Naufrago');
end;

procedure imprimirLista (L:lista);
begin
    while (L <> nil) do begin
        WriteLn(L^.elem.titulo);
        L:=L^.sig;
    end;
end;

procedure imprimir (e:editorialPL);
begin
    WriteLn('Nombre editorial: ',e.nombre);
    imprimirLista(e.detalle);
end;


var
    libro:libro
    v:vAreas;
    e:editorialPL;
begin
    cargoTabla(v); //se dispone
    procesarLibros(e,v);
    imprimir(e);
end.