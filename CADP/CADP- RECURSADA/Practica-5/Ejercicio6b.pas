program Ejercicio6b;

Type 
Nombre = String[50];
Puntero = ^Nombre;
ArrPunteros = array[1..2500] of Puntero;

procedure memoria (var a:ArrPunteros);
var
    i:Integer;
begin
    for i:= 1 to 2500 do begin
        New(a[i]);
    end;
end;

procedure cargoNom (var a:ArrPunteros);
var
    i:Integer;
begin
    for i:= 1 to 2500 do begin
        Read(a[i]^);
    end;
end;

Var
Punteros: ArrPunteros;
begin
    WriteLn(SizeOf(Punteros));  
    cargoNom(Punteros); 
    memoria(Puntero);
    WriteLn(SizeOf(Puntero));
end.

// 6)a)  127500 bytes 
// 6)b) a) 10.000 bytes 
//      b) por cada elemento del array tengo cargado hastas 51 bytes, en 
//      dinamica el array ocupa 10.000 bytes y despues de ejecutar el modulo 
//      la cantiadad de memoria reservada es 4 bytes en memoria estatica 
//      c) cargoNom(puntero)

