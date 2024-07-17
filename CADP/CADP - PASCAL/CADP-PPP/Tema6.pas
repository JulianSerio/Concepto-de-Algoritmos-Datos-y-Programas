program Tema6;

type
    codModelo = 1..150;
    sistemas = 1..6;
    str = string[20];

    notebook = record
        codigoModelo:codModelo;
        marca:str;
        codigoCliente:Integer;
        codigoOS:sistemas
    end;

    lista = ^nodo;
    nodo = record
        elem:notebook;
        sig:lista;
    end;

    vSistemas = array [sistemas] of Real;
    vTablaPrecios = array [codModelo] of Real;

procedure leoDatos (var n:notebook);
begin
    with n do begin
         WriteLn('Ingrese codigo de cliente');ReadLn(codigoCliente);
        if (codigoCliente <> -1) then begin
            WriteLn('Ingrese codigo de modelo');ReadLn(codigoModelo);
            WriteLn('Ingrese marca');ReadLn(marca);
            WriteLn('Ingrese codigo de Sistema operativo');ReadLn(codigoOS);
        end;
    end;
end;

procedure cargoNodo (var L,ult:lista; n:notebook);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=n;
    aux^.sig:=Nil;
    if (L = Nil) then
      L:=aux
    else
        ult^.sig:=aux;
    ult:=aux;
end;

procedure cargoLista (var L:lista);
var
    n:notebook;
    ult:lista;
begin
    leoDatos(n);
    while (n.codigoCliente <> -1) do begin
        cargoNodo(L,ult,n);
        leoDatos(n);
    end;
end;

procedure inicializoVectorOS (var vOS:vSistemas);
var
    i:Integer;
begin
    for i:= 1 to 6 do begin
        vOS[i]:=0;
    end;
end;

procedure procesoLista (L:lista; var vOS:vSistemas; var vP:vTablaPrecios; var cant:integer);
begin
    cant:=0;
    while (L <> nil) do begin
        vOS[L^.elem.codigoOS]:= vOS[L^.elem.codigoOS] + vP[L^.elem.codigoModelo];
        if (L^.elem.marca = 'Lenovo') and ((L^.elem.codigoCliente mod 2)= 0 ) then begin
            cant:= cant + 1;
        end;
        L:=L^.sig;
    end;
end;

procedure maximos (v:vSistemas; var OS1,OS2:Real);
var
    max1,max2:Real;
    i:Integer;
begin
    max1:=0;max2:=0;
    for i:=1 to 6 do begin
        if (v[i] > max1) then begin
            max2:=max1;
            OS2:=OS1;
            max1:=v[i];
            OS1:=i;
        end
        else if(v[i] > max2) then begin
                max2:=v[i];
                OS2:=i;
            end;
    end;
end;

var
    L:lista;
    vOS:vSistemas;
    vP:vTablaPrecios; // se dispone? 
    OS1,OS2:Real;
    cant:integer;
begin
    L:=Nil;
    cargoLista(L);
    inicializoVectorOS(vOS);
  
    procesoLista(L,vOS,vP,cant);
    maximos(vOS,OS1,OS2);
end.