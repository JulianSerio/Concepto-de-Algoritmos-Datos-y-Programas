program Ejercicio12;
type
    rangoSub = 1..4;
    vSubscripcion = array [rangoSub] of real;
    str = string[20];

    cliente = record    
        nombre:str;
        DNI:Integer;
        Edad:Integer;
        tipoSub:rangoSub;
    end;

    lista = ^nodo;
    nodo = record
        elem:cliente;
        sig:lista;
    end;

    mayores = record
        DNI:Integer;
        nombre:str;
    end;

    lista2 = ^nodo2;
    nodo2 = record
        elem:mayores;
        sig:lista2;
    end;

    vContador = array [rangoSub] of Integer; 
    
procedure leoCliente (var c:cliente);
begin
    with c do begin
        WriteLn('DNI: ');ReadLn(DNI);
        if (DNI <> 0) then begin
            WriteLn('Edad: ');ReadLn(Edad);
            WriteLn('Tipo Subscripcion contratada');ReadLn(tipoSub);
            WriteLn('Nombre: ');ReadLn(nombre);       
        end;
    end;
end;

procedure cargoNodo (var L:lista; c:cliente);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=c;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoLista (var L:lista);
var
    c:cliente;
begin
    leoCliente(c);
    while (c.DNI <> 0) do begin
        cargoNodo(L,c);
        leoCliente(c);
    end;
end;

procedure inicializoVC (var v:vContador);
var 
    i:Integer;

begin
    for i:= 1 to 4 do begin
        v[i]:=0;
    end;
end;

procedure insertarOrd (var L:lista2; m:mayores);
var
    act,ant,aux:lista2;
begin
    New(aux);
    aux^.elem:=m;
    act:=L;
    ant:=L;
    while (act <> nil) and (L^.elem.DNI < m.DNI) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (ant = act) then
        L:=aux
    else 
        ant^.sig:= aux;
    aux^.sig:= act;
end;

procedure maximos (v:vContador; var max1,max2,sub1,sub2:Integer);
var 
    i:Integer;
begin
    for i:= 1 to 4 do begin
        if (v[i] > max1) then begin
            max2:=max1;
            max1:=v[i];
            sub2:=sub1;
            sub1:=i;
        end
        else 
        if (v[i] > max2) then begin
        max2:=v[i];
        sub2:=i;
        end;
    end;
end;

procedure procesoLista (L:lista; v:vSubscripcion; var L2:lista2);
var
    gananciaTotal:Real;
    vC:vContador;
    m:mayores;
    max1,max2,sub1,sub2:Integer;
begin
    inicializoVC(vC);
    gananciaTotal:=0;max1:=0;max2:=0;
    while (L <> nil) do begin
        gananciaTotal:= gananciaTotal + v[L^.elem.tipoSub];
        vC[L^.elem.tipoSub] := vC[L^.elem.tipoSub] + 1;
        if (L^.elem.Edad > 40) and ((L^.elem.tipoSub = 1) or (L^.elem.tipoSub = 4)) then
            insertarOrd(L2,m);
        maximos(vC,max1,max2,sub1,sub2);
        L:=L^.sig;
    end;
    WriteLn('La gananacia total de Fortacos es: ',gananciaTotal);
    WriteLn('Las subscripciones con mas clientes son: ',sub1, ' y ',sub2);

end;
var
    L:lista;
    L2:lista2;
    v:vSubscripcion;
begin
    L:=Nil;
    L2:=Nil;
    inicializoVectorPrecios(v); // se dispone
    cargoLista(L);
    procesoLista(L,v,L2);
end.