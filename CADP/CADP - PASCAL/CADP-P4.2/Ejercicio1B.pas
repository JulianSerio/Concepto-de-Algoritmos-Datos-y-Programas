program Ejercicio1B;
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
    pos:Integer;
    encontre:Boolean;
begin
    pos:=1;
    while ((pos <= dL) and (v[pos] < n)) do begin
        pos:= pos + 1;
    end;
    if ((pos <= dL) and (v[pos] = n )) then
        buscar:=True
    else 
        buscar:=False;
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