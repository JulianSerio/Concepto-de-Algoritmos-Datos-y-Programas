program Ejercicio2;

const 
    AnoActual = 2019;

type
    diax = 1..31;
    mesx= 1..12;
    casamientos = record
        dia:diax;
        mes:mesx;
        anio:integer;
end;

procedure casVerano (var c:casamientos; var cantVerano:Integer);
begin
    if ((c.mes = 1) or (c.mes = 2) or (c.mes = 3)) then begin
        cantVerano:= cantVerano + 1;
    end;
end;

procedure casPrimerosDias (var c:casamientos; var cantPrimerosDias:Integer);
begin
    if ((c.dia >= 1) and (c.dia <= 10)) then begin
        cantPrimerosDias:= cantPrimerosDias + 1;
    end;
end;

procedure leerCasamiento (var c:casamientos);
begin
    WriteLn('Ingrese dia del casamiento');
    ReadLn(c.dia);
    WriteLn('Ingrese mes del casamiento');
    ReadLn(c.mes);
    WriteLn('Ingrese anio del casamiento');
    ReadLn(c.anio);
end;
                            //CANTVARANO 2 CANTPRIMEROS DIAS 1 
var
    c:casamientos;
    cantVerano,cantPrimerosDias:Integer;
begin
    cantVerano:=0;
    cantPrimerosDias:=0;
    while (c.anio <> 2020) do begin                                                   
        leerCasamiento(c);
        casVerano(c,cantVerano);
        casPrimerosDias(c,cantPrimerosDias);
    end;
    WriteLn('La cantidad de casamientos realizados durante los meses de verano son: ',cantVerano);
    WriteLn('La cantidad de casamientos realizados durante los primeros dias del mes son: ',cantPrimerosDias);
end.