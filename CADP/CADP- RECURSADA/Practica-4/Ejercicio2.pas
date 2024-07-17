program Ejercicio2;
const
    cant_datos = 150;
type
    vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var
    num: Real;
begin
    ReadLn(num);
    while (dimL < cant_datos) and (num <> 0) do begin
        dimL:= dimL + 1;
        v[dimL]:= num;
        ReadLn(num);
    end;
end;
procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
    i:Integer;
begin
    for i:= 1 to dimL do begin
        suma:= suma + v[i]; // Sumo el contenido de la celda i
        v[i]:= v[i] + n;
    end;
end;

{ programa principal }
var
    datos : vdatos;
    i, dim : integer;
    num, suma : real;
begin
    dim := 0;
    suma := 0;
    cargarVector(datos,dim); { completar }
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(datos,dim,num,suma);{completar}
    writeln('La suma de los valores es: ', suma:2:0);
    writeln('Se procesaron: ',dim, ' numeros')
end.