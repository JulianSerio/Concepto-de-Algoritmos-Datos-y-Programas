program Ejercicio12;
type 
    RangoSubs = 1..4; // se dispone de una tabla de precios 

    cliente = record
        nombre:String;
        DNI:Integer;
        edad:Integer;
        subscripcion:RangoSubs;
    end;
    
    lista = ^nodo;
    nodo = record
        elem:cliente;
        sig:lista;
    end;

    clienteNA = record
        nombre:String;
        DNI:Integer;
    end;

    listaNA = ^nodoNA;
    nodoNA = record
        elem:clienteNA;
        sig:listaNA;
    end;

    vContador = array [RangoSubs] of Integer;
    vSubscripciones = array [RangoSubs] of Integer;

///////////////////////////////////////////////

procedure leoCliente (var c:cliente);
begin
    ReadLn(c.DNI);
    if (c.DNI <> DNI) then begin
        ReadLn(c.nombre);
        ReadLn(c.edad);
        ReadLn(c.subscripcion);
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

procedure cargoLista (L:lista);
var
    c:cliente;
begin
    leoCliente(c);
    while (c.DNI <> 0) do begin
        cargoNodo(L,c);
        leoCliente(c);
    end;
end;

////////////////////////////////////////////

procedure procesoLista (L:lista; v:vSubscripciones; var L2:listaNA);
var
    GananciaTotal,sub1,sub2,max1,max2,i:Integer;
    vC:vContador;
    c:clienteNA;
begin
    for i:= 1 to 4 do 
        vC[i]:=0;

    max1:=-1;
    max2:=-1;
    GananciaTotal:=0;

    while (L<>nil) do begin
        GananciaTotal:= GananciaTotal + v[L^.elem.subscripcion]; //A
        vC[L^.elem.subscripcion] := vC[L^.elem.subscripcion] + v[l^.elem.subscripcion];    
        if (L^.elem.edad > 40) and (v[L^.elem.subscripcion] = 3) and (v[L^.elem.subscripcion] = 4) then
            insertarOrdenado(L2,c);
        maximos(vC,sub1,sub2,max1,max2);
        L:=L^.sig;
    end;
    WriteLn('La ganancia total de fortaco es: ',GananciaTotal);
    WriteLn('Las 2 subscripciones con mas clientes son: ',sub1,sub2);
end;

procedure maximos (v:vSubscripciones;var sub1,sub2,max1,max2:Integer);
var
    i:Integer
begin
    for i:=1 to 4 do begin
        if(v[i] > max1) then begin
            max2:=max1;
            max1:=v[i];

            sub2:=sub1;
            sub1:=i;
        end
        else if (v[i] > max2) then begin
            max2:=v[i];
            sub2:=i;
        end;
    end;
end;

procedure insertarOrdenado (var L:listaNA; c:clienteNA);
var 
    aux,act,ant:listaNA;
begin
    New(aux);
    aux^.elem:=c;
    act:=L;
    ant:=L;
    while (act <> nil) and (c.DNI < act.elem.DNI) do begin
        ant:=act;
        act:=act^.sig;
    end;
    
    if (ant = act) then 
        L:=aux
    else 
        ant^.sig:= aux;
    aux^.sig:=act; 
  
end;

var
    L1:lista;
    L2:listaNA;
    v:vSubscripciones;
begin
    cargoVectorDePrecios(v); // se dispone
    cargoLista(L1);
  
end.