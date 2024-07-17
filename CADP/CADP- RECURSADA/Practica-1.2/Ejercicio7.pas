program Ejercicio7;


var 
    i,tiempo,max1,max2,min1,min2:Integer;                                                           //PRIMEROS PUESTOS  = min 
    nombre,primerPuesto,segundoPuesto,anteUltimoPuesto,ultimoPuesto:string;                         //ULTIMOS PUESTOS = max
begin
    max2:=0;
    min1:=9999;
    min2:=9999;
    max1:=0;
    for i:= 1 to 100 do begin
        WriteLn('Ingrese nombre del piloto');
        ReadLn(nombre);
        WriteLn('En cuanto tiempo termino la carrera');
        ReadLn(tiempo);

        if (tiempo < min1) then begin
            min2:= min1;
            min1:= tiempo;

            segundoPuesto:=primerPuesto;
            primerPuesto:=nombre;
        end
        else if (tiempo < min2) then begin
                max2:= tiempo;
                segundoPuesto:= nombre;
        end;

        if (tiempo > max1) then begin
            min2:= min1;
            min1:= tiempo;

            ultimoPuesto:= anteUltimoPuesto;
            anteUltimoPuesto:=nombre;
        end
        else if (tiempo > max2) then begin
            max2:= tiempo;
            ultimoPuesto:= nombre;
        end;
    end;    

    WriteLn('Los nombres de los dos pilotos que finalizaron en los dos ultimos puestos son: ',max1,' y ',max2);
    WriteLn('Los nombres de los dos pilotos que finalizaron en los dos primeros puestos', min1, ' y ',min2);
end.