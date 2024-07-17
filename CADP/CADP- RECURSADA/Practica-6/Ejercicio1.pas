program Ejercicio1; 
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

procedure imprimoLista (L:lista);
begin
    while (L <> nil) do begin
        WriteLn(L^.num);
        L:= L^.sig;
    end;
end;


procedure incrementarLista(L: lista; num: Integer);
begin
  while (L <> Nil) do begin
    L^.num:= L^.num + num;  // incrementa el valor obtenido
    L:= L^.sig;
  end;
end;

var
    pri : lista; 
    valor,x : integer;

begin    
    pri := nil; 
    writeln('Ingrese un numero');   
    read(valor); 
    while (valor <> 0) do begin
        armarNodo(pri, valor);  
        writeln('Ingrese un numero');
        read(valor); 
    end;
    imprimoLista(pri);
    Writeln('Ingrese un valor');Readln(x);
    incrementarLista(pri,x);
    imprimoLista(pri);
end.

//a) Lee valores ingresados por teclado
//b) imprime 48, 13, 21, 10
//c) imprimir(pri)
//d) incrementoLista(pri,x)