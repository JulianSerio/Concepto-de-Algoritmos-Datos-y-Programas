program Ejercicio16;
type
    str = string[20];

    corredor = record
        nombre:str;
        apellido:str;
        distanciaRecorrida:Integer;
        tiempo:Integer;
        pais:str;
        ciudadInicio:str;
        ciudadFinal:str;
    end;

    lista = ^nodo;
    nodo = record
        elem:corredor;
        sig:lista;
    end;

procedure leoCorredor (var c:corredor);
begin
    with c do begin
        WriteLn('Nombre: ');ReadLn(nombre);
        WriteLn('Apellido: ');ReadLn(apellido);
        WriteLn('Distancia recorrida: ');ReadLn(distanciaRecorrida);
        WriteLn('Tiempo en minutos: ');ReadLn(tiempo);
        WriteLn('Pais: ');ReadLn(pais);
        WriteLn('Ciudad Inicio: ');ReadLn(ciudadInicio);
        WriteLn('Ciudad Final: ');ReadLn(ciudadFinal);
    end;
end;

procedure cargoNodo (var L:lista; c:corredor);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=c;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoLista (L:lista);
var
    c:corredor;
begin
    leoCorredor(c);
    while (c.nombre <> 'zzz') do begin //no hay condicion de corte
        cargoNodo(L,c);
        leoCorredor(c);
    end;
end;

procedure procesoLista1 (L:lista; var corredoresTotal:Integer);
var
    tiempoTotal,distanciaTotal:Integer 
begin
    tiempoTotal:=0;distanciaTotal:=0;corredoresTotal:=0;
    while (L <> nil) do begin
        tiempoTotal:= tiempoTotal + L^.elem.pais;
        distanciaTotal:= distanciaTotal + L^.elem.distanciaRecorrida; 
        corredoresTotal:= corredoresTotal + 1; //a
        L:=L^.sig;
    end;
end;

procedure procesoLista2 (L:lista);
begin
    while (L <> nil) do begin
        

    end;
end;

var
    L:lista;
begin
    L:=nil;
end.