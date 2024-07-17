program Ejercicio13;
const
    dimF = 3600;
type 
    str = string[20];
    rangoRol = 1..4;

    usuario = record    
        email:str;
        rol:rangoRol;
        revista:str;
        cantDiasUltAcc:Integer;
    end;

    vUsuario = array [1..dimF] of usuario; // se dispone
    vContador = array [1..4] of Integer;

    lista = ^nodo;
    nodo = record
        elem:usuario;
        sig:lista;
    end;

procedure insertarOrdenado (var L:lista; u:usuario);
var 
    ant,aux,act:lista;
begin
    New(aux);
    aux^.elem:=u;
    act:=L;
    ant:=L;
    while (act <> nil) and (act^.elem.cantDiasUltAcc < u.cantDiasUltAcc) do begin
        ant:=act;
        act:= act^.sig;
    end;
    if (ant = act) then 
        L:= aux
    else 
        ant^.sig:= aux;
    aux^.sig:=act;
end;

var
    L:lista;
begin
  
end.