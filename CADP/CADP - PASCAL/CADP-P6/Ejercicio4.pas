program Ejercicio4;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
end;

function maximo (L:lista):Integer;
var
    max:Integer;
begin
    max:=-1;
    while (L <> Nil) do begin
        if (L^.num >= max) then begin
            max:= L^.num;
        end;
    end;
    maximo:= max;
end;

function minimo (L:lista):Integer;
var
    min:Integer;
begin
    min:=9999;
    while (L <> Nil) do begin
        if (L^.num <= min) then begin
            min:= L^.num;
        end;
    end;
    minimo:=min;
end;

function multiplos (L:lista; M:Integer):Integer;
var
    cantMultiplos:Integer;
begin
    cantMultiplos:=0;
    while (L <> NIL) do begin
        if ((L^.num mod M) = 0) then
            cantMultiplos:= cantMultiplos + 1;
        L:=L^.sig;
    end;
    multiplos:=cantMultiplos;
  
end;

procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;                //10 21 13 48 0

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

    WriteLn('El elemento maximo es: ',maximo(pri));
    WriteLn('El elemento minimo es: ',minimo(pri));
    
end.