program Ejercicio1;
type 
    rango = 1..5; 
    str = String [20];
    persona = record
        DNI:Integer;
        apellido:str;
        nombre:str;
        edad:Integer;
        codigo:rango; //1 drama, 2 romantico, 3 accion, 4 suspenso, 5 terror
    end;
    
    varray = array [rango] of Integer;

    lista = ^nodo;
    nodo = record
        elem:persona;
        sig:lista;
    end;

procedure leerInfo (var p:persona);
begin
    with p do begin 
        WriteLn('Ingrese DNI del sujeto');ReadLn(DNI);
        WriteLn('Ingrese apellido de la persona');ReadLn(apellido);
        WriteLn('Ingrese nombre de la persona');ReadLn(nombre);
        WriteLn('Ingrese edad de la persona');ReadLn(edad);
        WriteLn('Ingrese codigo de genero');ReadLn(codigo);
    end;
end;

procedure inicializoVector (var v:varray);
var
    i:Integer;
begin
    for i:=1 to 5 do begin
        v[i]:=0;
    end;
end;
procedure armarNodo(var L:lista;p:persona);
var
    nuevo:lista;
begin
    New(nuevo);
    nuevo^.elem:=p;
    nuevo^.sig:=L;
    L:=nuevo;
end;

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

procedure masParesqueImpares (D:Integer;par, impar:integer; var totalDNI: Integer);
begin
    totalDNI:=0;
    digParesImpares(D,par,impar);
    if (par > impar) then begin
        totalDNI:= totalDNI + 1;
    end;
end;

procedure cantGeneros (c:rango; var v:varray);
begin
    v[c]:= v[c] + 1;
end;

procedure dosGeneros (v:varray; var codigo1,codigo2:rango);
var
    i:Integer;
begin
    codigo1:=1;
    for i:=1 to 5 do begin
        if (v[i] < v[i+1]) then begin
            codigo2:=codigo1;
            codigo1:=i;
        end
        else begin
            codigo2:=codigo1;
            codigo1:=i;
        end;
    end;
end;

procedure informar (L:lista);
var
    codigo1,codigo2:rango;
    v:varray;
    par,impar,totalDNI:Integer;
begin
    totalDNI:=0;
    while (L <> Nil) do begin
        digParesImpares(L^.elem.DNI,par,impar);
        cantGeneros(L^.elem.codigo,v);
        masParesqueImpares(L^.elem.DNI,par,impar,totalDNI);
        L:=L^.sig;
    end;
    dosGeneros(v,codigo1,codigo2);
    WriteLn('la cantidad de personas cuyo DNI contiene más dígitos pares que impares es: ',totalDNI); //A
    WriteLn('los dos códigos de género más elegidos fueron: ',codigo1, ' y ', codigo2); //B
end;

procedure eliminar (L:lista;D:Integer; var exito:Boolean);
var
    act,ant: lista;
begin
    exito:=False;
    act:=L;
    while ((act <> Nil) and (act^.elem.DNI <> D)) do begin
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

procedure pidoPersonaAEliminar (var DNI:integer);
begin
    WriteLn('Ingrese DNI a eliminar');
    ReadLn(DNI);
end;
 
procedure eliminarDeLista (var L:lista);
var
    DNI:Integer;
    exito:Boolean;
begin
    pidoPersonaAEliminar(DNI);
    eliminar(L,DNI,exito);
    if (exito) then
        WriteLn('Se encontro y se elimino con exito')
    else
        WriteLn('No se encontro por lo tanto no se elimino');
    L:= L^.sig;
end;

var
    p:persona;
    Pi:lista;
begin
    Pi:=Nil;
    repeat
        leerInfo(p);
        armarNodo(Pi,p);
    until p.DNI = 33555444;
    informar(Pi);
    eliminarDeLista(Pi);


    
end.