program ejercicio002; 

type
    str = string[20];

    lista = ^nodo;
    nodo = record
        elem:str;
        sig:lista;
    end; 


procedure cargoNodo (var L:lista; nombre:str);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:= nombre;
    aux^.sig:= L;
    L:= aux;
end;

procedure cargoLista (var L:lista);
var
    nombre:str;
begin
    WriteLn('Ingrese nombre');
    ReadLn(nombre);
    while (nombre <> 'ZZZ') do begin
        cargoNodo(L,nombre);
        WriteLn('Ingrese nombre');
        ReadLn(nombre);
    end;
end;

procedure eliminar (var L:lista; nombreEliminar: str; var eliminado:Boolean);
var
    act,ant:lista;
begin   
    eliminado:= False;
    act:= L;
    while (act <> nil) and (L^.elem <> nombreEliminar) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act <> nil) then begin
        eliminado:= True;
        if (act = L) then
            L:= act^.sig
        else
            ant^.sig := act^.sig;
        Dispose(act);
    end;
end;


var
    L:lista;
    eliminado:Boolean;
    nombreEliminar:str;
begin
    L:=Nil;
    cargoLista(L);
    WriteLn('Ingrese nombre');
    ReadLn(nombreEliminar);
    eliminar(L,nombreEliminar,eliminado);
    if (eliminado) then
        WriteLn('El nombre fue eliminado')
    else
        WriteLn('El nombre NO fue eliminado de la estructura');
end.