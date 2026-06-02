void saludarSocio() {
  print('Bienvenido a la biblioteca');
}

int contarLibros(){
  return 5 + 2;
}

int sumarEjemplares(int a, int b) {
  return a + b;
}

int multiplicarPrestamos(int a, int b) => a * b;

void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}

String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';

String construirRuta(String seccion, String catalogo, [int? estante]) {
  if (estante != null) {
    return 'biblioteca/$seccion:$estante/$catalogo';
  }
  return 'biblioteca/$seccion/$catalogo';
}

String construirRutaV2(String seccion, String catalogo, [int estante = 1]) {
  return 'biblioteca/$seccion:$estante/$catalogo';
}

void main() {
  print(sumarEjemplares(5, 3));
  print(multiplicarPrestamos(4, 6));
  imprimirSeparador('Catálogo');
  saludarSocio();
  contarLibros();
  print(formatearPrecio(1299.9));
  print(formatearPrecioSinTipo(1299.9));
  print(construirRuta('Novela', 'ficcion'));
  print(construirRuta('Novela', 'ficcion', 3));
  print(construirRutaV2('Ciencia', 'fisica'));
}