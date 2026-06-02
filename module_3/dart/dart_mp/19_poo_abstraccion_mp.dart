abstract class SeccionBiblioteca {
  String get nombre;
  double calcularCapacidad();
  double calcularMetros();

  void describir() {
    print('$nombre — capacidad: ${calcularCapacidad().toStringAsFixed(0)} libros, '
          'metros: ${calcularMetros().toStringAsFixed(2)} m²');
  }
}

class SalaLectura extends SeccionBiblioteca {
  final double puestos;
  SalaLectura(this.puestos);

  @override String get nombre => 'Sala de lectura ($puestos puestos)';
  @override double calcularCapacidad() => puestos * 2;
  @override double calcularMetros()    => puestos * 1.5;
}

class Estanteria extends SeccionBiblioteca {
  final double ancho, alto;
  Estanteria(this.ancho, this.alto);

  @override String get nombre => 'Estantería (${ancho}x$alto)';
  @override double calcularCapacidad() => ancho * alto * 10;
  @override double calcularMetros()    => ancho * alto;
}

void main() {
  final secciones = <SeccionBiblioteca>[SalaLectura(20), Estanteria(4, 7)];
  for (final s in secciones) {
    s.describir();
  }
}