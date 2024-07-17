program Ejercicio9;

type

    RangoGenero = 1..8;    

    pelicula = record   
        codPel:Integer;         //  
        titulo:string;          //
        codGenero:RangoGenero;  //
        puntaje:Real;           //  SE DISPONE 
    end;                        //  SIN ORDEN 
                                //
    listaPeli = ^nodo;          //
    nodo = record               //
        elem:pelicula;          //
        sig:lista;              //
    end;                        //

    critica = record
        DNICritico:Integer;
        nombreyapellido:String;
        codPel:Integer;
        puntaje:Real;
    end;

    listaCritico = ^nodo2;
    nodo2 = record
        elem:critica;
        sig:listaCritico
    end;

    vContador = array [RangoGenero] of Integer;

//////////////////////////////////////////////////////////

procedure leoCritico (var c:critica);
begin
    ReadLn(c.codPel);
    if (c.codPel <> -1) then begin
        ReadLn(c.DNICritico);
        ReadLn(c.nombreyapellido);
        ReadLn(c.puntaje);
    end;
end;

procedure cargoNodo (var L:listaCritico; c:critica);
var
    aux:listaCritico;
begin
    New(aux);
    aux^.elem:=c;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoListaCriticos (L:listaCritico);
var
    c:critica;
begin
    leoCritico(c);
    while (c.codPel <> -1) do begin
        cargoNodo(L,c);
        leoCritico(c);
    end;
end;

////////////////////////////////////////////////////

function cumple (DNI:Integer):Boolean;
var
    par,impar,dig:Integer;
begin
    while (DNI <> 0) do begin
        dig:= DNI mod 10;
        if ((dig mod 2)=0) then
            par:= par + 1
        else 
            impar:= impar + 1;
        DNI:= DNI div 10;
    end;
     
    if (par = impar) then
        cumple:= true
    else
        cumple:= False;
end;

procedure maximos (v:vContador; var max,codGen:Integer);
var
    i:Integer;
begin
    for i:= 1 to 8 do begin
        if (v[i] > max) then begin
            max:=v[i];
            codGen:=i;
        end;
    end;
end;

procedure procesoLista (L:listaCritico; L2:listaPeli);
var
    vC:vContador;
    i,max,codGen,codActual:Integer;
    suma,iteraciones:Real;
begin
    for i:= 1 to 8 do
        v[i]:=0;
    max:=-1;

    while (L <> nil) do begin
        codActual:=L^.elem.codPel;
        suma:=0;
        iteraciones:=0;
        while (L <> nil) and (L^.elem.codPel = codActual) do begin
            suma:= suma + L^.elem.puntaje; //A
            iteraciones:= iteraciones + 1;
            vC[L2^.elem.codGenero]:= vC[L2^.elem.codGenero] + L^.elem.puntaje;
            if (cumple(L^.elem.DNICritico)) then    
                WriteLn(L^.elem.nombreyapellido);   //C
            L:=L^.sig;
        end;
        maximos(vC,max,codGen);
        L^.elem.puntaje:= (suma * iteraciones) / 100;
    end;
    
    WriteLn('El código de género que más puntaje obtuvo entre todas las críticas es: ',codGen); //B
end;

procedure eliminar (var L:listaPeli; cod:Integer);
var
    act,ant:listaPeli;

begin   
    act:=L;
    while (act <> nil) and (act^.elem <> valor) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act <> nil) then begin
        if (act = L) then 
            L:= L^.sig
        else
            ant^.sig:= act^.sig;
        Dispose(act);
    end;
end;

procedure eliminoPelicula (L:listaPeli);    //D
begin
    ReadLn(L^.elem.codPel);
    eliminar(L,L^.elem.codPel);
end;

var
    L1:listaCritico;
    L2:listaPeli; // se dispone
begin
    cargoListaPelis(L2);
    cargoListaCriticos(L1);

    procesoLista(L1,L2);
    eliminoPelicula(L2);

end.


lista =^nodo 
nodo = record
    elem:x;
    sig:lista;