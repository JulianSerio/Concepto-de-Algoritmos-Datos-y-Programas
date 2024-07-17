program Ejercicio8;

function analizarLetra (letra: Char): Boolean;
begin
    if (letra >= 'a') and (letra <= 'z') then
        analizarLetra := true
    else if (letra >= 'A') and (letra <= 'Z') then
        begin
            analizarLetra := false;
        end
        else 
            analizarLetra:= false 
end;

procedure leer (var ok: Boolean) ;
var
    letra:char;
begin
    readln(letra);
    ok:= analizarLetra(letra);
    if (ok) then
        writeln('Se trata de una minuscula')
    else
        writeln('Se trata de una mayuscula, digito o caracter');
end; { fin del procedure leer}

var
    ok : boolean;

begin { programa principal }

    leer(ok);
    if ok then
        writeln('Gracias, vuelva prontosss');
end.