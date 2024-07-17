program Ejercicio5;
type 
	str = string [50];
    lista = ^nodo;
    producto = record
        codigo:Integer;
        descripcion:str;
        stockActual:Integer;
        stockMinimo:Integer;
        precio:Real;
    end;
    nodo = record 
        elem:producto;
        sig:lista;
    end;

procedure leerProducto(var prod : producto); 
begin
	with prod do
	begin
		write('Ingrese el codigo del producto : ');readln(codigo);
		if(codigo <> -1)then
		begin
			write('Ingrese la descripcion del producto : ');readln(descripcion);
			write('Ingrese el stockActual del producto : ');readln(stockActual);
			write('Ingrese el stockMinimo del producto : ');readln(stockMinimo);
			write('Ingrese el precio del producto : ');readln(precio);
		end;
	end;
end;

procedure crear(var Pi : lista); 
var
aux : lista;
prod : producto;
begin
	leerProducto(prod);
	while (prod.codigo<> -1) do begin
		new(aux);
		aux^.elem := prod;
		aux^.sig := Pi;
		Pi := aux;
	end;
end;

procedure PromstockMin (L:lista);
var
	counter:Real;
	total:Integer;
begin
	counter:=0;
	total:=0;
	while (L <> Nil) do begin
		if (L^.elem.stockActual < L^.elem.stockMinimo) then
			counter:= counter + 1;
		total:= total + 1;
	end;
	if (total <> 0) then
		counter:= (100 * counter) / total
	else 
		counter:=0;
	L:=L^.sig;
	WriteLn('El porcentaje de productos con stock actual por debajo de su minimo es: ', counter)
end;


function digitosPares (L:lista):Boolean;
var
	dig,aux:Integer;
	cantPares:Integer;
	cumple:Boolean;
begin
	cantPares:=0;
	cumple:=False;
	while ((L <> nil) and (aux <> 0)) do begin
		dig:= aux mod 10;
		aux:=L^.elem.codigo;
		if (dig mod 2 = 0) then begin
			cantPares:=cantPares + 1;
			if (cantPares >= 3) then begin
				cumple:=True;
			end;
		end;
		aux:= (aux div 10);
	end;
	L:=L^.sig;
	digitosPares:= cumple;
end;

procedure muestroDescripcion (L:lista);
begin
	if (digitosPares(L) = True) then begin
		WriteLn(L^.elem.descripcion);
	end;

end; 


procedure prodEconomicos (L:lista);
var
	min1,
	min2:Real;
	codigoMasBarato1,
	codigoMasBarato2:Integer;
begin
	min1:=9999;
	min2:=9999;
	codigoMasBarato1:=0;
	codigoMasBarato2:=0;
	while (L <> nil) do begin
		if (L^.elem.precio < min1) then begin
			min2:=min1;
			min1:=L^.elem.precio;

			codigoMasBarato2:=codigoMasBarato1;
			codigoMasBarato1:=L^.elem.codigo;			
		end;
		if (L^.elem.precio < min2) then begin 
			min2:=L^.elem.precio;
			codigoMasBarato2:=L^.elem.codigo; 
		end;
		L:=L^.sig;
	end;
	WriteLn('El codigo mas de los 2 productos mas baratos son: 'codigoMasBarato1, ' y ', codigoMasBarato2);
end;

var
    Pi:lista;
begin
	Pi:=nil;
    crear(Pi);
	PromstockMin(Pi);
	writeln(digitosPares(Pi));
	prodEconomicos(Pi);
end.