program Ejercicio14;

type    
    rangoTransporte = 1..5;
    rangoCodAlu = 1..1300;
    str = String[20];

    viaje = record
        codAlu:rangoCodAlu;
        diaMes:Integer;
        facultad:str;
        medioTransporte:rangoTransporte;
    end;

    lista = ^nodo;
    nodo = record
        elem:viaje;
        sig:lista;
    end;

    vAlumnos = array [rangoCodAlu] of lista; // vector de viajes 
    vTabla = array [rangoTransporte] of Real; // se dispone
    vContador = array [rangoTransporte] of Integer; //contar transportes 

procedure leoViaje (var v:viaje);
begin
    with v do begin
        WriteLn('Codigo de alumno: ');ReadLn(codAlu);
        if (codAlu <> -1) then begin
            WriteLn('Dia del mes: ');ReadLn(diaMes);
            WriteLn('Facultad: ');ReadLn(facultad);
            WriteLn('Medio de Transporte: ');ReadLn(medioTransporte);
        end;
    end;
end;

procedure insertarOrdenado(var L:lista; v:rViaje);
var
	nuevo,ant,act:lista;
begin
	new(nuevo); nuevo^.viaje:=v;
	ant:=L; act:=L;
	while (act<>nil) and (act^.viaje.dia < v.dia) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if ant=act then
		L:=nuevo
	else
		ant^.sig:=nuevo;
	nuevo^.sig:=act;
end;

procedure cargoLista (var L:lista);
var     
    v:viaje;
begin
    leoViaje(v);
    while (v.codAlu <> -1) do begin
        insertarOrdenado(L,v);
        leoViaje(v);
    end;
end;

procedure inicializoListas (var v:vAlumnos);
var
    i:integer;
begin
    for i:= 1 to 1300 do begin
        v[i]:= nil;
    end;
end;

procedure inicializoVector (var v:vContador);
var 
    i:Integer;
begin
    for i:= 1 to 5 do begin
        v[i]:=0;
    end;
end;

procedure procesoLista (vL:vAlumnos); 
var
    cantAluMasOchenta,diaActual:Integer
    vC:vContador;
begin
    cantAluMasOchenta:= 0;
    for i:= 1 to 1300 do begin
        while (L <> nil) do begin
            vC[L^.elem.medioTransporte] := vC[L^.elem.medioTransporte] + 1; //C
            diaActual:= v[i];
            while (L <> nil) and (diaActual = ) do
                    

            L:= L^.sig;
        end;
    end;
end;

var
    vL:vAlumnos;
begin
  
end.