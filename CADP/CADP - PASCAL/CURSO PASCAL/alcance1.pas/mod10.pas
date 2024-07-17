program mod10;

function analizarLetra (letra: Char): Boolean;
begin
    if (letra >= 'a') and (letra <= 'z') then
        analizarLetra := true
    else
    if (letra >= 'A') and (letra <= 'Z') then
        analizarletra := false;
end;

procedure leer (var ok: Boolean) ;
var
    letra:char;
begin
    ok:= analizarLetra(letra);
    readln(letra);
    if (analizarLetra(letra)) then
        writeln('Se trata de una minuscula')
    else
        writeln('Se trata de una mayuscula');
end; { fin del procedure leer}

var
    ok : boolean;

begin { programa principal }

    leer(ok);
    if ok then
        writeln('Gracias, vuelva prontosss');
end.