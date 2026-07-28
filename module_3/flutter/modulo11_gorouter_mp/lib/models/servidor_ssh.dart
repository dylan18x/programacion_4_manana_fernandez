class ServidorSSH {
  final String id;
  final String nombre;
  final String ip;
  final int    puerto;
  final bool   ssl;

  const ServidorSSH({
    required this.id,
    required this.nombre,
    required this.ip,
    required this.puerto,
    required this.ssl,
  });
}

// Lista simulada — en una app real vendría de un provider
const servidoresSimulados = [
  ServidorSSH(id: '1', nombre: 'Don Quijote de la Mancha', ip: 'Miguel de Cervantes', puerto: 1605, ssl: true),
  ServidorSSH(id: '2', nombre: 'Cien Años de Soledad',  ip: 'Gabriel García Márquez', puerto: 1967, ssl: true),
  ServidorSSH(id: '3', nombre: 'El Principito', ip: 'Antoine de Saint-Exupéry', puerto: 1943, ssl: false),
];