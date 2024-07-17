program Ejercicio3;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
end;

procedure imprimir (L:lista);
begin
    while (L <> NIL) do begin
        WriteLn(L^.num);
        L:=L^.sig;
    end;
end;

procedure recibovalor (var l:lista; valor:integer);
var
    aux:lista; 
begin
    while (aux <> NIL) do begin
        aux^.num:= aux^.num + valor;
        aux:=aux^.sig;
    end;
end;

procedure armarNodo (L:lista; v:Integer);
var
    nuevo,aux:lista;
begin
    new(nuevo);
    L^.num:= v; 
    L^.sig:= Nil;
    if (L = nil) then begin
        L:= nuevo
    end
    else begin
        aux:=L;
        while (aux^.sig <> NIL) do
            aux:=aux^.sig;
        aux^.sig := nuevo;
    end;
end;

var
    pri : lista;
    valor : integer;
    valor2:Integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    imprimir(pri);
    WriteLn('Ingrese valor');
    ReadLn(valor2);
    recibovalor(pri,valor);
end.