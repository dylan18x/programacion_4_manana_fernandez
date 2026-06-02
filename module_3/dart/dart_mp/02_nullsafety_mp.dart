void main() {
  String titulo = 'El Principito';

  String? autor = null;
  autor = 'Antoine de Saint-Exupéry';

  String? seccion;

  print(seccion?.length);

  String resultado = seccion ?? 'Sin sección';
  print(resultado);

  String seccionSegura = seccion!;

  if (autor != null) {
    print(autor.length);
  }

  late String codigoPrestamo;
  codigoPrestamo = 'PRES-001';
  print(codigoPrestamo);
}