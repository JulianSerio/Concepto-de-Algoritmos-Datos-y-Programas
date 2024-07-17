program ADA;
type
   lista = ^nodo;
   nodo = record
      dato : integer;
      sig : lista;
   end;
var
    L , nodo1, nodo2 : lista;
       
begin
    new(L);  //creo un nodo
    L^.dato := 4;
    L^.sig := nodo1;
    
    new(nodo1);  //creo un segundo nodo
    nodo1^.dato := 5;
    nodo1^.sig := nodo2;
 
    new(nodo2);  //creo un tercer nodo
    nodo2^.dato := 6;
    nodo2^.sig := nil;

    while (L <> nil) do begin
        writeln(L^.dato);
        L := L^.sig;
    end;
end.