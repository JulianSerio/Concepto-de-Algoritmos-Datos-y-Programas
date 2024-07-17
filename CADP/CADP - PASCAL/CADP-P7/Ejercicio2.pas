program Ejercicio2;
type 
    rango = 1..6;
    
    vTabla = array [rango] of Real;

    str = string [20];

    cliente = record
        codigoCliente:Integer;
        DNI:Integer;
        apellido:str;
        nombre:str;
        codigoPoliza:rango;
        montoBasico:Real;
    end;

    lista = ^nodo;
    nodo = record
        elem:cliente;
        sig:lista;
    end;

procedure cargoDatos (var c:cliente);
begin
    with c do begin
        WriteLn('Ingrese codigo del cliente');
        ReadLn(codigoCliente);
        WriteLn('Ingrese DNI del cliente');
        ReadLn(DNI);
        WriteLn('Ingrese apellido del cliente');
        ReadLn(apellido);
        WriteLn('Ingrese nombre del cliente');
        ReadLn(nombre);
        WriteLn('Ingrese codigo de poliza');
        ReadLn(codigoPoliza);
        WriteLn('Ingrese monto basico mensual');
        ReadLn(montoBasico);
    end;
end;

procedure cargoVector (var v:vTabla);
var 
    i:Integer;
begin
    for i:=1 to 6 do begin
        Write ('Ingrese el monto extra que se le agruega al tipo de poliza ', i,' :');
        ReadLn(V[i]);
    end;
end;
  

procedure cargarNodo (var L:lista; c:cliente); //AGREGAR ADELANTE
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=c;
    aux^.sig:=L;
    L:=aux;
end;

procedure informoDatos (c:cliente);
begin
    WriteLn(c.DNI);
    WriteLn(c.apellido);  
    WriteLn(c.nombre);
end;

function cumpleDOSnueve (dni:Integer):Boolean;
var
    digito,
    cantNueve:Integer;
begin
    cantNueve:=0;
    while (DNI <> 0) do begin
        digito:= dni mod 10; 
        if (digito = 9) then 
            cantNueve:= cantNueve + 1;
        DNI:= DNI div 10;
    end;
    if (cantNueve >= 2) then begin
        cumpleDOSnueve:= True;
    end
    else 
        cumpleDOSnueve:=False;
    
end;

procedure DNIalMenosDOSnueve (DNI:Integer);
var
    c:cliente;
begin
    WriteLn('Ingrese DNI');
    ReadLn(DNI);

    if (cumpleDOSnueve(DNI)) then
        informoDatos(c)
    else
        WriteLn('No hay dos digitos 9 en el DNI');
end;

procedure eliminar (L:lista;codigoCliente:integer; var exito:Boolean);
var
    act,ant: lista;
begin
    exito:=False;
    act:=L;
    while ((act <> Nil) and (act^.elem.codigoCliente <> codigoCliente)) do begin
        ant:=act;
        act:=act^.sig;
    end; 
    if (act <> nil) then begin
        exito:=true;
        if (act = L) then 
            L:=L^.sig
        else
            ant^.sig:=act^.sig;
        Dispose(act);
    end;
end;

procedure pidocodigoAEliminar (var codigoCliente:integer);
begin
    WriteLn('Ingrese Codigo del cliente a eliminar');
    ReadLn(codigoCliente);
end;
 
procedure eliminarDeLista (var L:lista);
var
    codigoCliente:Integer;
    exito:Boolean;
begin
    pidocodigoAEliminar(codigoCliente);
    eliminar(L,codigoCliente,exito);
    if (exito) then
        WriteLn('Se encontro y se elimino con exito')
    else
        WriteLn('No se econtro por lo tanto no se elimino');
end;

var
    v:vTabla;
    c:cliente;
    L:lista;
begin
    L:=nil;
    repeat
        //cargoTabla(v)
        cargoDatos(c);
        cargarNodo(L,c);        
    until c.codigoCliente = 1122;
    cargoVector(v);
    eliminarDeLista(L);
    DNIalMenosDOSnueve(L^.elem.DNI);

end.

promedio := sumaElementos / cantidadElementos
porcentaje:= (sumaElementos * cantidadElemento) / 100

procedure digParesImpares(D:Integer; var par, impar : integer);
var
    dig: integer;
begin
    par:=0;
    impar:=0;
    while (D <> 0) do begin
        dig:= D mod 10;
        if((dig mod 2)= 0) then
            par := par + 1
        else
            impar:= impar + 1;
        D:= D DIV 10;
    end;
end;
