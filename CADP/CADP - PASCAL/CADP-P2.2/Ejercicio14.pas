program Ejercicio14;

procedure leer (var Hsembradas,zona:Integer; var localidad:String);           //LEO DATOS
begin
    WriteLn('Ingrese localidad');
    ReadLn(localidad);
    WriteLn('Ingrese hectarias');
    ReadLn(Hsembradas);
    WriteLn('Ingrese tipo de zona');
    ReadLn(zona);
end;

function CalcularRendimiento(Hsembradas,tipo:integer;precioSoja:real):real;
var
    rendimiento : real;
begin
	tipo:= 1;
	case tipo of
   1: rendimiento := Hsembradas  * 6 *precioSoja;
   2: rendimiento := Hsembradas * 2.6*precioSoja;
   3: rendimiento := Hsembradas * 1.6*precioSoja; 
   else 
        write('No existe tal zona'); 
   end;
   CalcularRendimiento := rendimiento;
 end;


procedure maxYmin (var Hsembradas,zona:Integer; localidad:String; rendimiento:Real; var min, max: real; var localidadMinRendimiento,localidadMaxRendimiento:String);
begin
    if (rendimiento < min) then begin       //CALCULO MIN
        min:=rendimiento;
        localidadMinRendimiento:=localidad;
    end;
    if (rendimiento > max) then begin       //CALCULO MAX
        max:=rendimiento;
        localidadMaxRendimiento:=localidad;
    end;
end;

var                                        //VAR PPAL
    Hsembradas,
    tipoZona,
    camp3Feb,
    cantCampos:Integer;

    localidad,
    localidadMinRendimiento,
    localidadMaxRendimiento:String;

    rendimientoTotal,
    max,
    min,
    auxiliar:Real;

begin
    localidadMinRendimiento:='';
    localidadMaxRendimiento:='';
    rendimientoTotal:=0;
    camp3Feb:=0;
    max:=0;
    min:=9999;
    cantCampos:=0;

    repeat
        leer (Hsembradas,tipoZona,localidad);
        cantCampos:= cantCampos + 1;

        auxiliar:= CalcularRendimiento(Hsembradas,tipoZona,320);
        WriteLn('Este campo gana: $',auxiliar:2:2);

        if ((localidad = 'Tres de Febrero') and (auxiliar > 10000)) then
          camp3Feb:= camp3Feb + 1;

        maxYmin (Hsembradas,tipoZona,localidad,auxiliar,min,max,localidadMinRendimiento,localidadMaxRendimiento);
        rendimientoTotal:= rendimientoTotal + auxiliar;

    until ((Hsembradas = 900) and (localidad = 'Saladillo'));
   
    WriteLn('La localidad con mayor rendimiento economico es: ',localidadMaxRendimiento);
    WriteLn('La localidad con mayor rendimiento economico es: ',localidadMinRendimiento);
    WriteLn('La cantidad de campos en Tres de Febrero con rendimiento mayor a  10.000 son: ',camp3Feb);
    WriteLn('El rendimiento promedio es: ',rendimientoTotal);
    
end.