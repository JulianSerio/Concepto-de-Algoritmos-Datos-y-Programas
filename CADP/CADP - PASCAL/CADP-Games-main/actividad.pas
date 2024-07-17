{ programa que muestra como se trabaja con el archivo de datos }

program CADPGames;
   
{ la instruccion USES permite utilizar funcionalidad definida en otro archivo, en este caso
CADPDataLoader.pas. Dicho archivo incluye las instrucciones para trabajar con los archivos
de datos. }   
uses  
  CADPDataLoader;

const
   CONTINUAR = 1;

{ procedure de ejemplo que imprime un registro completo }
procedure imprimirDato(d : Tdatos);
begin
   writeln('Salario: ',d.salario, ' Edad: ',d.edad,' DNI: ',d.dni,' Legajo:',d.legajo);
end;

{ Procedure de ejemplo que solicita una instrucción por teclado }
procedure leerInstruccion(var num : integer);
begin
    writeln('-----------------------------------------------------------------');
    writeln('Ingrese 1 para procesar los datos desde el comienzo, o cualuier otro dígito para salir');
    readln(num);
    if (num <> CONTINUAR) then
		writeln('Ciao!!!')
	else
	    writeln('-----------------------------------------------------------------');

end;

var
  dato : Tdatos;
  fin : boolean;
  num : integer;
begin
    leerInstruccion(num);
    while (num = 1) do begin
		CADPVolverAlInicio('DatosGrupo');{ <<--- comienza la lectura de datos desde el principio, y nos asegura que se procesarán todos los datos. El parámetro indica el nombre del archivo a procesar }
		repeat
		  CADPleerDato(dato,fin);{ <<---- este modulo retorna un registro ya cargado en el parámetro dato, y un boolean en el parámetro fin, indicando si quedan mas datos por leer }
		  imprimirdato(dato);
		until(fin);
		CADPfinalizarLectura();{ <<---- una vez que se procesó todo el archivo, hay que cerrarlo correctamente }
		
		leerInstruccion(num);
    end;
    

end.
