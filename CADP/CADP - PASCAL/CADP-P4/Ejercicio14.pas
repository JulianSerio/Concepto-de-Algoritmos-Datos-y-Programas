program Ejercicio14;
const
    dimF=1000;
type
    Codigos=1 .. dimF;

    Roles=1 .. 5;

    Participante=record
        PaisDeResidencia:String[15];
        CodigoDeProyecto:Codigos;
        NombreDelProyecto:String;
        Rol:Roles;
        CantDeHorasTrabajadas:Integer;
    end;

    Participantes=Array [1 .. dimF] of Participante;

procedure CargoVector(var Programador:Participantes; var dimL:integer);
var
    i:integer;
    Codigo:Integer;
begin
    i:=0;
    //Me aseguro de que no se inicialice y no pida datos que no necesito en caso de que sea -1
    Write ('Ingrese el codigo del proyecto: ');
    ReadLn(Codigo);
    while ((Codigo<>-1) or (dimL<dimF)) do begin
        i:=i+1;
        dimL=dimL+1;
        Programador[i].CodigoDeProyecto=Codigo;
        Write ('Ingrese el Pais de residencia del programador: ');
        ReadLn(Programador[i].PaisDeResidencia);
        Write ('Ingrese el nombre del proyecto: ');
        ReadLn(Programador[i].NombreDelProyecto);
        Write ('Ingrese el rol que cumplio en el proyecto: ');
        ReadLn(Programador[i].Rol);
        Write ('Ingrese la cantidad de horas trabajadas: ');
        ReadLn(Programador[i].CantDeHorasTrabajadas);
        Write ('Ingrese el codigo del proyecto: ');
        ReadLn(Codigo);
    end;
end;

function AveriguoMonto(Programador:Participante):Real;
begin
    if (Programador[i].PaisDeResidencia='Argentina') then begin
        Case Programador[i].Rol of 
            1: AveriguoMonto:=Programador[i].CantDeHorasTrabajadas*35.20;
            2: AveriguoMonto:=Programador[i].CantDeHorasTrabajadas*27.45;
            3: AveriguoMonto:=Programador[i].CantDeHorasTrabajadas*31.03;
            4: AveriguoMonto:=Programador[i].CantDeHorasTrabajadas*44.28;
            5: AveriguoMonto:=Programador[i].CantDeHorasTrabajadas*39.87;
        end;
    end;
end;

procedure AnalizoVector (Programador:Participantes;dimL,CantHorasAdmBase,CodProyectoMenosInver:Integer;MontoTotalEnArg:Real);
var
    i,CantArqDeSoftXProyecto:integer;
    MenorMontoEnProyecto,AuxFuncion:Real;
begin
    MenorMontoEnProyecto:=9999;
    for i:=1 to dimL do begin
        AuxFuncion:=AveriguoMonto(Programador);
        CantArqDeSoftXProyecto:=0;
        MontoTotalEnArg:=MontoTotalEnArg+AuxFuncion;
        if (Programador[i].Rol=3) then begin
            CantHorasAdmBase:=CantHorasAdmBase+Programador[i].CantDeHorasTrabajadas;
        end;   
        if (MenorMonto<AuxFuncion) then begin
            MenorMonto:=AuxFuncion;
            CodProyectoMenosInver:=Programador[i].CodigoDeProyecto;
        end;
        if (Programador[i].Rol=4) then begin
            WriteLn ('La cantidad de arquitectos de software en el proyecto codigo: ',Programador[i].CodigoDeProyecto,' es de: 1.');
        end;
    end;
end;


var
    Programador:Participante;
    dimL,CantHorasAdmBase,CodProyectoMenosInver:integer;
    MontoTotalEnArg:Real;
begin   
    //inicializo mis variables
    dimL:=0;
    CantHorasAdmBase:=0;
    CodProyectoMenosInver:=0;
    MontoTotalEnArg:=0;
    CargoVector(Programador,dimL);
    AnalizoVector(Programador,dimL,CantHorasAdmBase,CodProyectoMenosInver,MontoTotalEnArg);
    WriteLn ('El monto total invertido en argentina es de: ',MontoTotalEnArg);
    WriteLn ('La cantidad de horas trabajadas por administradores de base de datos es de: ',CantHorasAdmBase);
    WriteLn ('El codigo del proyecto con menor monto invertido es: ',CodProyectoMenosInver);
end.