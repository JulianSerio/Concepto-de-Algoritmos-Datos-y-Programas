program Ejercicio5;
type 
    RangoCamiones = 1..100;

    camion = record                                 //
        codCamion:RangoCamiones;                    //
        patente:String;                             //  SE DISPONE
        anioFabricacion:Integer;                    //
        capacidad:real;                             //
    end;                                            //
                                                    //
    vCamiones = array [RangoCamiones] of camion;    //
    vContador = array [RangoCamiones] of Integer;

    viaje = record
        cod:Integer;
        codCamion:RangoCamiones;
        distancia:Integer;
        ciudadDestino:String;
        anio:Integer;
        DNIchofe:Integer;
    end;

    lista = ^nodo;
    nodo = record
        elem:viaje;
        sig:lista;
    end;
 
procedure leoViaje (var v:viaje);
begin
    ReadLn(v.cod);
    if (v.cod <> -1) then begin
        ReadLn(v.codCamion);
        ReadLn(v.distancia);
        ReadLn(v.ciudadDestino);
        ReadLn(V.anio);
        ReadLn(v.DNIchofe);
    end;
end;

procedure cargoNodo (var L:lista; v:viaje);
var 
    aux:lista;
begin
    New(aux);
    aux^.elem:=v;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoLista (L:lista);
var
    v:viaje;
begin
    leoViaje(v);
    while (v.cod <> -1) do begin
        cargoNodo(L,v);
        leoViaje(v);
    end;
end;

function cumple (cod:Integer):Boolean;
var
    par,impar,dig:Integer;
begin
    while (cod <> 0) do begin
        dig:= cod mod 10;
        if ((dig mod 2)=0) then
            par:= par + 1
        else 
            impar:= impar + 1;
        cod:= cod div 10;
    end;

    if (par = 0) then
        cumple:= True
    else
        cumple:= False
end;

procedure maximos (v:vContador; vCamiones:vCamiones; var max,patenteMas:Integer)
begin
    for i:= 1 to 100 do begin
        if (v[i] > max) then begin
            max:= v[i];
            patenteMas:= vCamiones[i].patente; 
        end;
    end;
end;

procedure minimos (v:vContador; vCamiones:vCamiones ; var min,patenteMenos);
begin
    for i:= 1 to 100 do begin
        if (v[i] < min) then begin
            min:=v[i];
            patenteMenos:=vCamiones[i].patente;
        end;
    end;
end;

procedure recorro (L:lista; v:vCamiones);
var
    cantViajes,min,max,i,patenteMenos,patenteMas:Integer;
    vC:vContador;
begin
    for i:= 1 to 100 do
        vC[i]:=0;

    max:=-1;
    min:= 9999;
    while (L <> NIL) do begin
        vC[L^.elem.codCamion] := vC[L^.elem.codCamion] + L^.elem.distancia;
        if (v[L^.elem.codCamion].capacidad > 30.5) and ((v[L^.elem.codCamion].anioFabricacion + 5)=v[L^.elem.codCamion].anioFabricacion) then
            cantViajes:= cantViajes + 1;
        if (cumple(L^.elem.DNIchofe)) then
            WriteLn(L^.elem.cod); //C
    end;
    maximos(vC,v,max,patenteMas);
    minimos(vC,v,min,patenteMenos);

    WriteLn('La patente con menos kM recorridos es: ',patenteMenos);    //A
    WriteLn('La patente con mas kM recorridos es: ',patenteMas);
    WriteLn('La cantidad de viajes que se han realizado con capacidad mayor a 30,5 y posean una antiguedad mayor a 5 anios es: ',cantViajes); //B

end;


var
    L:lista;
    v:vCamiones;
begin
    L:=Nil;
    cargoCamiones(v); //Se dispone
    cargoLista(L);
    recorro(L,v);
end.