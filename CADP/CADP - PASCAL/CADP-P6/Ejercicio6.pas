program Ejercicio6;

type
    espectro = 1..7;

    vrango = array [espectro] of integer;

    tsonda=record
	    nombre:string;
	    duracion:integer;
	    costoC:real;
	    costoMM:real;
	    rango:espectro;
    end;

    lista= ^nodo;

    nodo=record
	    dato:tsonda;
	    sig:lista;
end;

procedure inicializar (var v:vrango); //INICIALIZO VECTORES
var
	i:espectro;
begin
	for i:= 1 to 7 do begin
		v[i]:=0;
	end;
end;

procedure leer (var t:tsonda);  //LEO DATOS
begin
	with t do begin
		write ('Ingrese nombre de la sonda: '); readln (nombre);
		write ('Ingrese duracion en meses: '); readln (duracion);
		write ('Ingrese costo de construccion: '); readln (costoC);
		write ('Ingrese costo de mantenimiento mensual: '); readln (costoMM);
		write ('Ingrese rango del espectro electromagnetico: '); readln (rango);
	end;
end;

procedure agregarAtras (var pri,ult:lista; p:tsonda); 
var
	nuevo:lista;
begin
	new (nuevo); nuevo^.dato:=p; nuevo^.sig:=nil;
	if (pri = nil) then
		pri:=nuevo
	else 
		ult^.sig:= nuevo;
	ult:=nuevo;
end;

procedure cargarLista (var pri,ult:lista);
var
	p:tsonda;
begin
	repeat
		leer (p);
		agregarAtras (pri,ult,p);
	until (p.nombre = 'GAIA');
end;

//a
procedure max (costoTotal:real; nombre:string; var maxCosto:real; var maxNombre:string);
begin
	if (costoTotal > maxCosto) then begin
		maxCosto:= costoTotal;
		maxNombre:= nombre;
	end;
end;

//b
procedure cantidadSondas (var v:vrango; espectro:integer);
begin
	v[espectro]:= v[espectro] + 1;
end;

procedure imprimirVector (v:vrango);
var
	i:espectro;
begin
	for i:= 1 to 7 do begin
		writeln ('El rango ',i,' tuvo ', v[i] , ' estudios.');
		writeln ();
	end;
end; 

//c
procedure superaDuracion (promedioTotal:real;duracionSonda:integer; var cantSuperaDuracion:integer);
begin
	if (duracionSonda > promedioTotal) then
		cantSuperaDuracion:= cantSuperaDuracion + 1;
end;

//d

procedure superaConstruccion (dato:tsonda; promedioCosto:real);
begin
	if (dato.costoC > promedioCosto) then
		writeln ('---> La sonda ',dato.nombre,' supera el costo de construccion promedio.');
end;

procedure recorrerLista2 (pri:lista;costoTC:real;duracionTOTAL,cantidadTOTALsonda:integer; var cantSuperaDuracion:integer);
var
	promedioDuracion,promedioCosto:real;
begin
	promedioDuracion:= duracionTOTAL/cantidadTOTALsonda;
	promedioCosto:= costoTC/cantidadTOTALsonda;
	while (pri <> nil) do begin
		superaDuracion (promedioDuracion,pri^.dato.duracion, cantSuperaDuracion);
		superaConstruccion (pri^.dato,promedioCosto);
		pri:= pri^.sig
	end;
end;

procedure recorrerLista1 (pri:lista; var v:vrango; var maxCosto,costoTC:real; var maxNombre:string; var cantidadTOTALsonda,duracionTOTAL:longint);
var
costoTotal:real;
begin
	while (pri <> nil) do begin
		costoTOTAL:= 0;
		costoTOTAL:= pri^.dato.costoC + pri^.dato.costoMM;
		max (costoTotal,pri^.dato.nombre,maxCosto,maxNombre); //a
		cantidadSondas (v,pri^.dato.rango); //b
		cantidadTOTALsonda:= cantidadTOTALsonda + 1; //contador para C Y D
		duracionTOTAL:= duracionTOTAL + pri^.dato.duracion; //c
		costoTC:= costoTC + pri^.dato.costoC; //d
		pri:= pri^.sig
	end;
end;

var
    pri,ult:lista;
    maxCosto,costoTC:real;
    maxNombre:string;
    v:vrango;
    cantidadTOTALsonda,duracionTOTAL:longint;
    cantSuperaDuracion:integer;

begin
    maxCosto:= -1;
    maxNombre:= '';
    cantidadTOTALsonda:= 0;
    duracionTOTAL:=0;
    costoTC:=0;
    cantSuperaDuracion:=0;
    pri:=nil; //creo lista
    inicializar (v);
    cargarLista (pri,ult); //cargo lista
    recorrerLista1 (pri,v,maxCosto,costoTC,maxNombre,cantidadTOTALsonda,duracionTOTAL); //recorro lista
    writeln ('La sonda mas costosa es: ',maxNombre);    
    imprimirVector (v); //b
    recorrerLista2 (pri,costoTC,duracionTOTAL,cantidadTOTALsonda,cantSuperaDuracion); //C Y D
    writeln ('La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas: ',cantSuperaDuracion);
end.