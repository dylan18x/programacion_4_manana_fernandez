import 'dart:io';

void main(){
  print('Ingrese su nombre de socio: ');
  String? socio = stdin.readLineSync();

  print('Bienvenido $socio');

  print('Ingrese el código del libro: ');
  int codigoLibro = int.parse(stdin.readLineSync()!);
  print('Código: $codigoLibro');

  print('Ingrese el precio del libro: ');
  double precio = double.parse(stdin.readLineSync()!);
  print('Precio: $precio');

  print('Ingrese los días del primer préstamo: ');
  int a = int.parse(stdin.readLineSync()!);

  print('Ingrese los días del segundo préstamo: ');
  int b = int.parse(stdin.readLineSync()!);

  int totalDias = a + b;

  print('Total de días prestados: $totalDias');
}