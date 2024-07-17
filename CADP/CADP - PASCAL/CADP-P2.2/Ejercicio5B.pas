program Ejercicio5B;


function esDoble(numA,numB:integer):boolean;                //MODULO DEL PUNTO A
begin
  esDoble:=(numB=numA*2);
end;
    
var             
  pares, paresBdobleA,numA,numB:integer;
begin                                                      //PUNTO B
  pares:=0;paresBdobleA:=0;

  writeln('Ingrese un par de numeros: ');
  read(numA);read(numB);

  while((numA<>0) or (numB<>0)) do begin
    pares:=pares+1;
    
    if (esDoble(numA,numB))then
        paresBdobleA:=paresBdobleA+1;
        writeln('Ingrese un par de numeros: ');             //VUELVO A INGRESAR VALORES Y LEER XQ ES UN WHILE!!!
        read(numA);read(numB);
   end;

  writeln('Cantidad de pares leidos: ',pares);
  writeln('Pares donde numB es el doble de numA: ',paresBdobleA);
end.