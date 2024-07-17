program Ejercicio1;
const 
    dimF = 500;
type
    vNumero = array [1..dimF] of integer;

function BuscarPosElem (x:Integer; v:vNumero; dimL:Integer):Integer;
var
    pos:integer;
    exito:Boolean;
begin
    pos:= 1;
    exito:= False;
    while (pos <= dimL) and (not exito) do begin
        if (x = v[pos]) then
          exito:= true
        else 
            pos:= pos + 1;
    end;
    BuscarPosElem:= pos;
end;

function BusquedaBin (v:vNumero; j:Integer; dimL:Integer; x:Integer):Boolean;
var
    pri,ult,medio:Integer;
    esta:Boolean;
begin
    esta:=False;
    j:= 0; pri:= 1; ult:= dimL;
    medio:= (pri + ult) div 2;
    while (pri <= ult) and (x <> v[medio]) do begin
        if (x < v[medio]) then 
            ult:= medio - 1
        else 
            pri:= medio + 1;
        medio:= (pri + ult) div 2;
    end;
    if (pri <= ult) and (x = v[medio]) then 
        esta:= true;
    BusquedaBin:= esta;

end;

var
    dimL,n:Integer;
    v:vNumero;
begin
    dimL:=0;
    WriteLn('Ingrese valor a buscar: ');Read(n);
    WriteLn(BuscarPosElem(n,v,dimL));
    WriteLn(BusquedaBin(v,n,dimL));
    
end.