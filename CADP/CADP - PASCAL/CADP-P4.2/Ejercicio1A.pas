program Ejercicio1A;
const
    dF = 500;
type 
    vector = array [1..dF] of Integer;

procedure reciboVector (var v:vector; var dL:Integer);
var
    i:Integer;
begin 
    dL:=0;
    for i:=1 to dF do begin
        v[i]:=i;
        dL:= dL + 1;
    end;
end;

function buscar (v:vector;dL,n:Integer):Boolean;
var 
    apareceNum:Boolean;
    pos:Integer;
begin
    apareceNum:=False;
    pos:=1;
    while ((pos <= dL) and (not apareceNum)) do begin
        if (v[pos]= n) then 
            apareceNum:=True
        else
            pos:= pos + 1;
    end;
    buscar:=apareceNum;
end;

var
    v:vector;
    dL,num:Integer;
begin
    WriteLn('Ingrese valor de n');
    ReadLn(num);
    reciboVector(v,dL);
    if (buscar(v,dL,num)) then
    begin
        WriteLn(num,' Se encuentra en el vector')
    end
    else 
        WriteLn(num,' No se encuentra en el vector');
  
end.