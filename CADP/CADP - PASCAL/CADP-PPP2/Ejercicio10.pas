program Ejercicio10;
const
    dimF = 20;
type 
    RangoCultivo = 1..dimF;
    empresa = record
        codigo:Integer;
        nombre:string;
        estatalOprivada:String;
        ciudad:String;
        Cultivo:Vcultivo;
        dimL:Integer;
    end;

    lista = ^nodo; 
    nodo = record   
        elem:empresa;
        sig:lista;
    end;

    rCultivo = record
        tipo:String;
        cantHectarias:Integer;
        cantMeses:Integer;
    end;

    Vcultivo = array [RangoCultivo] of rCultivo;

//////////////////// A) EMPRESAS ////////////////////////

procedure leoEmpresa (var e:empresa);
begin
    ReadLn(e.codigo);
    ReadLn(e.nombre);
    ReadLn(e.estatalOprivada);
    ReadLn(e.ciudad);
    cargoCultivos(e.Cultivo,e.dimL);
end;

procedure cargoNodo (var L:lista; e:empresa);
var
    aux:lista1;
begin
    New(aux);
    aux^.elem:=e;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoListaEmpresas (L:lista);
var
    e:empresa;
begin
    leoEmpresa(e);
    while (e.codigo <> -1) do begin
        cargoNodo(L,e);
        leoEmpresa(e);
    end;
end;

//////////////////////// A) Cultivos /////////////////////////////////
 
procedure leoCultivo (var c:rCultivo);
begin
    ReadLn(c.cantHectarias);
    if (c.cantHectarias <> 0) then begin
        ReadLn(c.tipo);
        ReadLn(c.cantMeses);
    end;
end;

procedure cargoCultivos (var v:Vcultivo; var dimL:Integer );
var
    c:rCultivo;
    i:Integer;
begin 
    ReadLn(dimL);
    for i:= 1 to dimL do begin
        leoCultivo(v[i]);
    end;
end;

/////////////////////////////////////////////////////////////////////

procedure procesoLista (L:lista); 

begin
    while (L <> nil) do begin
        if (L^.elem.ciudad = 'San Miguel del Monte') and (L^.elem.Cultivo = 'Trigo') and ((L^.elem.codigo mod 2)=0) then
            WriteLn(L^.elem.nombre);  
        
        
    end;

end;

var
    L1:lista1;
    
begin
    cargoListaEmpresas(L1);
 
end.
