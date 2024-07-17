program XXX;

procedure tres (var v:vector; var dimL: Integer; dato:integer; var b:Boolean);
var
    i,j:Integer;
begin
    i:= 1;
    while (i <= dimL) and (v[i] < dato) do 
        i:= i + 1;
    if (i > dimL) then
        b:= False
    else
        while (i < dimL) and (v[i] = dato) do begin
            for j:= i + 1 to dimL do begin
                v[j - 1]:= v[j];
                dimL:= dimL - 1;
            end;
        end;
end;

begin
  

end.