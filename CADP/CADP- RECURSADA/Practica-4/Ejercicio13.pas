program Ejercicio13;
const
    dimFP = 100;
    dimFA = 50;
type 
    vPunto = array [1..dimFP] of real;
    vAnos = array [1..dimFA] of vPunto;

procedure cargoVectores (var p:vPunto; var a:vAnos);
var 
    i,j:Integer;
    num:Real;
begin
    for j:= 1 to dimFA do begin
        for i:= 1 to dimFP do begin
            Read(num);
            p[i]:= num; 
        end;
        a[j]:=p; 
    end;
end;


var
    p:vPunto;
    a:vAnos;
    i,j:Integer;
    prom,anioProm, anioMax,maxP,maxA:Real;
begin
    maxP:=0;
    maxA:=0;
    prom:= 0;
    cargoVectores(p,a);
    for i:= 1 to dimFA do begin
        for j:= 1 to dimFP do begin
            prom:= prom + p[j];
            if (a[j][i] > maxP) then begin
                maxP:= a[j][i];
                anioProm:= j;
            end;
        end;
        if (prom > maxA) then begin
            maxA:= prom;
            anioMax:= j;
        end;
    end;
    WriteLn(anioMax);
    WriteLn(anioProm);
end.