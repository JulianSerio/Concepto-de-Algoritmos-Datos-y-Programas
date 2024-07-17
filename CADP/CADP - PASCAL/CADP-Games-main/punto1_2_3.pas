program punto1_2_3;

type
  TDatos = record
          salario : integer;
          edad :  integer;
          DNI : string;
          legajo : integer;
        end;

procedure CADPleerDato(var d : TDatos; var ultimo : boolean);
   begin
      if not eof(myfile) then
      begin
	   readln(myfile,d.salario);
	   readln(myfile,d.edad);
	   readln(myfile,d.dni);
	   readln(myfile, d.legajo);
	   ultimo := eof(myfile);
	  end
      else begin
         d.salario := -1;
         ultimo := true;
      end;   
   end;

procedure empleadosTotales (d:TDatos);      //INFORMAR CANTIDAD TOTAL DE EMPLEADOS 
var 
    numeroEmpleadosTotales:Integer;
begin        
    numeroEmpleadosTotales:=cantEmpleados(d); //ASIGNO EL VALOR DE LA FUNTION 
    WriteLn('La cantidad total de empleados es: ', numeroEmpleadosTotales);
end;

function cantEmpleados (d:TDatos; var fin:Boolean):Integer;      //UTILIZAR EN OTROS MODULOS 
var
    totalEmpleados:Integer;
begin
    totalEmpleados:=0;                       //INICIALIZO VARIABLES 
    CADPVolverAlInicio(DatosGrupo);          //VUELVO AL INICIO Y LEO DATOS 
    CADPleerDato(d,fin);                 
    repeat
    begin                                   //MIENTRAS ULTIMO SEA NEGATIVO, SUMO EMPLEADOS                             
        totalEmpleados:=totalEmpleados + 1;
        CADPleerDato(d,fin);
    end;
        cantEmpleados:=totalEmpleados;    
    until (fin = True)   
end;

procedure salarioMenor300 (d:TDatos; var fin:Boolean);   
var
    empleadosTrecientos:Integer;                               
begin
    empleadosTrecientos:=0;
    CADPVolverAlInicio(DatosGrupo);
    CADPleerDato(d,fin);                             //LEO DATOS 
    repeat
    begin
        if (d.salario < 300) then                //SI EL SALARIO ES MENOR A 300 
        begin
            empleadosTrecientos:= empleadosTrecientos + 1;  //CONTABILIZO EMPLEADOS 
        end;
        CADPleerDato(d,fin);
    end;
    WriteLn('La cantidad total de empleados con sueldo menor a 300 U$D es: ',empleadosTrecientos);      //INFORMO
    until (fin = true)
end;


procedure promedioSalarios (d:TDatos; var fin:Boolean);
var
    salarioTotal,promedioGeneral:Integer;                       //VARIABLE SALARIOTOTAL SUMO TODOS LOS SALARIOS
begin
    salarioTotal:=0;              
    CADPVolverAlInicio(DatosGrupo);
    CADPleerDato(d,fin);
    repeat                             
    begin   
        salarioTotal:= salarioTotal + salario;              //SUMO TODOS LOS SALARIOS EN LA VARIABLE 
        CADPleerDato(d,fin);                    
    end;
    promedioGeneral:= (salarioTotal / cantEmpleados(d));      //DIVIDO EL SALARIO TOTAL POR LA CANTIDAD DE EMPLEADOS 
    WriteLn('El promedio de salarios es: ',promedioGeneral);        //PROMEDIO GENERAL 
    until (fin = true)
end;
    
var
begin
  

end.
