program Ejercicio14;
const 
    precioSoja = 320;
type 
    rango = 1..3;
    str = String[20];


procedure leoDatos (var cantHe:Integer; var tipoZona:rango; var localidad: str);
begin
    WriteLn('Ingrese cantidad de hectareas sembradas');ReadLn(cantHe);
    WriteLn('Ingrese tipo de zona');ReadLn(tipoZona);
    WriteLn('Ingrese localidad');ReadLn(localidad);
end;

procedure rendimientoxd (cantHe:Integer;zona:rango; var rendimiento:Real);
begin
    if (zona = 1) then
        rendimiento:= (cantHe * 6) *precioSoja;
    if (zona = 2) then
        rendimiento:= (cantHe * 2.6)* precioSoja;
    if (zona = 3) then
        rendimiento:= (cantHe * 1.4)* precioSoja;
end;

procedure TresFebrero (cantHe:integer; zona:rango; localidad:str; var cantCampos:Integer; rendimiento:real);
begin
    if (rendimiento > 10000) and (localidad = 'Tres de Febrero') then
        cantCampos:= cantCampos + 1; 
end;

procedure maximo (localidad:str;var max:real; var locMax:str; rendimiento:real);
begin
    if (rendimiento > max) then begin
        max:= rendimiento;
        locMax:= localidad;
    end;
end;

procedure minimo (localidad:str; var min:real; var locMin:str; rendimiento:Real);
begin
    if (rendimiento < min) then begin
        min:= rendimiento;
        locMin:= localidad;
    end;
end;

var
    cantHe,itaraciones,cantCampos:Integer;
    zona:rango;
    localidad,locMax,locMin:str;
    rendimiento,max,min,sumaRend,rendimientoPromedio:Real;

begin
    max:=-1;
    min:=9999;
    itaraciones:=0;
    sumaRend:=0;
    repeat
        leoDatos(cantHe,zona,localidad);
        rendimientoxd(cantHe,zona,rendimiento);
        TresFebrero(cantHe,zona,localidad,cantCampos,rendimiento);
        minimo(localidad,min,locMin,rendimiento);
        maximo(localidad,max,locMax,rendimiento);
        sumaRend:= sumaRend + rendimiento;
        itaraciones:= itaraciones + 1;
    until (localidad = 'Saladillo') and (cantHe = 900);
    rendimientoPromedio:= sumaRend / itaraciones; 

    WriteLn('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000',cantCampos);
    WriteLn('La localidad del campo con mayor rendimiento económico esperado',locMax);
    WriteLn('La localidad del campo con menor rendimiento económico esperado',locMin);
    WriteLn('El rendimiento económico promedio es: $',rendimientoPromedio);
end.