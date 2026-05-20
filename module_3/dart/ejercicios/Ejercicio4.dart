import 'dart:io';

void main (){
  var piezas = 0;
  var total = 0;
  do{
    print('Ingrese la cantidad de piezas que ha producido: ');
    piezas = int.parse(stdin.readLineSync()!);
    total += piezas;
    
  }while( piezas != 0);
  if(total < 50){
    print('Produccion Baja');
  }else{
    print('Produccion adecuada');
  }
}