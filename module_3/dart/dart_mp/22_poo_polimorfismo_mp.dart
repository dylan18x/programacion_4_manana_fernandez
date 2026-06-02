abstract class SeccionBiblioteca {
  String get nombre;
  double calcularCapacidad();
}

class SalaInfantil extends SeccionBiblioteca {
  final double puestos;
  SalaInfantil(this.puestos);
  @override String get nombre => 'Sala Infantil';
  @override double calcularCapacidad() => puestos * puestos;
}

class DepositoArchivo extends SeccionBiblioteca {
  final double base, altura;
  DepositoArchivo(this.base, this.altura);
  @override String get nombre => 'Depósito';
  @override double calcularCapacidad() => (base * altura) / 2;
}

class SalaGeneral extends SeccionBiblioteca {
  final double metros;
  SalaGeneral(this.metros);
  @override String get nombre => 'Sala General';
  @override double calcularCapacidad() => 3.1416 * metros * metros;
}

void imprimirCapacidad(SeccionBiblioteca seccion) {
  print('${seccion.nombre}: ${seccion.calcularCapacidad().toStringAsFixed(0)} libros');
}

void main() {
  final secciones = <SeccionBiblioteca>[
    SalaInfantil(4),
    DepositoArchivo(6, 3),
    SalaGeneral(5),
  ];

  for (final s in secciones) {
    imprimirCapacidad(s);
  }

  final mayor = secciones.reduce((a, b) => a.calcularCapacidad() > b.calcularCapacidad() ? a : b);
  print('\nSección con mayor capacidad: ${mayor.nombre}');
}