program Ejercicio7;

type
    centro = record
        nombreAbreviado:String;
        universidad:String;
        cantInvestigadores:Integer;
        cantBecarios:Integer;
    end;

procedure leer (var c:centro; var totalCentros:Integer);
begin
    WriteLn('Ingrese nombre de la universidad');
    ReadLn(c.universidad);
    WriteLn('Ingrese nombre abreviado del centro');
    ReadLn(c.nombreAbreviado);
    WriteLn('Ingrese cantidad de centros que posee la universidad');
    ReadLn(totalCentros);
    WriteLn('Ingrese cantidad de investigadores');
    ReadLn(c.cantInvestigadores);
    WriteLn('Ingrese cantidad de becarios');
    ReadLn(c.cantBecarios);
end;

procedure DosCentrosMenorBec (c:centro; var CentroConMenorCantBecarios1,CentroConMenorCantBecarios2:String);
var
    min1,
    min2:Integer;
begin
    min1:=9999;
    min2:=9999;

    if (c.cantBecarios < min1) then
    begin
        min2:=min1;
        min1:=c.cantBecarios;

        CentroConMenorCantBecarios2:= CentroConMenorCantBecarios1;
        CentroConMenorCantBecarios1:= c.nombreAbreviado;
    end
    else 
    if (c.cantBecarios < min2) then
    begin
        min2:= c.cantBecarios;
        CentroConMenorCantBecarios2:= c.nombreAbreviado;
    end;
end;

procedure UniMayorInvestigadores (c:centro; var UniMayorCantInvesigadores:String);
var
    max:Integer;
begin
    max:=0;

    if (c.cantInvestigadores > max) then
    begin
        max:= c.cantInvestigadores;
        UniMayorCantInvesigadores:= c.universidad;
    end;
end;

var
    c:centro;
    
    totalCentros:Integer;                 

    UniMayorCantInvesigadores,
    CentroConMenorCantBecarios1,           
    CentroConMenorCantBecarios2:String;

begin
    leer(c,totalCentros);
    while (c.cantInvestigadores <> 0) do begin
        DosCentrosMenorBec(c,CentroConMenorCantBecarios1,CentroConMenorCantBecarios2);
        UniMayorInvestigadores(c,UniMayorCantInvesigadores);
        WriteLn('La universidad ingresada posee ',totalCentros, ' centros de investigacion');
        leer(c,totalCentros);
    end;
    WriteLn('La universidad con mayor cantidad de investigadores en sus centros es: ',UniMayorCantInvesigadores);
    WriteLn('Los dos centros de investigacion con menor cantidad de becarios son: ',CentroConMenorCantBecarios1,' y ',CentroConMenorCantBecarios2 );
end.