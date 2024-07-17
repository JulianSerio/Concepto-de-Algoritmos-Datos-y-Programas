program Ejercicio14;
type
    rangoDias = 1..31;
    
    prestamo = record
        nro:integer;  
        ISBN:Integer;
        nroSocio:Integer;
        diaPresatamo:rangoDias;
    end;

    lista = ^nodo; 
    nodo = record
        elem:prestamo;
        sig:lista;
    end;

    vContador = array [rangoDias] of Integer;

procedure leoPrestamo (var p:prestamo);
begin
    WriteLn('ISBN: ');ReadLn(p.ISBN);
    if (p.ISBN <> -1) then begin
        WriteLn('Numero: ');ReadLn(p.nro);
        WriteLn('Numero socio: ');ReadLn(p.nroSocio);
        WriteLn('Dia prestamo: ');ReadLn(p.diaPresatamo);
    end;      
end;

procedure cargoNodo (var L:lista; p:prestamo);
var
    aux,ant,act:lista;
begin
    New(aux);
    aux^.elem:=p;
    act:=L;
    ant:=L;
    while (act <> nil) and (act^.elem.ISBN <> p.ISBN) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (ant = act) then
        L:=aux
    else    
        ant^.sig:=aux;
    aux^.sig:=act;
end;

procedure cargoLista (var L:lista);
var
    p:prestamo;
begin
    leoPrestamo(p);
    while (p.ISBN <> -1) do begin
        cargoNodo(L,p);
        leoPrestamo(p);
    end;
end;

procedure inicializoVc (var vC:vContador);
var
    i:Integer;
begin
    for i:=1 to 31 do begin
        vC:=0;
    end;
end;

procedure recorroVC (vC:vContador; var min,dia:Integer);
var
    i:Integer;
begin
    for i:= 1 to 31 do begin
        if (vC[i] < min) then begin
            min:=vC[i];
            dia:=i;
        end;    
    end;
end;

function cumple (num:Integer):Boolean;
var
    impares,dig,pares:Integer;
begin
    impares:=0;pares:=0;
    while (num <> 0) do begin
        dig:= num mod 10;
        if ((dig mod 2)=0) then 
            pares:= pares + 1
        else 
            impares:= impares + 1;
        num:= num div 10;
    end;    
    cumple:= (pares = 0) and (impares >= 1)
end;

procedure recorroLista (L:lista);
var 
    vC:vContador;
    min,dia,totalPrestamos,cumpleCondicion:Integer;
    porce:Real;
begin
    min:=9999;totalPrestamos:=0;cumpleCondicion:=0;
    inicializoVc(vC);

    while (L <> nil) do begin
        vC[L^.elem.diaPresatamo]:= vC[L^.elem.diaPresatamo] + 1; //b

        //c
        totalPrestamos:= totalPrestamos + 1; 
        if (cumple(L^.elem.nro)) and (cumple(L^.elem.nroSocio)) then 
            cumpleCondicion:= cumpleCondicion + 1;
        L:=L^.sig;
    end;
    recorroVC(vC,min,dia);
    WriteLn('El dia en que menos prestamos es: ',dia);
    porce:= (cumpleCondicion / totalPrestamos) * 100;
    WriteLn('El porcentaje de prestamos es: ',porce);
end;

var
    L:lista;
begin
    L:=nil;
    cargoLista(L);
    recorroLista(L);
end.