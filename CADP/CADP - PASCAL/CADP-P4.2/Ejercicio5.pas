program Ejercicio5;
const
    DF = 500;
type    
    categoria = 'A'..'F'; 
    codigoCiudad = 1..2400;

    cliente = record 
        fechaFirma:String;
        cateMonotributo:categoria;
        codCiudad:codigoCiudad;
        montoMensual:Integer;
    end;

    datoCliente = array [1..DF] of cliente;

procedure leerVector (var v:datoCliente);
begin
    WriteLn('Ingrese fecha de firma del contrato');
    ReadLn(v)



end;

var

begin
  
end.