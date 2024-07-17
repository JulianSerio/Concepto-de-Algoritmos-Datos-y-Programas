procedure pantalon (codigo:Integer; precio:Real; tipo:String);
var
    CodCaro:Integer;
begin
    CodCaro:=0;
    if (tipo = 'pantalon') then
        if (precio > CodCaro) then
        begin
            CodCaro:= codigo;
        end; 
    WriteLn('El codigo del pantalon mas caro es: ',CodCaro);