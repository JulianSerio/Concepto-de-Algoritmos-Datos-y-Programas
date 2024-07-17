program Ejercicio8;

var
    letra1,letra2,letra3:Char;
    cantVocales:Integer;
begin
    WriteLn('Ingrese primer letra');
    ReadLn(letra1);
    WriteLn('Ingrese segunda letra');
    ReadLn(letra2);
    WriteLn('Ingrese tercer letra');
    ReadLn(letra3);
    if (letra1 = 'a') or (letra1= 'e') or (letra1= 'i') or (letra1= 'o') or (letra1= 'u') then
        cantVocales:= cantVocales + 1;
    if (letra2= 'a') or (letra2= 'e') or (letra2= 'i') or (letra2= 'o') or (letra2= 'u') then
        cantVocales:= cantVocales + 1;
    if (letra3= 'a') or (letra3= 'e') or (letra3= 'i') or (letra3= 'o') or (letra3= 'u') then
        cantVocales:= cantVocales + 1; 
    if (cantVocales > 1) then
        if (cantVocales = 3) then
        begin
            WriteLn('Las tres letras ingresadas son vocales');
        end
    else
        WriteLn('Al menos una letra no era vocal');
    if (cantVocales = 0) then
        WriteLn('Ninguna de las letras ingresadas es vocal');
end.