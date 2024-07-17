program Ejercicio6;

type 
    str = string [20];
    rango = 1..7;

    objeto = record 
        codigoObjeto:integer;
        tipoObjeto:rango;
        nombreObjeto:str;
        distaciaTierra:Integer; //anios luz
        descubridor:str;
        anioDescubrimiento:Integer;
    end;

    vObjetos = array [rango] of Integer; //of intger??

    lista = ^nodo;
    nodo = record
        elem:objeto;
        sig:lista;
    end;

procedure leoDatos (var o:objeto);
begin
    with o do begin
        WriteLn('Ingrese codigo de objeto');
        ReadLn(codigoObjeto);
        if (codigoObjeto <> -1) then begin
            WriteLn('Ingrese tipo de objeto');
            ReadLn(tipoObjeto);  
            WriteLn('Ingrese nombre del objeto');
            ReadLn(nombreObjeto);
            WriteLn('Ingrese distacia a la tierra');
            ReadLn(distaciaTierra);
            WriteLn('Ingrese su descubridor');
            ReadLn(descubridor);
            WriteLn('Ingrese anio de su descubrimineto');
            ReadLn(anioDescubrimiento);
        end;
    end;
end;

procedure cargoNodo (var L:lista; o:objeto);
var  
    aux:lista;
begin
    New(aux);
    aux^.elem:=o;
    aux^.sig:=L;
    L:=aux;
end;

//1
procedure objetosAlejados (L:lista; var codigo1,codigo2:Integer);
var 
    max1,max2:Integer;
begin
    max1:=0;
    max2:=0;
    while (L^.elem.codigoObjeto <> -1) do begin
        if (L^.elem.distaciaTierra > max1) then begin
            max2:=max1;
            max1:=L^.elem.distaciaTierra;

            codigo2:=codigo1;
            codigo1:=L^.elem.codigoObjeto;
        end
        else if (L^.elem.distaciaTierra > max2) then begin
            max2:=L^.elem.distaciaTierra;
            codigo2:=L^.elem.codigoObjeto;
        end;
        L:=L^.sig;
    end;
    WriteLn('Los codigos de los objetos mas alejados de La Tierra son: ',codigo1, ' y ',codigo2);
end;

//2 
procedure GalileoGalilei (L:lista; var cantObjetosGalileo:Integer);
begin
    if (L^.elem.anioDescubrimiento < 1600) and (L^.elem.descubridor = 'Galileo Galilei') then begin
        cantObjetosGalileo:= cantObjetosGalileo + 1;
    end;
end;

//3 
procedure inicializoCategorias (var v:vObjetos);
var
    i:Integer;
begin
    for i:=1 to 7 do begin
        v[i]:=0;
    end;
end;

procedure categorias (var v:vObjetos; cat:rango);
begin
    v[cat]:= v[cat] + 1;
end;

procedure informoCat (v:vObjetos);
var
    i:Integer;
begin
    for i:= 1 to 7 do begin
        WriteLn(i,' = ',v[i]);
    end;
end;

//4 
function CumpleCod (codigo:Integer):Boolean;
var
    dig,impar,par: integer;
begin
    impar:=0;par:=0;
    while (codigo <> 0) do begin
        dig:= codigo mod 10;
        if ((dig mod 2)= 0) then
            par:= par + 1
        else
            impar:= impar + 1;
        codigo:= codigo DIV 10;
    end;
    if (par > impar) then begin
        CumpleCod:=true;
    end
    else 
        CumpleCod:=False;
end;

procedure InformoOnoPa (nombre:str;codigo:Integer);
begin
    if (CumpleCod(codigo)) then begin
        WriteLn(nombre);
    end;
end;


procedure informoTodo (L:lista);
var
    o:objeto;
    v:vObjetos;
    cantObjetosGalileo,codigo1,codigo2:Integer;
begin
    codigo1:=0;
    codigo2:=0;
    cantObjetosGalileo:=0;
    while (L <> nil) do begin
        objetosAlejados(L,codigo1,codigo2);
        GalileoGalilei(L,cantObjetosGalileo);
        informoCat(v);
        InformoOnoPa(L^.elem.nombreObjeto,L^.elem.codigoObjeto);
        L:=L^.sig;
    end;
    WriteLn('Los objetos mas alejados alejados de La Tierra son: ', codigo1, ' y ', codigo2);
    WriteLn('La cantidad de objetos descubiertos por Galileo Galilei son: ',cantObjetosGalileo);
end;

var
    L:lista;
    o:objeto;
    v:vObjetos;
begin
    L:=nil;
    inicializoCategorias(v);
    leoDatos(o);
    while (o.codigoObjeto <> -1) do begin
        cargoNodo(L,o);
        leoDatos(o);
    end;
    informoTodo(L);
end.