void main() {
  int diasRetraso = 5;

  if (diasRetraso > 7) {
    print('Multa alta');
  } else if (diasRetraso > 0) {
    print('Multa leve');
  } else {
    print('Sin multa');
  }

  String estado = diasRetraso > 0 ? 'Con retraso' : 'A tiempo';
  print(estado);

  String? seccion;
  String display = seccion != null ? seccion.toUpperCase() : 'Sin sección';

  String display2 = seccion?.toUpperCase() ?? 'Sin sección';
  print(display2);
}