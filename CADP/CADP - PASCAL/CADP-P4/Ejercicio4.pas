program Ejercicio4;

const
    max = 10;
type 
    numEnteros = array [1..max] of integer;

procedure cargarValor (var v:numEnteros;dL:Integer);
var
    i:Integer;
begin
    for i:=1 to max do
      read(v[i]);
      dL:= dL + 1;
end;


procedure posicion (v:numEnteros;dL:Integer);   //A
var
    numero,i,pos:Integer;
    
begin
    i:=0;
    pos:=-1;
    cargarValor(v,dL);

    WriteLn('Ingrese numero x ');
    ReadLn(numero);

    while ((v[i] <> numero) or (i <= dL)) do begin
        i:=i + 1;    
        WriteLn(v[i]);
        if (v[i] = numero) then begin
            pos:=i;
        end;
        
    end;
    WriteLn('La posicion del numero x es: ',pos); 
end;

procedure intercambio (v:numEnteros;dL:Integer);    //B
var 
    numero1,numero2:Integer;
    posX,posY,i:Integer;
begin
    i:=0;
    posX:=-1;
    posY:=-1;
    cargarValor(v,dL);
    WriteLn('Ingrese numero x');
    ReadLn(numero1);
    WriteLn('Ingrese numero y');
    ReadLn(numero2);

     while ((v[i] <> numero1) or (v[i] <> numero2) or (i <= dL)) do begin
        i:=i + 1;    
        WriteLn(v[i]);
        if (v[i] = numero1) then begin
            posY:=i;
        end;
        if (v[i] = numero2) then begin
            posX:=i;
        end;
    end;
    WriteLn('La posicion del numero x es: ',posY);
    WriteLn('La posicion del numero y es: ',posX); 
end;

function sumaVector (v:numEnteros;dL:Integer):Integer;  //C
var
    i:Integer;
    suma:Integer;
begin
    suma:=0;
    cargarValor(v,dL);

    for i:=1 to dL do
        suma:= suma + v[i];

    sumaVector:=suma;
end;

function promedio (v:numEnteros;var dL:Integer):Real;   //D
begin
    promedio:= sumaVector(v,dL) / dL; 
end;

procedure elementoMaximo (v:numEnteros;dL:Integer); //E
var
    i,posMax:Integer;
begin
    posMax:=-1;
    cargarValor(v,dL);
    for i:=1 to dL do begin
        if (v[i] > posMax) then
          posMax:=v[i];
    end;
    WriteLn('La posicion maxima es: ',posMax);
end;

procedure elementoMinimo (v:numEnteros; dL:Integer);    //F
var
    i,posMin:Integer;
begin
    posMin:=9999;
    cargarValor(v,dL);
    for i:=1 to dL do begin
         if (v[i] < posMin) then
            posMin:=v[i];
    end;
    WriteLn('El numero minimo es: ',posMin);
end;

var
    v:numEnteros;
    dL:Integer;
begin
    dL:=0;
    posicion(v,dL);
    intercambio(v,dL);
    sumaVector(v,dL);
    promedio(v,dL);
    elementoMaximo(v,dL);
    elementoMinimo(v,dL);
end.