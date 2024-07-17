program Ejercicio5;

type
    auto = record
        marca:String;
        modelo:String;
        precio:Real;
    end;

procedure leer (var a:auto);                //LEO DATOS 
begin
    WriteLn('Ingrese marca del auto');
    ReadLn(a.marca);
    WriteLn('Ingrese modelo del auto');
    ReadLn(a.modelo);
    WriteLn('Ingrese precio del auto');
    ReadLn(a.precio);
end;

procedure MarcaModeloMasCaro (a:auto; var ModelCaro,MarcaCaro:String);     //SACO LA MARCA Y EL MODELO MAS CARO 
var
    precioX:Real;
begin
    precioX:=0;
    if (a.precio > precioX) then begin
        precioX:=a.precio;

        ModelCaro:=a.modelo;
        MarcaCaro:=a.marca;
    end;
end;

       
var                  //PPAL
    a:auto;

    totalAutos:Integer;

    ModelCaro,
    MarcaCaro,
    marcaActual:String;

    totalPrecio,
    promedio,
    cantAutos:Real;
begin
    ModelCaro:='';
    MarcaCaro:='';

    leer(a);                                                       //LEO DATOS 

    while (a.marca <> 'ZZZ') do                                    //MIENTRAS MARCA <> DE ZZZ
    begin
        marcaActual:=a.marca;
        totalPrecio:=0;                                            //INICIALIZO VARIABLES
        promedio:=0;
        cantAutos:= cantAutos + 1; 

        while (a.marca <> 'ZZZ') and (a.marca = marcaActual) do             //COMPRUBO QUE LA MARCA NO CAMBIE
        begin
            totalPrecio:= totalPrecio + a.precio;                           //SACO EL PROMEDIO DE LA MARCA
            promedio:= (totalPrecio / cantAutos);

            WriteLn('El promedio de precio de la marca es: ',promedio);

            MarcaModeloMasCaro(a,ModelCaro,MarcaCaro);
            leer(a);
        end;        
    end;

    WriteLn('La marca y modelo del auto mas caro son: ',ModelCaro, '  ',MarcaCaro);   //WRITE DEL MODELO Y MARCA DEL AUTO MAS CARO 
  
end.