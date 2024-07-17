program Ejercicio9A; //MANTENER COSAS SIMPLES 
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
end;

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


function estaOrdenado (L:lista):Boolean; //A
var
    anterior,actual:lista;
    ordenada:Boolean;
begin
    ordenada:=true;
    anterior:=L;
    actual:=L^.sig;
    if (actual <> Nil) then begin
        if (anterior^.num > actual^.num) then begin
            while ((actual <> Nil) and (ordenada)) do begin
                anterior:=actual;
                actual:=actual^.sig;
                if (actual <> nil) then begin
                    if (anterior < actual) then begin
                        ordenada:=False;
                    end;
                end;
            end;
        end
        else if (anterior^.num < actual^.num) then begin
            while ((actual <> nil) and (ordenada)) do begin
                anterior:=actual;
                actual:=actual^.sig;
                if (actual <> nil) then begin
                    if (anterior^.num > actual^.num) then begin
                        ordenada:=False;
                    end;
                end;
            end;
        end;  
    end; 
    estaOrdenado:=ordenada;   
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
    write(estaOrdenado(pri));
    imprimir(pri);

end.