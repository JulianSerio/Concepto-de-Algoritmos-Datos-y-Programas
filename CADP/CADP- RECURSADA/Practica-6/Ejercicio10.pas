program Ejercicio10;

type    
    cliente = record//a
        DNI:integer;
        num:Integer;
    end;

    lista = ^nodo;
    nodo = record 
        elem:cliente;
        sig:lista;
    end;

procedure leoDNI (var DNI:Integer);
begin
    WriteLn('Ingrese DNI');
    ReadLn(DNI);
end;

procedure AGREGARALFINAL (var L:lista; c:cliente);
var
    aux:lista
begin
    
end;

//b
procedure RecibirCliente (var L:lista;DNI:Integer; var num:Integer);
var 
    c:cliente
    num:Integer;
begin
    num:= num + 1;
    c.DNI := DNI;
    c.num := num;
    cargoNodo(L,c);
end;

//c
procedure atenderCliente (var L:lista; var num,DNI:Integer)
var
    aux:lista;
begin
    aux:=L;
    DNI:= aux^.elem.DNI;
    num:= aux^.elem.num;
    l:=l^.sig;
    Dispose(aux);
end;

//d
procedure cargoClientes (L:lista; c:cliente);
var 
    DNI,num:Integer;
begin
    num:=0;
    leoDNI(DNI);
    while (c.DNI <> 0) do begin
        RecibirCliente(L,DNI,num);
        WriteLn('El numero de cliente con DNI: ',DNI, ' es: ',num);
        leoDNI(DNI);
    end;
end;

procedure simuloAtencion (L:lista);
var 
    DNI,num:Integer;
begin
   while (L <> nil) do begin
        atenderCliente(L,num,DNI);
        WriteLn('El numero de lciente a atender es: ',num);
    end;
end;


var
    L:lista;
    c:cliente;
begin
    L:=nil;
    cargoClientes(L,c);
    simuloAtencion(L);
end.