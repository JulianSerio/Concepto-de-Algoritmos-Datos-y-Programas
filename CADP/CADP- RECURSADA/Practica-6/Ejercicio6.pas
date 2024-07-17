program Ejercicio6;
type
    rango = 1..7;    
    str = String[20];

    sonda = record
        nombre:str;
        duracion:Integer;
        costo:Real;
        costoManteni:Real;
        espectro:rango;
    end;

    lista = ^nodo;
    nodo = record
        elem:sonda;
        sig:lista;
    end;

    vContador = array [rango] of Integer;

procedure leoSonda (var s:sonda);
begin
    with s do begin
        WriteLn('Nombre');ReadLn(nombre); 
        WriteLn('Duracion: ');ReadLn(duracion);
        WriteLn('Costo: ');ReadLn(costo);
        WriteLn('Costo mantenimiento: ');ReadLn(costoManteni);
        WriteLn('Espectro electromagnetico: ');ReadLn(espectro);
    end;
end;

procedure inicializoVc (var v:vContador);
var
    i:Integer;
begin
    for i:= 1 to 7 do begin
        v[i]:=0;
    end;
end;

procedure informoVc (v:vContador);
var
    i:Integer;
begin
    for i:= 1 to 7 do begin
        WriteLn('El espectro ',i, ' tiene ',v[i], ' sondas');
    end;
end;

procedure cargoNodo (var pri,ult:lista; s:sonda);
var
	nuevo:lista;
begin
	new (nuevo); 
    nuevo^.elem:=s; 
    nuevo^.sig:=nil;

	if (pri = nil) then
		pri:=nuevo
	else 
		ult^.sig:= nuevo;
	ult:=nuevo;
end;

procedure cargoLista (L:lista);
var
    s:sonda;
    ult:lista;
begin
    repeat
        leoSonda(s);
        cargoNodo(L,ult,s);
    until (s.nombre = 'GAIA');
end;

procedure maximos (total:Real;nombre: str; var nombreMasCostosa:str; var max:Real);
begin
    if (total > max) then begin
        max:= total;
        nombreMasCostosa:= nombre;
    end;
end;

procedure imprimirVector (v:vContador);
var
    i:Integer;
begin
    for i:= 1 to 7 do begin
        WriteLn('El rango ',1, ' tuvo', v[i], ' estudios');
    end;
end;

procedure procesoLista1 (L:lista; var costoTC:Real; var cantTotalSondas, duracionTotal:Integer);
var
    nombreMasCostosa:str;
    totalCyCM,max:Real;
    vC:vContador;
begin
    inicializoVc(vC);
    max:=0;totalCyCM:=0;cantTotalSondas:=0;duracionTotal:=0;costoTC:=0;
    
    while (L<>nil) do begin
        totalCyCM:= L^.elem.costo + L^.elem.costoManteni; //a
        vC[L^.elem.espectro] := vC[L^.elem.espectro] + 1; //b
        maximos(totalCyCM,L^.elem.nombre,nombreMasCostosa,max); //a 

        cantTotalSondas:= cantTotalSondas + 1; //c y d
        duracionTotal:= duracionTotal + L^.elem.duracion; //c
        costoTC:= costoTC + L^.elem.costo;

        L:= L^.sig; 
    end;
    WriteLn('La sonda mas costosa es: ',nombreMasCostosa); //a
    informoVc(vC); //b
end;

procedure procesoLista2 (L:lista; costoTC:Real; duracionTotal,cantTotalSondas:Integer);
var
    cantSuperanDuracion:Integer;
    promedioDuracion,promedioCosto:real;
begin
    promedioDuracion:= duracionTotal / cantTotalSondas;
    promedioCosto:= costoTC / cantTotalSondas;
    cantSuperanDuracion:= 0;

    while (L <> nil) do begin
        if (L^.elem.duracion > promedioDuracion) then
            cantSuperanDuracion := cantSuperanDuracion + 1; //SUPERA DURACION
        
        if (L^.elem.costo > promedioCosto) then
            WriteLn('La sonda ',L^.elem.nombre, ' supera el costo de construccion promedio'); //d

        L:=L^.sig;
    end;
    writeln ('La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas: ', cantSuperanDuracion); 
    //c
    
end;

var
    L:lista;
    cantTotalSondas,duracionTotal:Integer;
    costoTC:Real;
begin
    L:=Nil;
    cargoLista(L);
    procesoLista1(L,costoTC,cantTotalSondas,duracionTotal);
    procesoLista2(L,costoTC,duracionTotal,cantTotalSondas);
end.