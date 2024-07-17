program Ejercicio5;

type 
    str = String[20];
    auto = record
        marca:str;
        modelo:str;
        precio:Real;
    end;

procedure leoAuto (var a:auto);
begin
    with a do begin
        WriteLn('Ingrese marca del auto');ReadLn(marca);
        if (marca <> 'ZZZ') then begin
            WriteLn('Ingrese modelo del autO'); ReadLn(modelo);
            WriteLn('Ingrese precio del auto');ReadLn(precio);
        end;
    end;
end;

procedure maximos (marca,modelo:str;precio:Real;var max:real; var mar,mode:str);
begin
    if (precio > max) then begin
        max:=precio;
        mar:=marca;
        mode:=modelo;
    end;
end;

var
    a:auto; 
    sumo,total,max:real;
    cant:Integer; 
    marcaActual,modelo,marca:str;
begin
    max:=0;
    leoAuto(a);
    while (a.marca <> 'ZZZ') do begin
        cant:= 0;
        sumo:=0;
        marcaActual:=a.marca;
        while (marcaActual = a.marca) do begin
            sumo:= sumo + a.precio;
            cant:= cant + 1;
            maximos(marcaActual,a.modelo,a.precio, max,marca,modelo);
            leoAuto(a);
        end;
    total:= sumo / cant;
    WriteLn('Para esta marca el promedio fue: ',total);
    end;

    WriteLn('La marca y el modelo del auto mas caro es: ',marca,' ',modelo);

end.