class Libro {
  final String id;
  final String titulo;
  String       seccion;
  bool         _disponible = false;

  Libro({
    required this.id,
    required this.titulo,
    required this.seccion,
  });

  bool   get disponible => _disponible;
  String get estado     => _disponible ? 'disponible' : 'prestado';

  set estadoDisponible(bool valor) {
    _disponible = valor;
    print('$titulo: ${valor ? "disponible" : "prestado"}');
  }

  void registrarPrestamo() {
    _disponible = false;
    print('$titulo prestado en sección $seccion');
  }

  void registrarDevolucion() {
    _disponible = true;
    print('$titulo devuelto');
  }

  String resumen() => 'ID: $id | Título: $titulo | Sección: $seccion | Estado: $estado';

  @override
  String toString() => 'Libro($titulo, $seccion, $estado)';
}

void main() {
  final libro = Libro(
    id:      'LIB-001',
    titulo:  'Cien años de soledad',
    seccion: 'Novela',
  );

  libro.registrarPrestamo();
  print(libro.estado);
  print(libro.resumen());
  print(libro);

  libro.estadoDisponible = true;
  print(libro.disponible);
}