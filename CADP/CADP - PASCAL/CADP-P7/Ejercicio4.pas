program Ejercicio4;
const
    DF = 46;
type
    str = string [20];
    paciente = record 
        nombre:str;
        apellido:str;    
        pesoRegistrado:integer; //primer dia de cada semana de embarazo  
    end;

    vprimerdia = array [1..DF] of pesoRegistrado;
    
    lista = ^nodo;
    nodo = record
        elem:paciente;
        sig:lista;
    end;

//se dispone



var

begin
  
end.