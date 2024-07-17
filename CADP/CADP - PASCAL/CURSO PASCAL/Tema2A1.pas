program Tema2A1; 
var 
    edad:Integer;
begin
    writeLn('Ingrese su edad, por favor');
    ReadLn(edad);
    write('Usted tiene',edad); {edad}
end.

var
    numero1:Byte;
    numero2:Byte;
begin
  writeLn('Elija 1 numero del 0 al 10');
  readLn(numero1);
  WriteLn('Elija otro numero');
  readLn(numero2);
  write(numero1+numero2); {sumador}
end.

var
    letra1:Char;
    letra2:Char;
    letra3:Char;
begin
  writeLn('Elija una letra');
  readLn(letra1);
  WriteLn('Elija otra letra');
  readLn(letra2);
  WriteLn('Elija una letra mas');
  ReadLn(letra3);
  Write(letra3,letra2,letra1);  {muestra letras}

end.

var
  palabra1:String[20];
  palabra2:String[20];
  palabra3:String[20];
begin
  WriteLn('Ingrese una palabra');
  ReadLn(palabra1);
  WriteLn('Ingresar otra palabra');
  ReadLn(palabra2);
  WriteLn('Ingresar ultima palabra');
  ReadLn(palabra3);
  Write(palabra3:2,palabra2:2,palabra1); {palabras ordenadas}
end.

var
  num1:Real;
  num2:Real;
begin
  WriteLn('Ingrese un numero');
  ReadLn(num1);
  WriteLn('Ingrese otro numero');
  ReadLn(num2);
  Write(num1*num2); {multiplicador}
end.

