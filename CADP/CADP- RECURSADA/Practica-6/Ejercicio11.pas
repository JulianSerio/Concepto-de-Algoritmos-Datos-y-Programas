program Ejercicio11;
type
    str = string[20];
    egresado = record
        num:Integer;
        apellido:str;
        prom:Real;
    end;
    
    lista = ^nodo;
    nodo = record
        elem:egresado;
        sig:lista;
    end;

procedure leoEgresado (var e:egresado);
begin
    with e do begin
        WriteLn('Ingrese numero de alumno: ');ReadLn(num);
        if (num <> 0) then begin
            WriteLn('Ingrese apellido: ');ReadLn(apellido);
            WriteLn('Ingrese promedio: ');ReadLn(prom);
        end;
    end;
end;

procedure cargarOrdenado(var L:lista; e:egresado);
var
	nue,act,ant: lista;
begin
    new(nue);
    nue^.elem:= E;
    nue^.sig:= nil;
    act:= L;
    ant:= L;
    while(act<>nil)and(e.prom > act^.elem.prom)do begin
	    ant:=act;
	    act:=act^.sig;
    end;
    if(act=ant)then
	    L:= nue
    else
	    ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure cargoLista (var L:lista);
var
    e:egresado;
begin
    leoEgresado(e);
    while (e.num <> 0) do begin
        cargarOrdenado(L,e);
        leoEgresado(e);
    end;
end;

procedure imrpimoMejores (L:lista; var v:vMejorProm);
var 
    cant:Integer;
    
begin
    cant:= 0;
    while (L <> nil) and (cant < 10) do begin
        WriteLn('El egresado ',L^.elem.apellido, ' con numero ',L^.elem.num, ' obtuvo el promedio de ',L^.elem.prom);
        cant:= cant + 1;
        L:= L^.sig;
    end;
end;

var
    L:lista;
begin
    L:=Nil;
    cargoLista(L);
    imrpimoMejores(L,v);
end.