program Ejercicio8;

var
    L1,L2,L3:Char;
begin
    WriteLn('Ingrese las 3 letras');
    ReadLn(L1);
    ReadLn(L2);
    ReadLn(L3);
    if (((L1 = 'a') or (L1 = 'e') or (L1 = 'i') or (L1 = 'o') or (L1 ='u')) and ((L2 = 'a') or (L2 = 'e') or (L2 = 'i') or (L2 = 'o') or (L2 ='u')) and ((L3 = 'a') or (L3 = 'e') or (L3 = 'i') or (L3 = 'o') or (L3 ='u'))) then
        writeln('Las tres son vocales: ', L1,' ', L2,' ', L3)
    else 
        writeln('Alguna no es vocal: ', L1,' ', L2,' ', L3);
end.