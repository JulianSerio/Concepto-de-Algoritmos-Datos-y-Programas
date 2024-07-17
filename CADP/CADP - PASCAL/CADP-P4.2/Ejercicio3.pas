program Ejercicio3;
const
    dF= 200;
type
    dias=0..31;

    marzo=record
	    diaM:dias;
	    monto:real;
	    km:real;
end;

vtransporte= array [1..dF] of marzo;
vdias= array [dias] of integer;

procedure inicializar (var v:vdias);
var
	i:integer;
begin
	for i:= 1 to 31 do 
		v[i]:= 0;
end;

procedure leer (var v:marzo); //a
begin
	with v do begin
	    WriteLn ('Ingrese dia del mes donde se realizo el viaje: '); 
        readln (diaM);
	    writeln ('Ingrese el monto del dinero transportado: '); 
        readln (monto);
	    WriteLn ('Ingrese km recorridos: '); 
        readln (km);
	end;
end;

procedure cargar (var v:vtransporte;var dimL:integer);
var
	aux:marzo;
begin
	dimL:=0;
	leer (aux);
	while (aux.km <>0) and(dimL < dF) do begin
		dimL:= dimL + 1;
		v[dimL]:= aux;
		leer (aux);
	end;
end;

procedure totalParaPR (monto:real; var montoTotal:real); //b
begin
	montoTotal+= monto;
end;

procedure menosDin (reg:marzo; var min:marzo);
begin
if (reg.monto < min.monto) then 
	min:=reg;
end;

procedure cantViajes (diaM:dias ; var totaldias:vdias);
begin
	totaldias[diaM]:= totaldias[diaM] + 1;
end;

procedure imprimir (min:marzo);
begin
writeln ('DISTANCIA:= ',min.km:2:1);
writeln ('DIA DEL MES:= ',min.diaM);
writeln ();
end;

procedure imprimir2 (v:vdias);
var
	i:dias;
begin
for i:= 1 to 31 do
	if (v[i] <> 0) then writeln ('La cantidad de viajes realizados el dia ',i, ' es de: ',v[i]);
end;

procedure recorrer (v:vtransporte;dimL:integer);
var
	i:integer;
	montoTotal:real;
	min:marzo;
	totaldias:vdias;
begin
	min.diaM:=0;
	min.monto:= 32000;
	min.km:=0;
	inicializar (totalDias);
	for i:= 1 to dimL do begin
		totalParaPr (v[i].monto,montoTotal);
		menosDin (v[i],min);
		cantViajes (v[i].diaM, totalDias);
	end;
	writeln ('El monto promedio realizado es: ',montoTotal/DIML:2:1); //1
	writeln ('La distancia recorrida y el dia del mes en que se realizo el viaje que transporto menos dinero: ');
	imprimir (min); //2
	imprimir2 (totalDias); //3
end;


procedure eliminar (var v:vtransporte;var dimL:integer;var eliminadoPa:boolean); //b
var 
	i:integer;
begin
eliminadoPa:=false;
	for i:=1 to dimL - 1 do begin
		if (v[i].km = 100) then begin
			v[i]:= v[i+1];
			eliminadoPa:=true;	
			dimL:= dimL - 1;
		end;
	end;
end;
        //ppal
var
	v:vtransporte;
	dimL:integer;
	eliminadoPa:boolean;

begin
	eliminadoPa:=false;
	cargar (v,dimL); //A
	recorrer (v,dimL); //B
	eliminar (v,dimL, eliminadoPa); //C
	writeln ();
	if (eliminadoPa) then writeln ('Se han borrado todos los viajes cuya distancia sea = 100') else writeln ('No habia viajes cuyos km sean 100 para borrar');
end.