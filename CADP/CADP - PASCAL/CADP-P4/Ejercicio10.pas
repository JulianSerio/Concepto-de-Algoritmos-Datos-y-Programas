program Ejercicio10;
const
    dF = 2;
type
    salario = array [1..dF] of Real;


procedure cargarVector (var v:salario;var dL:Integer);
var 
    num:Real;
begin
    WriteLn('Ingrese salario');
    ReadLn(num);
    while ((num <> 0) and (dL <= dF)) do begin
        dL:= dL + 1;
        v[dL] := num;
        WriteLn('Ingrese otro salario');
        ReadLn(num);
    end;  
end;
procedure incrementarSueldo (sueldoTotal,x:real; v:salario; dL:Integer);
var
    i:Integer;
begin
    for i:=1 to dL do begin
        v[i]:= (v[i] * x)
    end;
    writeln ('El empleado ',i,' tiene un nuevo salario de: ',v[i]:2:1);
end;

procedure totalSueldo (var sueldoTotal:Real; v:salario;dL:Integer);
var
    i:Integer;
begin
    sueldoTotal:=0;
    for i:=1 to dL do 
        sueldoTotal:= sueldoTotal + v[i];
end;

var
    v:salario;
    dL:Integer;
    x,sueldoTotal:Real;
begin
    cargarVector(v,dL);
    writeln ('Ingrese el %15 que desea aumentar: '); readln (X);
    incrementarSueldo(sueldoTotal,x,v,dL);
    totalSueldo(sueldoTotal,v,dL);
    writeln ('El sueldo promedio de los empleados de la empresa es: ',sueldoTotal/dL:2:1);
end.