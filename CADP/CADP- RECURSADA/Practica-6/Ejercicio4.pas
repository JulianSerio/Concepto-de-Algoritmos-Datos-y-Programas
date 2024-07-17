program Ejercicio4; 

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

procedure maximos (L:lista; var max:Integer);
begin
    while (L <> nil) do begin
        if (L^.num > max) then 
            max:= L^.num;
        L:=L^.sig;
    end;
end;

procedure minimos (L:lista; var min:Integer);
begin
    while (L <> nil) do begin
        if (L^.num < min) then
            min:= L^.num;
        L:=L^.sig;
    end;
end;

function multiplos (L:lista ; valor:Integer):Integer;
var
    counter:Integer;
begin
    counter:=0;
    while (L <> nil) do begin
        if (L^.num mod valor = 0) then
          counter:= counter + 1;
        L:= L^.sig;
    end;
    multiplos:= counter;
end;

var
    pri : lista;
    valor,max,min,x: integer;
begin
    min:=9999;
    max:= 0;
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    maximos(pri,max); //a
    Write(max);

    minimos(pri,min); //b 
    Write(min);

    WriteLn('Ingrese valor');Read(x); //c
    multiplos(pri,x);
end.