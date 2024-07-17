program Ejercicio7;
type
    str = string[20];

    vMaterias = array [1..24] of integer;

    alumno = record
        numeroAlu:Integer;
        apellido:str;
        nombre:str;
        correo:str;
        anoIngreso:Integer;
        anoEgreso:Integer;
        notasObtenidas:vMaterias;
    end;

    lista = ^nodo;
    nodo = record
        elem:alumno;
        sig:lista;
    end;

procedure cargoNotas (var v:vMaterias);
var 
    i:Integer;
begin
    for i:= 1 to 24 do begin
        WriteLn('Ingrese notas');ReadLn(v[i]);
    end;
end;

procedure leoAlumno (var a:alumno);
begin
    WriteLn('Numero Alu: ');ReadLn(a.numeroAlu);
    WriteLn('Apellido: ');ReadLn(a.apellido);
    WriteLn('Nombre: ');ReadLn(a.nombre);
    WriteLn('Correo: ');ReadLn(a.correo);
    WriteLn('Ano ingreso: ');ReadLn(a.anoIngreso);
    WriteLn('Ano Egreso: ');ReadLn(a.anoEgreso);
    cargoNotas(a.notasObtenidas);
    
end;

Procedure OrdenarVectorNotasxAlumno (var vec : vMaterias);
var
  i,j,p,item : integer;
Begin
  for i := 1 to 24-1 do begin
    p := i;
    for j := i + 1 to 24 do
      if (vec[j] < vec[p]) then
        p := j;
    item := vec[p];
    vec[p] := vec[i];
    vec[i] := item;
  end;
End;

procedure cargoNodo (var L:lista; a:alumno);
var
    aux:lista;
begin
    New(aux);
    aux^.elem:=a;
    aux^.sig:=L;
    L:=aux;
end;

procedure cargoLista (var L:lista);
var
    a:alumno;
begin
    leoAlumno(a);
    while (a.numeroAlu <> -1) do begin
        cargoNodo(L,a);
        leoAlumno(a);
    end;
end;

procedure sacoPromedioNotas (v:vMaterias; var prom:Real);
var
    i:Integer;
begin
    for i:= 1 to 24 do begin
        prom:= prom + v[i];
    end;
    prom:= prom / 24;
end;

function digImpares (cod:Integer):Boolean;
var
    pares,impares,dig:Integer;
begin
    pares:=0;impares:=0;
    while (cod <> 0) do begin
        dig:= cod mod 10;
        if ((dig mod 2)=0) then
            pares:= pares + 1
        else 
            impares:= impares + 1;
        cod:= cod div 10;
    end;
    digImpares:= (pares = 0);
end;


procedure masRapidos (egreso,ingreso:Integer; apellido,nombre,correo:str; var ape1,ape2,nom1,nom2,cor1,cor2:str; var min1,min2:Integer);
var
    anos:Integer;
begin
    anos:= egreso - ingreso;
    if (anos < min1) then begin
        min2:= min1;
        min1:=anos;

        ape2:=ape1;
        ape1:= apellido;

        nom2:= nom1;
        nom1:= nombre;

        cor2:=cor1;
        cor1:= correo;
    end
    else 
    if (anos < min2) then begin
        min2:=anos;
        ape2:=apellido;
        nom2:=nombre;
        cor2:=correo;
    end;
end;

procedure procesoeInformoLista (L:lista);
var
    min1,min2,cant:Integer;
    nom1,nom2,ape1,ape2,cor1,cor2:str;
    prom:real;
begin
    prom:=0;min1:=0;min2:=0;cant:=0;

    while (L <> nil) do begin
        sacoPromedioNotas(L^.elem.notasObtenidas,prom);
        WriteLn('El promedio de notas para este alumno es: ',prom); //a

        if (L^.elem.anoIngreso = 2012) and (digImpares(L^.elem.numeroAlu)) then //b
            cant:= cant + 1;

        masRapidos(L^.elem.anoEgreso,L^.elem.anoIngreso,L^.elem.apellido,L^.elem.nombre,L^.elem.correo,ape1,ape2,nom1,nom2,cor1,cor2,min1,min2);
        //c
        L:= L^.sig;
    end;
    WriteLn('La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente por dígitos impares es: ',cant);
    WriteLn('Los alumnos que mas rapido se recibieron son: ',ape1, ' ', nom1, ' ', cor1, ' y ', ape2, ' ', nom2, ' ', cor2);
end;

function buscar (L:lista; num:Integer):Boolean;
var
    encontre:Boolean;
begin
    encontre:= False;
    while (L <> nil) and (not encontre) do begin
        if (num = L^.elem.numeroAlu) then encontre:= True
        else  L:=L^.sig;
    end;
    buscar:=encontre;
end;

procedure borrar (var L:lista; num:Integer; var elimnado:Boolean);
var 
    ant,act:lista;
begin
    elimnado:= False;
    act:=L;
    while (act <> nil) and (act^.elem.numeroAlu <> num) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act <> nil) then begin
        elimnado:=True;
        if (act = L) then L:=L^.sig
                    else ant^.sig:= act^.sig;
        Dispose(act);
    end;
end;

var
    L:lista;
    numEliminar:Integer;
    eliminado:Boolean;
begin
    L:=Nil;
    cargoLista(L);
    procesoeInformoLista(L);

    WriteLn('Ingrese numero de alumno a elimnar: ');ReadLn(numEliminar);
    if (buscar(L,numEliminar)) then begin
        borrar(L,numEliminar,eliminado);
        if (eliminado) then 
            WriteLn('El alumno fue eliminado de la estructura')
        else 
            WriteLn('El alumno no fue elimnado de la estructura')
    end
    else
        WriteLn('No se pudo encontrar el alumno');
        

end.