import 'dart:io';

void main() {
  for (int i = 0; i < 5; i++) {
    print('Estante $i');
  }

  for (int i = 0; i <= 100; i += 25) {
    print('Catalogado: $i%');
  }

  for (int i = 5; i >= 1; i--) {
    print('Días restantes: $i');
  }

  print('Ingrese el código del libro: ');
  int codigo = int.parse(stdin.readLineSync()!);
  print('Ejemplares del libro $codigo: ');
  for (int i = 1; i <= 10; i++) {
    print('Ejemplar $i del libro $codigo');
  }
}