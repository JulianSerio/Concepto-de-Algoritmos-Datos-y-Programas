program ejercicio000;
type 
    vOcurrencias = array [0..100] of integer;

procedure inicializo (var v:vOcurrencias);
var 
    i:Integer;
begin
    for i:= 0 to 100 do begin
        v[i]:=0;
    end;
end;
procedure leoNumeros (var v: vOcurrencias);
var
    num,i :Integer;

begin
    WriteLn('Ingrese un numero entre el 0 y el 100');
    ReadLn(num);
    while (num <> 0) do begin
        v[num]:= v[num] + 1;
        WriteLn('Ingrese un numero entre el 0 y el 100');
        ReadLn(num);
    end;
    for i:= 0 to 100 do begin
        WriteLn(v[i]);
    end;
end;
var
    v:vOcurrencias;
begin
    inicializo(v);
    leoNumeros(v);
end.