program punteros;

procedure recibovalor (var l:lista; valor:integer);
var
    aux:lista; 
begin
    while (aux <> NIL) do begin
        aux^.num + valor;
        aux:=aux^.sig;
    end;
end;

var
begin
  

end.