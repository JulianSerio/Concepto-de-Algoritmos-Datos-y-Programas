program Ejercicio2;
type    
    str = string[40];
    rangoPoliza = 1..6;
    
    cliente = record
        codCliente:Integer;
        DNI:Integer;
        apellido:str;
        nombre:str;
        codigoPoliza:rangoPoliza;
        montoAbonado:Real;
    end;

    lista = ^nodo;
    nodo = record   
        elem:cliente;
        sig:lista;
    end;

    vMontoAdd = array [rangoPoliza] of Real;

procedure leoCliente (var c:cliente);
begin
    with c do begin
        WriteLn('Codigo cliente:');ReadLn(codCliente);
        WriteLn('DNI: ');ReadLn(DNI);
        WriteLn('Apellido: ');ReadLn(apellido);
        WriteLn('Nombre: ');ReadLn(nombre);
        WriteLn('Codigo POliza: ');ReadLn(codigoPoliza);
    end;
end;

procedure cargoNodo (var L:lista; c:cliente);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:= c;
    aux^.sig:= L;
    L:= aux;
end;

procedure cargoLista (var L:lista);
var
    c:cliente;
begin
    repeat
        leoCliente(c);
        cargoNodo(L,c);
    until c.codCliente = 1122
end;

function cumple (DNI:Integer):Boolean;
var
    dig,counter:Integer;
begin
    counter:= 0;
    while (DNI <> 0) do begin
        dig:= DNI mod 10;
        if (dig = 9) then
            counter:= counter + 1;
        DNI:= DNI div 10;
    end;
    cumple:= (counter >= 2); //preguntar si es correcta esta sintaxis
end;    


procedure procesoLista (L:lista);
var
    v:vMontoAdd;
begin
    while (L <> nil) do begin
        //a
        WriteLn('El cliente ',L^.elem.apellido, ' ', L^.elem.nombre, ' con DNI ', L^.elem.DNI, ' paga: ',L^.elem.montoAbonado + v[L^.elem.codigoPoliza], ' por su seguro automotriz');
        //b
        if (cumple(L^.elem.DNI)) then
            WriteLn(L^.elem.apellido, ' ', L^.elem.nombre);
        L:= L^.sig;    
    end;
end;

function buscar (L:lista; cod:Integer):Boolean;
var
    encontre:Boolean;
begin
    encontre:= False;
    while (L <> nil) do begin
        if (cod = L^.elem.codCliente) then
            encontre:= true
        else
            L:= L^.sig;
        buscar:= encontre;
    end;
end;

procedure eliminar (var L:lista; codigo:Integer; var exito:Boolean);
var
    ant,act:lista;
begin
    exito:=False;
    act:=L;
    while (act <> nil) and (act^.elem.codCliente <> codigo) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act <> Nil) then begin
        exito:= True;
        if (act = L) then L:= act^.sig
                    else ant^.sig := act^.sig;
        dispose(act);
    end;
end;

var
    L:lista;
    codCliente:Integer;
    exito:Boolean;
begin
    L:= Nil;
    cargoLista(L);
    procesoLista(L);

    WriteLn('Ingrese codigo de cliente');ReadLn(codCliente);
    if (buscar) then begin
        eliminar(L,codCliente,exito);
        if (exito) then
            WriteLn('Se pudo borrar')
        else 
            WriteLn('No se pudo borrar');
    end
    else
        WriteLn('No se encontro el codigo del alumno');
    
end.