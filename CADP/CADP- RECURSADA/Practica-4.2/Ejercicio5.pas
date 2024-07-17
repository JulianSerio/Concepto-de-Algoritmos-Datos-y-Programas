program Ejercicio5;
const
    dimF = 500;

type    
    rangoCod = 1..2400; 
    rangoCat = 'A'..'F';
    
    fecha = record
        dia:Integer;
        mes:Integer;
        anio:Integer;
    end;
    
    cliente = record
        fechaFirmaContrato:fecha;
        tipoMonotributo:char;
        codCiudad:rangoCod;
        montoMensual:Real; 
    end;

    vClientes = array [1..dimF] of cliente;
    vCcodigo = array [rangoCod] of Integer;
    vCmonotri = array [rangoCat] of Char;

procedure leoCliente (var c:cliente);
begin
    with c do begin
        Write('Dia: ');Read(fechaFirmaContrato.dia);
        Write('Mes: ');Read(fechaFirmaContrato.mes);
        Write('Anio: ');Read(fechaFirmaContrato.anio);
        Write('Tipo de Monotributo: ');Read(tipoMonotributo);
        Write('Codigo de ciudad: ');Read(codCiudad);
        Write('Monto Mensual: ');Read(montoMensual);
    end;
end;

procedure cargoVector (var v:vClientes);
begin
    for i:= 1 to dinF do begin
       leoCliente(v[i]); 
    end;
end;

procedure inicializoVcCod (var vC:vCcodigo);
var
    i:Integer;
begin
    for i:= 1 to 2400 do begin
        vC[i]:=0;
    end;
end;
procedure inicializoVcCat (var vC:vCmonotri);
var
    i:Integer;
begin
    for i:= 'A' to 'F' do begin
        vC[i]:=0;
    end;
end;

procedure procesoInforamacion (v:vClientes);
var
    vCmono:vCmonotri;
    vCcod:vCcodigo;

begin
    for i:= 1 to 500 do begin
        vCmono[v[i].codCiudad] := vCmono[v[i].codCiudad] + 1;
    end;
end;

var
    v:vClientes;

begin
    cargoVector(v);
end.