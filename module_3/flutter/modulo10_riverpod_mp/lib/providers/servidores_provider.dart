// lib/providers/servidores_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/servidor_ssh.dart';

// NotifierProvider — estado complejo con métodos propios
class ServidoresNotifier extends Notifier<List<ServidorSSH>> {
  @override
  List<ServidorSSH> build() => [
    ServidorSSH(id:'1', nombre:'Don Quijote de la Mancha', ip:'Miguel de Cervantes', puerto:1605,   ssl:true,  favorito:true),
    ServidorSSH(id:'2', nombre:'Cien Años de Soledad',  ip:'Gabriel García Márquez', puerto:1967,   ssl:true),
    ServidorSSH(id:'3', nombre:'El Principito', ip:'Antoine de Saint-Exupéry', puerto:1943, ssl:false),
    ServidorSSH(id:'4', nombre:'Ficciones',  ip:'Jorge Luis Borges', puerto:1944, ssl:true),
  ];

  void toggleFavorito(String id) {
    state = state.map((s) =>
        s.id == id
          ? ServidorSSH(id:s.id, nombre:s.nombre, ip:s.ip,
                        puerto:s.puerto, ssl:s.ssl,
                        favorito:!s.favorito)
          : s
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((s) => s.id != id).toList();
  }

  void agregar(ServidorSSH servidor) {
    state = [...state, servidor];
  }
}

final servidoresProvider =
    NotifierProvider<ServidoresNotifier, List<ServidorSSH>>(
  ServidoresNotifier.new,
);

// Filtro de búsqueda — estado primitivo
final busquedaProvider = StateProvider<String>((ref) => '');

// Provider DERIVADO — se recalcula cuando cualquiera de sus dependencias cambia
final servidoresFiltradosProvider = Provider<List<ServidorSSH>>((ref) {
  final todos    = ref.watch(servidoresProvider);
  final busqueda = ref.watch(busquedaProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((s) =>
      s.nombre.toLowerCase().contains(q) || s.ip.contains(q)
  ).toList();
  // Cuando 'servidoresProvider' o 'busquedaProvider' cambian,
  // este provider se recalcula automáticamente.
});