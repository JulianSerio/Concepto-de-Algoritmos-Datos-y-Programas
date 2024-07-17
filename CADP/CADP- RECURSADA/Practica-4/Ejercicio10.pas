program Ejercicio10;
const
    dimF = 300;
type
    vSalario = array [1..dimF] of Real;

procedure cargo (var v:vSalario; var dimL:Integer);
var
    sal:Real;
begin
    Write('Ingrese salario: ');Read(sal);
    while (dimL < dimF) and (sal <> 0) do begin
        dimL:= dimL + 1;
        v[dimL]:= sal;
        Write('Ingrese salario: ');Read(sal);
    end;
end;

procedure incremento (var v:vSalario; dimL:Integer; x:Real);
var
    i:Integer;
begin
    for i:= 1 to dimL do begin
        v[i]:= v[i]* x;
        WriteLn('El empleado ',i,' tiene un salario de: ', v[i]:2:1);
    end;
end;

function sueldoPromedio (v:vSalario; dimL:Integer):Real;
var
    i,cantEmple:Integer;
    suma:real;
begin
    suma:=0;
    cantEmple:= 0;
    for i:= 1 to dimL do begin
        suma:= suma + v[i];
        cantEmple:= cantEmple + 1;
    end;
    sueldoPromedio:= suma / cantEmple;
end;

var
    v:vSalario;
    dimL:Integer;
    x:Real;
begin
    dimL:=0;
    cargo(v,dimL);
    Write('Ingrese valor a aumentar: ');Read(x);
    incremento(v,dimL,x);
    WriteLn('El sueldo promedio de los empleados es: ',sueldoPromedio(v,dimL):2:2);
end.