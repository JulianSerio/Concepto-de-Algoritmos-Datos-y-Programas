program Ejercicio7;

var
    i:Integer;

    Piloto,
    PilotoPrimero,
    PilotoSegundo,
    PilotoAnteultimo,
    PilotoUltimo:String;
    
    Tiempo,
    tiempoPiloto1,
    tiempoPiloto2,
    tiempoPiloto99,
    tiempoPiloto100:Real;
begin
        //Inicializo variables 
    
    tiempoPiloto1:=9999;
    tiempoPiloto2:=9999;
    tiempoPiloto99:=0;
    tiempoPiloto100:=0;

    for i:= 1 to 100 do
        begin
            Write('Ingresar nombre de piloto: ');
            Read(Piloto);
            Write('Tiempo en el que termino la carrera: ');
            Read(tiempo);  
        
            if (Tiempo < tiempoPiloto1) then                               //PRIMEROS 2 PILOTOS
            begin
                tiempoPiloto2:= tiempoPiloto1;                             //TIEMPO 
                tiempoPiloto1:= Tiempo;
                
                PilotoSegundo:= PilotoPrimero;
                PilotoPrimero:= Piloto;                                    // NOMBRE PILOTO
            end 
            else if (Tiempo < tiempoPiloto2) then
            begin
                tiempoPiloto2:= Tiempo;
                PilotoSegundo:= Piloto;
                
            end;


            if (Tiempo > tiempoPiloto100) then                             // ULTIMOS 2 PILOTOS
            begin
                tiempoPiloto99:= tiempoPiloto100;
                tiempoPiloto100:= Tiempo;

                PilotoUltimo:= PilotoAnteultimo;
                PilotoUltimo:= Piloto;                                
            end
            else if (Tiempo > tiempoPiloto99) then
            begin
                tiempoPiloto99:= Tiempo;
                PilotoAnteultimo:= Piloto;
            end;
        end;
        WriteLn('El nombre de los 2 pilotos que terminaron primeros son: ', PilotoPrimero, 'y', PilotoSegundo );
        WriteLn('El nomnre de los 2 pilotos que terminaron ultimos son:  ', PilotoAnteultimo, 'y', PilotoUltimo);
end.