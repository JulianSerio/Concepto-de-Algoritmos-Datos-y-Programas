program Ejercicio8;


function analizarLetra : boolean;
begin
    if (letra >= 'a') and (letra <= 'z') then
        analizarLetra := true
    else
        if (letra >= 'A') and (letra <= 'Z') then
            analizarletra := false;
        { fin de la funcion analizarLetra }
end;

procedure leer;
var
    letra : char;
begin
    readln(letra);
    if (analizarLetra) then
        writeln('Se trata de una minúscula')
    else
        writeln('Se trata de una mayúscula');
end; { fin del procedure leer}

var
    ok : boolean;
begin { programa principal }
    leer;
    ok := analizarLetra;
    if ok then
        writeln('Gracias, vuelva prontosss');
end.

//a) i) el programa no puede acceder a la funtion
//   ii) Separando la funcion del proceso, agregando var letra a function, agregando var ok al proceso 
//   y ok:= analizoletra(letra)
//b) No cubre valores char en mayuscula, esto se arregla: function analizarletra(letra: char):boolean 