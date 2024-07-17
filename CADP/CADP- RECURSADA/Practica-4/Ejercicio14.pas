program Ejercicio14;

//tabla info desarrollador y promedio que se paga por ahora
const 
    dimF = 1000;

type 
    str = String[20];
    RangoCodigo = 1..dimF;
    RangoRol = 1..5; 

    programador = record
        pais:str;
        codPro:RangoCodigo;
        nombreProject:str;
        rol:RangoRol;
        horasTrabajadas:Real;
    end;

    vTablaRol = array [RangoRol] of real;
    vContador = array [RangoCodigo] of programador;


procedure LeoInfo (var p:participante);
begin
    with p do begin

        WriteLn('Codigo Proyecto: ');ReadLn(codPro);
        if (codPro <> -1) then begin
            WriteLn('Pais:');ReadLn(pais);
            WriteLn('Nombre Proyecto: ');ReadLn(nombreProject);
            WriteLn('Rol: ');ReadLn(rol);
            WriteLn('Horas Trabajadas: ');ReadLn(horasTrabajadas);
        end;
    end;
end;



procedure cargoVector (var v:vProyecto; var dimL:Integer);
var
    p:participante;
begin
    LeoInfo(p);
    while (p.codPro <> -1) and (dimL < dimF) do begin
        dimL:= dimL + 1;
        v[dimL] := p;
        LeoInfo(p);
    end;
end;



var
    dimL,i,HTAbases:Integer;
    vRol:vTablaRol;
begin   
    dimL:=0;
    HTAbases:=0;
    cargoVector(v,dimL);
    //cargoVector(vRol);
    for i:= 1 to dimL do begin
        if (v[i].rol = 5) then begin    
            HTAbases := HTAbases + v[i].horasTrabajadas;
        end;

    end;
end.