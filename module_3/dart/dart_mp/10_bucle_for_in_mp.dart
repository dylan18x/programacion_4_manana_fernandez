void main() {
  final categorias = ['Novela', 'Ciencia', 'Historia', 'Arte', 'Tecnología'];

  for (final categoria in categorias) {
    print(categoria);
  }

  categorias.forEach((c) => print(c.toLowerCase()));

  final estantes = {'Novela': 101, 'Ciencia': 202, 'Historia': 303, 'Arte': 404};
  for (final entrada in estantes.entries) {
    print('${entrada.key} → estante ${entrada.value}');
  }

  for (final letra in 'Dart'.split('')) {
    print(letra);
  }
}