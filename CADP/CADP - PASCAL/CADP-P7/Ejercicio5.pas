program Ejercicio5;
const
    DF = 100;
type 
                            //FALTA INICIALIZAR VECTOR
    anio = 2000..2021;
    str = string [20];

    viaje = record 
        codigoViaje:Integer;
        codigoCamion:Integer;
        distRecorida:Integer; //KM
        ciudadDestino:str;
        aniodelViaj:anio;
        DNI:Integer;
    end;

    camion = record
        patente:str;
        anioFabricacion:Integer;
        capacidadMax:Integer;   
        viajes:viaje;     
    end;

    vcamiones = array [1..DF] of camion;


procedure leoDatosCamion (var c:camion);
begin
    with c do begin
        WriteLn('Ingrese patente del camion');
        ReadLn(patente);
        WriteLn('Ingrese anio de fabricacion');
        ReadLn(anioFabricacion);
        WriteLn('Ingrese capacidad del camion');
        ReadLn(capacidadMax);
    end;
end;

procedure leoDatosViaje (var v:viaje);
begin
    with v do begin
        WriteLn('Ingrese codigo de viaje');
        ReadLn(codigoViaje);
        WriteLn('Ingrese codigo de camion');
        ReadLn(codigoCamion);
        WriteLn('Ingrese distancia recorrida');
        ReadLn(distRecorida);
        WriteLn('Ingrese ciudad de destino');
        ReadLn(ciudadDestino);
        WriteLn('Ingrese anio en el que se realizo el viaje');
        ReadLn(aniodelViaj);
        WriteLn('Ingrese DNI del conductor');
        ReadLn(DNI);
    end;
end;

procedure maximo (c:camion; patente:str);
var
    max:Integer;
begin
    max:=0;
    if (c.viajes.distRecorida > max) then begin 
        max:=c.viajes.distRecorida;
        patente:=c.patente;
    end;
   WriteLn('La patente que mas kilometros recorridos posee es: ',patente);
end;

procedure minimo (c:camion; patente:str);
var 
    min:Integer;
begin
    min:=9999;
    if (c.viajes.distRecorida < min) then begin
        min:= c.viajes.distRecorida;
        patente:=c.patente;
    end;
    WriteLn('La patente que menos kilometros recorridos posee es: ',patente);
end;

procedure informoMaxMin (c:camion);
var 
    patente:str;
begin
    patente:='';
    maximo(c,patente);
    minimo(c,patente);
end;

function cumpleMionca (c:camion):Boolean;
begin
    if ((c.anioFabricacion + 5) >= c.viajes.aniodelViaj) then
        cumpleMionca:=True
    else 
        cumpleMionca:=False
end;

procedure viajesCapacidadMasTreitaCinco (c:camion);
var
    cantCamiones:Integer;
begin
    cantCamiones:=0;
    if (c.capacidadMax > 30.5) and (cumpleMionca(c)) then begin
        cantCamiones:= cantCamiones + 1;
    end;
end;

procedure descomponer (c:camion; var codigo:Integer);
var
    dig:Integer;
    numero:Integer;
    sumaPares,digImpares:Integer;
begin
    codigo:=0;
    sumaPares:=0;digImpares:=0;dig:=0;
    numero:= c.viajes.DNI;
    while (c.viajes.codigoViaje <> -1) do begin
        while (numero<>0) do begin   
            dig:=numero MOD 10;
            if (dig MOD 2 =0)then
                sumaPares:=sumaPares + dig
            else
                digImpares:=digImpares+1; //SUPONGO QUE LOS DNI SE COMPONEN DE 4 CARACTERES 
            numero:= numero DIV 10;
        end;
    end;
    if (digImpares = 4) then
        codigo:= c.viajes.codigoViaje;
    WriteLn('El DNI que se ingreso esta compuesto por digitos impares, el codigo del viaje es: ',codigo);
end;

var
    v:viaje;
    c:camion;
    codigoViaje:Integer;
begin  
    //leoDatosCamion(c) se dispone
    leoDatosViaje(v);
    while (v.codigoViaje <> -1) do begin
        viajesCapacidadMasTreitaCinco(c); //B
        descomponer(c,codigoViaje);
        //leoDatosCamion(c) se dispone
        leoDatosViaje(v);
    end;
    informoMaxMin(c); //A
end.