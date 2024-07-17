program Ejercicio8;
type

lista = ^nodo;
nodo = record
    num : integer;
    sig : lista;
end;

procedure armarNodo(var L: lista; v: integer);
var
    ant,aux,act:lista;
begin
    new(aux);
    aux^.num := v;
    act:= L;
    ant:= L;
    while (act <> nil) and (act^.num < v) do begin // si queremos que se ordenen de forma descendente solamente 
        ant:= act;                                 // tenemos que invertir el signo a > 
        act:= act^.sig;
    end;
    if (ant = act) then
        L:= aux
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;

var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin   
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    while (pri <> nil) do begin
        WriteLn(pri^.num);
        pri:= pri^.sig;
    end;
end.
