program Ejercicio10;

    //A
type 
    cliente = record
        DNI:Integer;
        num:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:cliente;
        sig:lista;
    end;
    
procedure agregarAtras (var L:lista; c:cliente);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=c;
    aux^.sig:=nil;
    if (L = nil) then begin
        L:=aux;
    end
    else begin
        aux^.sig:=L;
        L:=aux;
    end;
end;

    //B
procedure recibirCliente (DNI:integer; var L,ult:lista);
var
    nroEspera:Integer;
begin
    nroEspera:=0;
    if (L = Nil) then begin
        nroEspera:=1
    end
    else
        nroEspera:=ult^.elem.num + 1;
    agregarAtras(L,cliente);

end;
    //C
procedure atenderCliente (var L:lista; var clienteAtender:cliente);
var
    Primercliente:lista;
begin
    Primercliente:= L;
    clienteAtender:= Primercliente^.elem;

    L:= Primercliente^.sig;
    Dispose(Primercliente);
end;

//D


var
    pri,ulti:lista;
    dni,num,i:Integer;
begin
   
end.