program Ejercicio1AD;
const
    dimF = 10000;

type    
    
    computadora = record
        cod:integer;
        version:Real;
        cantPaquetes:Integer;
        cantCuentasDeUsuario:Integer;
    end;

    vCompu = array [1..dimF] of computadora;

procedure leoComputadora (var c:computadora);
begin
    with c do begin
        Write('Codigo: ');Read(cod);
        if (cod <> -1) then begin
            Write('Version: ');Read(version);
            Write('Cantidad de paquetes: ');Read(cantPaquetes);
            Write('Cantidad de usuarios: ');Read(cantCuentasDeUsuario);
        end;
    end;
end;

procedure cargoVector (var v:vCompu; var dimL:Integer);
var
    c:computadora;
begin
    dimL:=0;
    leoComputadora(c);
    while (c.cod <> -1) and (dimL < dimF) do begin
        dimL:= dimL + 1;
        v[dimL] := c;
        leoComputadora(c);
    end;
end;

procedure ordenoVector (var v:vCompu; dimL:Integer);
var
    item:computadora;
    i,j,p:Integer;
begin
    for i:= 1 to dimL - 1 do begin
        p:=i;   
        for j:= i + 1 to dimL do 
            if (v[j].cod < v[p].cod) then
              p:=j;
        item:= v[p];
        v[p]:= v[i];
        v[i]:= item;
    end;
end;

var
    v:vCompu;
    dimL,i:Integer;
begin
    cargoVector(v,dimL);
    ordenoVector(v,dimL);
    for i:= 1 to dimL do begin
        WriteLn('pos: ',i , 'cont: ', v[i]);
    end;

end.