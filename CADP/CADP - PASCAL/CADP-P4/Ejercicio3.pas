program Ejercicio3;
const
    dF = 10;
type
    vector = array [1..dF] of Integer;

procedure datos (var v:vector; var dL:Integer);
var
    i:Integer;
begin
    for i:=1 to dF do begin
        v[i]:=i;
        dL:= dL + 1;
    end;
end;

procedure ImprimirDesdeUno(v:vector;dL: integer); //A
var
    i:integer;
begin
	for i:=1 to dL do 
    begin
        v[i]:=i;
		writeln(v[i]);
    end;
end;

procedure ImprimirDesdeFin(v:vector;dL:integer); //B
var
    i:integer;
begin
	for i:= dF downto 1 do 
    begin
        v[i]:=i;
        WriteLn(v[i]);
    end;
end;


procedure mitadaPrimero (v:vector;dL:Integer);    //C
var
    i:Integer;
begin 
    for i:= (dL div 2) downto 1 do 
    begin
        WriteLn(v[i]);
    end;
end;

procedure mitadUltimo (v:vector; dL:Integer);
var 
    i:Integer;
begin
    for i:=(dL div 2) to dF do
    begin
        WriteLn(v[i]);
    end; 
end;                                        //FIN C

procedure XtoY(v:vector;dL:integer);        //D
var 
    i,PosX,PosY:Integer;
begin
    WriteLn('Ingrese corneada X');
    ReadLn(PosX);
    WriteLn('Ingrese cordenada Y');
    ReadLn(PosY); 
	if ((PosX <= dL) and (PosY <= dL)) then 
    begin
        if (PosX < PosY) then
        begin
            for i:=PosX to PosY do 
            begin
                WriteLn(v[i]);
            end;
        end
        else begin
            for i:=PosX downto PosY do begin
                WriteLn(v[i]);
            end;
        end;
    end;
end;

procedure puntoE (v:vector;dL:Integer);
var
    x,y,i:Integer;
begin
    WriteLn('Ingrese corneada X');      //A
    ReadLn(x);
    WriteLn('Ingrese cordenada Y');
    ReadLn(y); 
    for i:=x to y do 
    begin
        v[i]:=i;
		writeln(v[i]);                 
    end;

    for i:=df downto x do               //B
    begin 
        v[i]:=i;
        WriteLn(v[i]);
    end;

    for i:= (dL div 2) downto x do      //C
    begin
        WriteLn(v[i]);
    end;
end;


//PPAL
var
    v:vector;
    dL:Integer;
begin
    datos(v,dL);
    ImprimirDesdeUno(v,dL);
    ImprimirDesdeFin(v,dL);
    mitadaPrimero(v,dL);
    mitadUltimo(v,dL);
    XtoY(v,dL);
end.