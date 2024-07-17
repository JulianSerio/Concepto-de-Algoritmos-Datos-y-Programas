program Ejercicio15;

type    
    str = string[20];

    alumno = record
        DNI:integer;
        apellido:str;
        nombre:str;
        nota:real;
    end;

    lista = ^nodo;
    nodo = record
        elem:alumno;
        sig:lista;
    end;

procedure agregarAdelante (var L:lista; a:alumno);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=a;
    aux^.sig:=L;
    L:=aux;
end;

procedure imprimoTurno (L:lista);
begin
    while (L <> nil) do begin
        WriteLn(L^.elem.apellido ,' ', L^.elem.nombre);
    end;
end;

procedure procesoLista (L:lista; var T1,T2,T3,T4,T5:lista);
var
    a:alumno;
begin       //CONTAR ELEMENTOS AGREGADOS POR LISTA
    while (l <> NIL) do begin
        if (L^.elem.nota <= 8) then begin
            agregarAdelante(T1,a);
            agregarAdelante(T4,a);
        end;
        if (L^.elem.nota >= 5) and (L^.elem.nota <= 8) then begin
            agregarAdelante(T2,a);
            agregarAdelante(T3,a);
        end;
        if (L^.elem.nota < 5) then
            WriteLn('El alumno no alcanzo la nota minima :(');
        L:=L^.sig; 
    end;
end;

var
    L:lista;
    T1,T2,T3,T4,T5:lista;
begin
    T1:=nil; T2:=Nil; T3:=Nil; T4:=Nil; T5:=Nil;
    L:=Nil;
    cargoLista(L); //se dispone
    procesoLista(L,T1,T2,T3,T4,T5);

    WriteLn('Imprimo Turno 1');
    imprimoTurno(T1);

     WriteLn('Imprimo Turno 2');
    imprimoTurno(T2);

     WriteLn('Imprimo Turno 3');
    imprimoTurno(T3);

     WriteLn('Imprimo Turno 4');
    imprimoTurno(T4);

     WriteLn('Imprimo Turno 5');
    imprimoTurno(T5);

end.