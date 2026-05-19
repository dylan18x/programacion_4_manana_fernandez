import 'dart:io';

void main (){
  print('Ingrese  un numero entero: ');
  int numero = int.parse(stdin.readLineSync()!);
  if(numero > 0){
    print('El numero $numero es positivo');
  } else if (numero < 0){
    print('El numero $numero es negativo');
  } else {
    print('El nuemro es 0');
  }
}