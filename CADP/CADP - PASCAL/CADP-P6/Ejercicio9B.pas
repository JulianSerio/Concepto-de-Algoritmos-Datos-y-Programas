program Ejercicio9B;

type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
end;

procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;

procedure eliminar(var L:lista; v:integer; var existe:Boolean);
Var
 actual,ant:lista;
Begin
    actual:=L; 
    while ((actual <> nil) and (actual^.num <> v)) do begin
        ant:=actual; 
        actual:= actual^.sig;
    end;
    if (actual <> nil) then begin
        existe:=True;
        if (actual = L) then
            L:= L^.sig
        else
            ant^.sig:= actual^.sig;
        dispose (actual);
    end;
End;

procedure datoaEliminar (var L:lista);
var 
    valor:Integer;
    existe:Boolean;
begin
    existe:=False;
    Write('Ingrese un valor que quiera eliminar de la lista '); ReadLn(valor);
    eliminar(L,valor,existe);
    if (existe) then WriteLn('Se elimino.')
    else WriteLn('LE PONGO UN 1');
end;



procedure imprimir (L:lista);
begin
    while (L <> NIL) do begin
        WriteLn(L^.num);
        L:=L^.sig;
    end;
end;

var
    pri:lista;
    valor:Integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri,valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    datoaEliminar(pri);
    imprimir(pri);

end.