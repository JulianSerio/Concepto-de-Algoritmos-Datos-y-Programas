program Tema2;

type
    codCamion = 200..255;
    str = String[20];

    servicio = record 
        CodigoCamion:codCamion;
        provOrigen:str;
        provDestino:str;
        cantKmRecorridos:Integer;
        DNIcliente:Integer;
    end;
                                //INFO ORDENADA POR PROVINCIA DE ORIGEN
    lista = ^nodo;
    nodo = record 
        elem:servicio;
        sig:lista;
    end;

    vCamion = array [codCamion] of Integer;

procedure InicializoVector (var v:vCamion);
var 
    i:Integer;
begin
    for i:=200 to 250 do begin
        v[i]:=0;  
    end;
end;

procedure contador (s:servicio; var v:vCamion); 
begin
    if (s.cantKmRecorridos > 5000) then
      v[s.CodigoCamion]:= v[s.CodigoCamion] + 1;
end;

procedure CantDNIimpar (s:servicio; DNI:Integer; var CantDNIimpar:Integer);
var
    dig:Integer;
begin
    if ((DNI mod 2)= 1) and (s.provOrigen = s.provDestino) then
        CantDNIimpar:= CantDNIimpar + 1;
end;

function camionesCumplen (valor:Integer; v:vCamion):Integer; //CALCULAR UNA VEZ QUE SE PROCESAN LOS TICKETS
var
    cant,i:Integer;
begin
    cant:=0;
    for i:=200 to 250 do begin
        if(v[i] > valor) then
          cant:=cant + 1;
    end;
    camionesCumplen:=cant;
end;

procedure actualizoMaximos (provincia:str; cantKm:Integer; var ProvMasViajes:str; var maxKm:Integer);
begin
    if (cantKm > maxKm) then begin
        ProvMasViajes:=provincia;
        maxKm:=cantKm;
    end;
end;

procedure procesoLista (L:lista; var v:vCamion; var ProvMasViajes:str; var CantDNIimpar:Integer);
var
    provActual:str;
    contKM,maxKm:Integer;
begin
    CantDNIimpar:=0;
    maxKm:=0;                    
    while (L <> Nil) do begin
        provActual:=L^.elem.provOrigen;
        contKM:=0;
        while (L <> nil) and (L^.elem.provOrigen = provActual) do begin
            contador(L^.elem,v); //parte del a
            contKM:=contKM + L^.elem.cantKmRecorridos;
            CantDNIimpar(L^.elem,L^.elem.DNIcliente,CantDNIimpar);
            L:=L^.sig;
        end;
        actualizoMaximos(provActual,contKM,ProvMasViajes,maxKm); //B
    end;
end;


var
    L:lista;
    v:vCamion;//A
    ProvMasViajes:str;//B
    CantDNIimpar:Integer;//C
begin
    L:=Nil;
    //cargoLista(L);
    InicializoVector(v);

    procesoLista(L,v,ProvMasViajes,CantDNIimpar);

    WriteLn(camionesCumplen(5000,v));
    WriteLn('El nombre de la provincia donde partieron mas viajes es: ',ProvMasViajes);
    WriteLn('La cantidad de clientes con DNI impar es: ',CantDNIimpar);
end.