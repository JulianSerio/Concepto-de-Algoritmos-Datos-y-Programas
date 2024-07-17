program Ejercicio3; 
type
    lista = ^nodo; //CREA UN PUNTERO HACIA EL NODO 
    nodo = record // CREA NODO 
        num : integer; // ASIGNA UN VALOR AL ELEM
        sig : lista; // PUNTERO HACIA EL SIGUIENTE NODO
    end;

procedure armarNodo(var L: lista; v: integer); //A 
var
    act,aux:lista;
begin
    New(aux);
    aux^.num:= v;
    aux^.sig:= Nil;
    if (L <> nil) then begin
        act:=L;
        while (act^.sig <> nil) do 
            act:= act^.sig;
        act^.sig:= aux;
    end
    else 
        L:=aux;
end;

procedure AgregarAlFinal2 (var L,ult: lista; v: Integer); //B
var  
    nue : lista;
begin 
    new (nue);
    nue^.num:= v;
    nue^.sig := NIL;
    if L <> Nil then 
        ult^.sig := nue
    else 
        L := nue;
    ult := nue;
end;

procedure imprimoLista (L:lista);
begin
    while (L <> nil) do begin
        WriteLn(L^.num);
        L:= L^.sig;
    end;
end;

procedure incrementarLista(L: lista; num: Integer);
begin
  while (L <> Nil) do begin
    L^.num:= L^.num + num;  // incrementa el valor obtenido
    L:= L^.sig;
  end;
end;

var
    pri : lista; //DECLARO EL PUNTERO A NODO 
    valor,x : integer; // DECLARO EL VALOR 
begin
    pri := nil; // INDICA AL PUNTERO NO SENALAR A NINGUNA POSICION 
    writeln('Ingrese un numero');   
    read(valor); // LEO EL VALOR QUE QUIERO PONER EN LA 1RA POS
    while (valor <> 0) do begin // CREO UN BUCLE QUE LEA DATOS HASTA RECIBIR EL 0 COMO VALOR
        armarNodo(pri, valor); //LLAMO AL MODULO PARA IR AGREGANDO 
        writeln('Ingrese un numero');
        read(valor); //SE LE OTRO VALOR
    end;
    imprimoLista(pri);
    Writeln('Ingrese un valor');Readln(x);
    incrementarLista(pri,x);
    imprimoLista(pri);
end.