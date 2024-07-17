program Ejercicio3;

type 
    // se dispone 
    // vNumeros = array [1..dimF] of integer 

procedure imprimoAZ (v:vNumeros; dimL:Integer;);
var
    i:Integer;
begin
    for i:= 1 to dimL do begin
        WriteLn(i, ' ', v[i]);
    end;
end;

procedure imprimoZA (v:vNumeros; dimL:Integer;);
var 
    i:Integer;
begin
    for i:= dimL downto 1 do begin
        WriteLn(i, ' ', v[i]);
    end;
end;

procedure imprimoMitad (v:vNumeros; dimL:Integer);
var
    i:Integer;
begin
    for i:= (dimL div 2) downto 1 do begin
        WriteLn(i, ' ', v[i]);
    end;
end;

procedure imprimoMitad2 (v:vNumeros; dimL:Integer);
var
    i:Integer;
begin
    for i:= (dimL div 2) to 1 do begin
        WriteLn(i,' ',v[i]);
    end;
end;

procedure xyAdelante (v:vNumeros; x:Integer; y:Integer);
var
    i:Integer;
begin
    if (x < y) then begin
        for i:= x to y do begin
            WriteLn(i,' ',v[i]);
        end;
    end
    else
    if (x > y) then begin
        for i:= y to x do begin
            WriteLn(i,' ',v[i]);
        end;
    end;
end;

procedure xyAtras (v:vNumeros; x:Integer; y:Integer);
var
    i:Integer;
begin
    if (x < y) then begin
        for i:= x downto y do begin
            WriteLn(i,' ',v[i]);
        end;
    end
    else
    if (x > y) then begin
        for i:= y downto x do begin
            WriteLn(i,' ',v[i]);
        end;
    end;
end;

var

begin
  
end.