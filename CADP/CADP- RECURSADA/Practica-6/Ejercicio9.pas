program Ejercicio9;
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

//INCISO A
function estaOrdenada(L : lista):boolean;
var
aux : lista;
begin
	aux := L;
	while(L <> nil)and(L^.num >= aux^.num) do begin
		aux := L;
		L := L^.sig;
	end;
	estaOrdenada := (Pi = nil);
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

end.