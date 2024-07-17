program Ejercicio4;
const
    DF = 42;
type 
    paciente = record
        nombre:string;
        apellido:string;
        pesoRegistrado:vPeso;
    end;

    vPeso = array [1..DF] of Real;

    lista = ^nodo;
    nodo = record
        elem:paciente;
        sig:lista;
    end;

procedure procesoPacientes (L:lista; v:vPeso);
var
    pesoTotal:Real;
begin
    pesoTotal:= 0;
    while (L <> nil) do begin
        pesoTotal:= pesoTotal + v[];
        maximos(v,max);
        WriteLn('El aumento total de esta embarazada fue de: ',pesoTotal);
        WriteLn('La semana de mayor aumento de peso para esta embarazada fue: ');
        L:=L^.sig;
    end;    
  
end;
var
    L:lista;
    v:vPeso;
begin
    L:= Nil;
    cargoLista(L);
    procesoPacientes(L,v);
end.