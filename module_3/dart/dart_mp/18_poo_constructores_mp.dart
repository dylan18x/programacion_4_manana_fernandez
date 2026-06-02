class Biblioteca {
  final String nombre;
  final String direccion;
  final int    capacidad;
  final bool   abierta;

  Biblioteca({
    required this.nombre,
    required this.direccion,
    required this.capacidad,
    this.abierta = true,
  });

  Biblioteca.sucursal()
      : nombre    = 'Sucursal Norte',
        direccion = 'Av. Norte 100',
        capacidad = 1000,
        abierta   = true;

  Biblioteca.principal({required this.nombre, required this.direccion})
      : capacidad = 10000,
        abierta   = true;

  factory Biblioteca.desdeDireccion(String url) {
    final uri = Uri.parse(url);
    return Biblioteca(
      nombre:    uri.host,
      direccion: uri.host,
      capacidad: uri.port != 0 ? uri.port : 5000,
      abierta:   uri.scheme == 'https',
    );
  }

  @override
  String toString() =>
      '${abierta ? "Abierta" : "Cerrada"}: $nombre ($direccion) — cap. $capacidad';
}

void main() {
  final b1 = Biblioteca(nombre: 'Biblioteca Central', direccion: 'Av. Principal 1', capacidad: 8000);
  final b2 = Biblioteca.sucursal();
  final b3 = Biblioteca.principal(nombre: 'Biblioteca Nacional', direccion: 'Centro Histórico');
  final b4 = Biblioteca.desdeDireccion('https://biblioteca.gob.ec:3000/catalogo');

  print(b1);
  print(b2);
  print(b3);
  print(b4);
}