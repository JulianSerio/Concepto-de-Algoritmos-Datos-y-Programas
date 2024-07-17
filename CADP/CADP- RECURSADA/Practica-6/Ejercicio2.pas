program Ejercicio2;
type
    lista = ^nodo;
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;

    nodo = record
        dato: persona;
        sig: lista;
    end;

procedure leerPersona(p: persona); //P NO ESTA PASADO POR PARAMETRO POR LO TANTO NO SE MODIFICA
begin
    read(p.dni);
    if (p.dni <> 0)then begin
        read(p.nombre);
        read(p.apellido);
    end;
end;

{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista;p:persona); // NO SE MODIFICA LA LISTA
var
    aux: lista;
begin
    aux^.dato:= p; //NO SE HACE New(aux);
    aux^.sig:= l;
    l:= aux;
end;


{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
    p:nodo; //ERROR EL PARAMETRO NO ES DE TIPO PERSONA
begin
    leerPersona(p); 
    while (p.dni <> 0) do begin 
        agregarAdelante(l,p);
        //FALTA LEER PERSONA DE NUEVO
    end;
end;

procedure imprimirInformacion(var l:lista); // NO ES NECESARIO PASARLO POR REFERENCIA 
begin
    while (l <> nil) do begin   
        writeln('DNI: ', l^.dato.dni, 'Nombre:',l^.nombre, 'Apellido:', l^.apellido); // deberia ser L^.dato.nombre y L^.dato.apellido
        l:= l^.sig;
    end;
end;

var
    L:lista;
begin
    //FALTA INICIALIZAR EN NIL
    generarLista(L);
    imprimirInformacion(L);
end.