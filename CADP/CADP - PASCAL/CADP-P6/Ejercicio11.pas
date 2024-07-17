program Ejercicio11;
const
    DF = 10;
    CORTE = 0;
type 
    str = string [20];
    egresado = record
        numeroAlu:Integer;
        apellido:str;
        promedio:Real;
    end;

    mejorProm = array [1..DF] of egresado;  

    lista = ^nodo;
    nodo = record
        elem:egresado;
        sig:lista;
    end;

procedure leerInfo (e:egresado);
begin
    WriteLn('Ingrese numero de alumno');Readln(e.numeroAlu);
    While (e.numeroAlu <> 0) do begin
        WriteLn('Ingrese el apellido del alumno');ReadLn(e.apellido);
        WriteLn('Ingrese promedio del alumno');ReadLn(e.promedio);
        WriteLn('Ingrese numero de alumno');Readln(e.numeroAlu);
    end;
end;

procedure agregarAdelante (var L:lista; e:egresado);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=e;
    aux^.sig:=Nil;
    if (L = nil) then 
        L:=aux
    else begin
        aux^.sig:=L;
        L:=aux;
    end;
end;

procedure cargarEgresados (var L:lista);
var
    e:egresado;
begin
    leerInfo(e);
    while (e.numeroAlu <> 0) do begin
        agregarAdelante(L,e);
        leerInfo(e);
    end;
end;

procedure mejoresEgresados (L:lista; var e:mejorProm);
var
    i:Integer;
begin
    for i:=1 to DF do begin 
        e[i]:=L^.elem;
        L:=L^.sig;
    end;
end;

procedure imprimir (e:mejorProm);
var
    i:Integer;
begin
    WriteLn('Los 10 egresados que recibiran el premio Joaquin V. Gonzales son: ');
    for i:=1 to DF do 
        WriteLn('El egresado ', e[i].apellido, ' con numero ', e[i].numeroAlu);
end;

var
    pri:lista;
    v:mejorProm;
begin
    pri:=Nil;
    cargarEgresados(pri);
    mejoresEgresados(pri,v);
    imprimir(v);
    
  
end.