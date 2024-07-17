program Ejercicio4;
const 
    DIMF = 42;
type
    vector = array [1..DIMF] of real;
    str = string[20];

    paciente = record
        nombre:str;
        apellido:str;
        pesoRegPrimerDIA:vector;
        dimL:Integer; // cant semanas embarazo
    end;

    lista = ^nodo;
    nodo = record
        elem:paciente;
        sig:lista;
    end;

function semanaMax (v:vector; cantSemanas:Integer):Integer;
var
    i,iMAX:Integer;
    max,dif:Real;
begin
    max:=-1; 
    for i:= 2 to cantSemanas do begin //pq tenemos que comparar con la semana 1 
        dif:= v[i] - v[i-1];
        if (dif > max) then begin
            max:= dif;
            iMAX:= i;
        end;
    end;
    semanaMax:=iMAX;
end;

procedure recorroLista (L:lista);
begin
    while (L <> nil) do begin
        WriteLn(semanaMax(L^.elem.pesoRegPrimerDIA,L^.elem.dimL));
        WriteLn('El aumento total es: ',L^.elem.pesoRegPrimerDIA[L^.elem.dimL] - L^.elem.pesoRegPrimerDIA[1]); //b
        L:=L^.sig;
    end;
end;

var
    L:lista;
begin
    L:=Nil;
    cargaLista(L); //se dispone
    recorroLista(L);
end.