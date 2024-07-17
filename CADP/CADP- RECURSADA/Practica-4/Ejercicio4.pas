program Ejercicio4;

function posicion (v:vArray;x,dimL:Integer):Integer;
begin
    if (x <= dimL) and (x > 1) then 
        posicion:=v[x]
    else
        posicion:= -1;
end;

procedure intecambio (var v:vArray; x,y:Integer);
var
    aux:Integer;
begin
    aux:= v[x];
    v[x]:= v[y];
    v[y]:= aux;
end;

function sumaVector (v:vArray):Integer;
var
    i,suma:Integer;
begin
    for i:= 1 to 100 do begin
        suma:= suma + v[i];
    end;
    sumaVector:= suma;
end;

function promedio (v:vArray):Real;
var
    sumaTotal:Integer;
begin
    sumaTotal:= sumaVector(v);
    promedio:= sumaTotal / 100;
end;

procedure maximos (v:vArray; var max:Integer);
var
    i:Integer;
begin
    for i:= 1 to 100 do begin
        if (v[i] > max) then begin
            max:= v[i];
            pos:= i;
        end;  
    end;
end;

procedure minimos (v:vArray; var min:Integer);
var 
    i:Integer;
begin
    for i:= 1 to 100 do begin
        if (v[i] < min) then begin
            min:= v[i];
            pos:= i;
        end;
    end;
end;

var

begin
  

end.