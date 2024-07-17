program Ejercicio9E;
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

procedure ordenadaDescendente(L:lista; var seg:lista; A,B:integer);
begin
	new(seg);
	while(L <> nil) and (L^.num > A) do begin
		if (L^.num < B)then begin
			armarNodo(seg,L^.num);
		end;
		L := L^.sig;
	end;
end;
var
    pri,seg:lista;
    valor,A,B:Integer;
    
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri,valor);
        WriteLn('Ingrese valor A');
        ReadLn(A);
        WriteLn('Ingrese valor B');
        ReadLn(B);
        writeln('Ingrese un numero');
        read(valor);
    end;
    ordenadaDescendente(pri,seg,A,B);
end.