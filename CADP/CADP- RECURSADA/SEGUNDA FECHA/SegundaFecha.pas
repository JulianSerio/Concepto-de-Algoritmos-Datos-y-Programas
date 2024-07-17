program SegundaFecha;
type
    rangoPartidos = 1..48;

    venta = record
        codPartido:rangoPartidos;
        codCliente:Integer;
        cantEntradas:Integer;
    end;

    lista = ^nodo; 
    nodo = record
        elem:venta;
        sig:lista;
    end;

    str = String[20];
    
    partido = record
        codigo:rangoPartidos;
        estadio:str;
        capacidadMaxEstadio:Integer;
        horaInicio:Integer;
    end;

    listaCod = ^nodoCod;
    nodoCod = record
        elem:rangoPartidos;
        sig:listaCod;
    end;
    
    vPartidos = array [rangoPartidos] of partido;
    
    vec_cont = array[rangoPartidos] of integer;

procedure inicializar(var v:vec_cont);
var
	i:integer;
begin
	for i:= 1 to 48 do 
  	v[i]:=0;
end;

procedure leoPartido (var p:partido);
begin
    WriteLn('Codigo: ');ReadLn(p.codigo);
    WriteLn('Estadio: ');ReadLn(p.estadio);
    WriteLn('Capacidad Maxima: ');ReadLn(p.capacidadMaxEstadio);
    WriteLn('Hora inicio: ');ReadLn(p.horaInicio);
end;

procedure cargoVector (var v:vPartidos; p:partido);
var
    i:Integer;
begin
    for i:= 1 to 48 do begin
        leoPartido(p);
        v[p.codigo]:=p;
    end;
end;

procedure cargoNodo (var L:listaCod; cod:Integer);
var
    aux:listaCod;
begin
    New(aux);
    aux^.elem:=cod;
    aux^.sig:=L;
    L:=aux;
end;

function cumple (cod:Integer):Boolean;
var
    dig:Integer;
begin
    dig:= cod mod 100;
    if (dig = 10) or (dig = 20) then
        cumple:=True
    else
        cumple:= False;
end;

procedure GenerarLista(Vc:vec_cont; V: vPartidos; var L2: listaCod);
var
  i: integer;
begin
  for i := 1 to 48 do
    if(Vc[i] = V[i].capacidadMaxEstadio) then
       cargoNodo(L2,i);
end;

procedure proceso (L:lista; v:vPartidos; var L2:listaCod; var cantVentas:Integer);
var
  Vc: vec_cont;
begin
    inicializar(Vc);
    cantVentas:=0;
    while (L <> nil) do begin 
        Vc[L^.elem.codPartido] := Vc[L^.elem.codPartido] + L^.elem.cantEntradas;
        if (L^.elem.cantEntradas > 5) and (cumple(L^.elem.codCliente)) then
            cantVentas:= cantVentas + 1;
        L:=L^.sig;
    end;
    GenerarLista(Vc,V,L2);
end;

var 
    L:lista;
    L2:listaCod;
    p:partido;
    v:vPartidos;
    cantVentas:Integer;
   
begin
    L1:=nil;L2:=NIL;
    cargoLista(L); // se dispone
    cargoVector(v,p);
    
    proceso(L,v,L2,cantVentas);

    WriteLn('La cantidad de ventas de mas de 5 entradas cuyo codigo de cliente temrina en 10 o en 20 es: ',cantVentas);
end.