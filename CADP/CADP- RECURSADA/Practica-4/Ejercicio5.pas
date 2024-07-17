program Ejercicio5;
const 
    DIMF = 100;

type
    vArray = array [1..DIMF] of integer;

procedure cargoVector (var v:vArray; var dimL:Integer);
var
    num:Integer;
begin
    dimL:=0;
    ReadLn(num);
    while (num <> 0) and (dimL < DIMF) do begin
        dimL:= dimL + 1;
        v[dimL] := num;
        ReadLn(num);
    end;
end;

procedure elementoMaximo (v:vArray; dimL:integer; var posMax,max:integer);
var
    i:integer;
begin
	for i:=1 to dimL do begin
		if (v[i] > max) then begin
			max:= v[i];
            posMax:= i;
		end;
    end;
end;
procedure elementoMinimo (v:vArray; dimL:Integer; var posMin,min:Integer);
var
	i:integer;
begin
	for i:=1 to DimL do begin
		if(v[i] < min) then begin
			posMin:=i;
			min:=v[i];
		end;
	end;
end;

procedure intecambio (var v:vArray; x,y:Integer);
var
    aux:Integer;
begin
    aux:= v[y];
    v[y]:= v[x];
    v[x]:= aux;
end;

var
    v:vArray;
    posMax,posMin,max,min,dimL:Integer;
begin
    min:=9999;
    max:=-1;
    cargoVector(v,dimL);
    elementoMaximo(v,dimL,posMax,max);
    elementoMinimo(v,dimL,posMin,min);
    intecambio(v,posMin,posMax);
    WriteLn('El elemento maximo ', max ,' que se encontraba en la posicion ', posMax  ,' fue intercambiado con el elemento minimo ',min ,' que se encontraba en la posicion ',posMin);
end.