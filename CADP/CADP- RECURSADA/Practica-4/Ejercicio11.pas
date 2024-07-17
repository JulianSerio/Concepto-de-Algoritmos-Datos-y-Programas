program Ejercicio11;
const
    dimF = 200;
type 
    str = string[20];

    foto = record
        titulo:str;
        autor:str;
        cantMG:Integer;
        cantClic:Integer;
        cantComentarios:Integer;
    end;

    vFotos = array [1..dimF] of foto;

procedure leoFoto (var f:foto);
begin
    with f do begin
        Write('Titulo: ');Read(titulo);
        Write('Autor: ');Read(autor);
        Write('Cantidad MG: ');Read(cantMG);
        Write('Cantidad clics: ');Read(cantClic);
        Write('Cantidad de comentarios: ');Read(cantComentarios);
    end;
end;

procedure cargoVector (var v:vFotos);
var
    i:Integer;
begin
    for i:= 1 to dimF do begin
        leoFoto(v[i]);
    end;
end;

procedure maximos (cantClics:Integer; titulo:str ; var max:Integer; var titMasVista:str);
begin
    if (cantClics > max) then begin
        max:= cantClics;
        titMasVista:= titulo;
    end;
end;

procedure ArtVandalay (autor:str; cantidadMeGustas:Integer; var cantMG:Integer);
begin
    if (autor = 'Art Vamdelay') then
      cantMG:= cantMG + cantidadMeGustas
end;

var
    v:vFotos;
    titMasVista:str;
    max,i,cantMG:integer;
begin
    max:=-1;
    cantMG:=0;
    cargoVector(v);
    for i:= 1 to dimF do begin
        maximos(v[i].cantClic,v[i].titulo,max,titMasVista);
        ArtVandalay(v[i].autor,v[i].cantMG,cantMG);
        WriteLn('La cantidad de comentarios en esta foto es: ',v[i].cantComentarios);
    end;
  
end.