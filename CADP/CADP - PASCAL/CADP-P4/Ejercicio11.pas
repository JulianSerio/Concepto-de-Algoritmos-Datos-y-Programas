program Ejercicio11;
const 
    dF = 200;
type
    fotos = record 
        titulo:String;
        autor:String;
        cantMG:Integer;
        cantClicks:Integer;
        cantComentarios:Integer;
    end;
    
    fotosPubli = array [1..dF] of fotos;

procedure CargoVector (var v:fotosPubli);
var 
    i:Integer;
begin
    for i:= 1 to dF do begin
        WriteLn('Ingrese titulo de la foto');
        ReadLn(v[i].titulo);
        WriteLn('Ingrese autor de la foto');
        ReadLn(v[i].autor);
        WriteLn('Ingrese cantidad de Me Gustas de la foto');
        ReadLn(v[i].cantMG);
        WriteLn('Ingrese cantidad de Clicks');
        ReadLn(v[i].cantClicks);
        WriteLn('Ingrese cantidad de comentarios');
        ReadLn(v[i].cantComentarios);
    end;
end;

procedure titulomasVista (v:fotosPubli);
var 
    i,max:Integer;
    fotoMasVista:String;
begin
    max:=-1;
    for i:=1 to dF do begin
        if (v[i].cantClicks > max) then begin
            max:= v[i].cantClicks;
            fotoMasVista:=v[i].titulo;
        end;
    end;
    WriteLn('La foto mas vista es: ',fotoMasVista);
end;

procedure totalMeGustas (v:fotosPubli);
var
    i,SumaMeGustas:Integer;
begin
    SumaMeGustas:=0;

    for i:=1 to dF do begin
        if (v[i].autor = 'Art Vandelay' ) then begin 
            SumaMeGustas:= SumaMeGustas + v[i].cantMG;
        end;
    end;
    WriteLn('La cantidad total de me gustas en las fotos de Art Vandelay son: ',SumaMeGustas);
end;

procedure cantComentariosFoto (v:fotosPubli);
var
    i:Integer;
    fotoActual:String;
    totalComentarios:Integer;
begin
    fotoActual:='';

    for i:=1 to dF do begin
        fotoActual:=v[i].titulo;
        totalComentarios:=0;
        while (v[i].titulo = fotoActual) do begin
            totalComentarios:= totalComentarios +  v[i].cantComentarios;
        end;
        WriteLn ('La cantidad de comentarios en esta foto fueron de: ',totalComentarios);
    end;
end;

var
    v:fotosPubli;
begin
    CargoVector(v);
    titulomasVista(v);
    cantComentariosFoto(v);
end.