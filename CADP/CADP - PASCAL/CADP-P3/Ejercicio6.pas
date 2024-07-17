program Ejercicio6;
type
  microprocesador=record
    marca:string;
    linea:string;
    cores:integer;
    velReloj:integer;
    tamTran:integer;
  end;
 
procedure leerMicro(var m:microprocesador);
 begin
   with m do begin
     write('Ingrese marca '); readln(marca);
     write('Ingrese linea ');readln(linea);
     write('Ingrese cantidad de cores');readln(cores);
     if (cores<>0)then begin
       write('Ingrese velocidad del reloj'); readln(velReloj);
       write('Ingrese tamano de transitores');readln(tamTran);
      end;
    end;
 end;
 
procedure mayorTran(tran:integer;marca:string; var max1,max2:integer;var nom1,nom2:string);
begin
  if (tran>max1)then begin
    max2:=max1;
    max1:=tran;
    nom2:=nom1;
    nom1:=marca;
   end
  else
   if (tran>max2)then begin
     max2:=tran;
     nom2:=marca;
   end;
end;
procedure Evaluar(m:microprocesador;var catorce:integer);
 begin
   if ((m.cores >2) and (m.tamTran>=22)) then
     writeln(m.marca,', ',m.linea,' tiene mas de 2 cores y transitores de a lo sumo 22 nm.');
   if (m.tamTran=14)then
     catorce:=catorce+1;
 end;

function multi2Ghz (cores,velocidad:integer): boolean;
 begin
  multi2Ghz:= ((cores>1) and (velocidad>=2));
 end;
 
var
  micro:microprocesador;
  max1,max2,cant,transitores14:integer;
  nom1,nom2,auxMarca:string;
begin
  max1:=0;
  cant:=0;
  nom1:=' ';
  leerMicro(micro);
  while (micro.cores<>0) do begin
    auxMarca:=micro.marca;
    transitores14:=0;
    while (auxMarca=micro.marca)do begin
      Evaluar(micro, transitores14);
      if ((micro.marca='Intel')or(micro.marca='AMD'))then
        if(multi2Ghz(micro.cores,micro.velReloj))then
        cant:=cant+1;
      leerMicro(micro);
     end;
    mayorTran(transitores14,auxMarca,max1,max2,nom1,nom2);
   end;
  writeln('La cantidad de procesadores multicore de Intel o AMD, con al menos 2ghz es de: ',cant);
  writeln('La marca con mas procesadores de 14 nm es ',nom1,' con ',max1,' procesadores.');
  writeln('La segunda marca con mas procesadores de 14 nm es ',nom2,' con ',max2,' procesadores.');
end.