void configurarBiblioteca({
  required String nombre,
  required int    capacidad,
  bool   abierto      = true,
  int    horasAtencion = 8,
}) {
  final estado = abierto ? 'abierta' : 'cerrada';
  print('$nombre está $estado con capacidad $capacidad (atención: ${horasAtencion}h)');
}

void main() {
  configurarBiblioteca(
    nombre:        'Biblioteca Central',
    capacidad:     5000,
    abierto:       false,
    horasAtencion: 6,
  );

  configurarBiblioteca(
    nombre:    'Biblioteca Norte',
    capacidad: 3000,
  );
}