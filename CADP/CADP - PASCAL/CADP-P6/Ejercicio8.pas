program Ejercicio8;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
end;

//procedure armarNodo(var L: lista; v: integer);
//var
//    aux : lista;
//begin
//    new(aux);
//    aux^.num := v;
//    aux^.sig := L;
//    L := aux;
//end;

procedure insertarOrdenado (var L:lista; v:Integer);
var
    nuevo,actual:lista; //Punteros auxiliares para el recorrido
begin
    New(nuevo);
    nuevo^.num:=v;
    nuevo^.sig:=Nil;
    if (L<>Nil) then begin
        actual:=L;
        While (actual^.sig<>Nil) do begin
            actual:=actual^.sig;
        end;
        actual^.sig:=nuevo;
    end
    else 
        L:=nuevo;
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
        insertarOrdenado(pri,valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    imprimir(pri);
end.