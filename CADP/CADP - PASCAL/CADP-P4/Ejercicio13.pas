program Ejercicio13;
const
    TotalLugares=100; 
    TotalAnos=50; 
type
    RegistroXLugar=record
        lugar:string;
        temperatura:real;
    end;

    Lugares=array [1 .. TotalLugares] of RegistroXLugar;

    Anos=array [1 .. TotalAnos] of Lugares;

procedure CargoVector(var Registro:Anos);
var
    i,n:Integer;
begin
    for i:=1 to TotalAnos do begin
        for n:=1 to TotalLugares do begin
            Write ('Ingrese el lugar donde se registro la temperatura: ');
            ReadLn(Registro[i][n].lugar);
            Write ('Ingrese la temperatura que se registro: ');
            ReadLn(Registro[i][n].temperatura);
        end;
    end;
end;

procedure AnalizoDatos(Registro:Anos;var AnoConMasTempPromedio,AnoConMasTemp:Integer;var NombreAnoConMasTempEn1Punto:String);
var
    i,n:Integer;
    SumaTempXAno,TempPromedioXAno,AnoConMasTempEn1Punto:Real;
begin
    TempPromedioXAno:=0;AnoConMasTempEn1Punto:=0;
    for i:=1 to TotalAnos do begin
        SumaTempXAno:=0;
        for n:=1 to TotalLugares do begin
            SumaTempXAno:=SumaTempXAno + Registro[i][n].temperatura;
            if (AnoConMasTempEn1Punto<Registro[i][n].temperatura) then begin
                AnoConMasTempEn1Punto:=Registro[i][n].temperatura;
                AnoConMasTemp:=i;
                NombreAnoConMasTempEn1Punto:=Registro[i][n].lugar;
            end;
        end;
        SumaTempXAno:=(SumaTempXAno/TotalLugares);
        if (TempPromedioXAno<SumaTempXAno) then begin
            TempPromedioXAno:=SumaTempXAno;
            AnoConMasTempPromedio:=i;
        end;
    end;
end;

var
    Registro:Anos;
    NombreAnoConMasTempEn1Punto:String;
    AnoConMasTempPromedio,AnoConMasTemp:integer;
begin
    NombreAnoConMasTempEn1Punto:='';AnoConMasTemp:=0;
    AnoConMasTempPromedio:=0;
    CargoVector(Registro);
    AnalizoDatos(Registro,AnoConMasTempPromedio,AnoConMasTemp,NombreAnoConMasTempEn1Punto);
    WriteLn('El año con mayor temperatura promedio registrada a nivel mundial es: ', (AnoConMasTempPromedio+1969));
    Write ('El año con la mayor temperatura registrada en un lugar especifico es: ', (AnoConMasTemp+1969),' en: ', NombreAnoConMasTempEn1Punto);
end.