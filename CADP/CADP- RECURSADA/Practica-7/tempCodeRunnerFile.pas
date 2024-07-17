var
    ant,act:lista;
begin
    exito:= False;
    act:= L;
    while (act <> nil) and (act^.elem.DNI <> DNIeliminar) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act <> nil) then begin
        exito:= true;
        if (act = L) then L:= act^.sig
                    else ant^.sig:= act^.sig;
        Dispose(act);
    end;
end;