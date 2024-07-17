program Ejercicio7;
type    
    rango = 1..10;
    digitos = array [rango] of Integer;

procedure inicializar (var v:digitos);
var
    i:rango;
begin
    for i:=1 to 10 do 
        v[i]:=0; //REVISAR
end; 

procedure descomponer (var v:digitos;num:Integer); 
var
    resto:rango;
begin
    while (num <> -1) do begin
        resto:=  num mod 10; //SACO EL DIGITO

        v[resto + 1]:= v[resto + 1] + 1;    //INCREMENTO CONTADOR
        num:= num div 10;   //HAGO MAS CHICO EL NUM
    end;
end;

procedure informar (v:digitos);//A
var
    i:rango;
begin
    for i:=1 to 10 do 
        WriteLn('Numero ',i - 1,' : ',v[i],' veces');
end;

function digitoMasLeido (v:digitos):rango;  //B
var
    i,digMax:rango;
    max:Integer;
begin
    max:=-1;
    for i:=1 to 10 do
      if (v[i] > max) then
      begin
        max:=v[i];
        digMax:=i;
      end;
    digitoMasLeido:=digMax
end;

procedure digitosNoP (v: digitos);  //C
var
  i: rango;
begin
  for i:= 1 to 10 do
    if (v[i] = 0) then begin
      WriteLn('Los digitos que no tuvieron ocurrencias son: ', i-1);
    end;
end;

var
    v:digitos;
    num:Integer;
begin
    Read(num);
    inicializar(v);
    while (num <> 0) do begin
        descomponer(v,num);
        ReadLn(num);
    end;
    informar(v);
    digitosNoP(v);
    WriteLn('El digito mas leido es: ',digitoMasLeido(v));
    

end.