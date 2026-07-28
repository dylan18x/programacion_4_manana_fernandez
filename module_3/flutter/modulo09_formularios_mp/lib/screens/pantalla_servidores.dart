// lib/screens/pantalla_servidores.dart
import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';
import '../widgets/fila_servidor.dart';
import '../widgets/tarjeta_servidor_grid.dart';

class PantallaServidores extends StatefulWidget {
  const PantallaServidores({super.key});
  @override
  State<PantallaServidores> createState() => _PantallaServidoresState();
}

class _PantallaServidoresState extends State<PantallaServidores> {
  final _servidores = [
    ServidorSSH(id:'1', nombre:'Don Quijote de la Mancha',  ip:'Miguel de Cervantes',   puerto:1605,   usuario:'Biblioteca Central',   so:'Tapa Dura', ssl:true, servicio:'Novela'),
    ServidorSSH(id:'2', nombre:'Cien Años de Soledad',   ip:'Gabriel García Márquez',   puerto:1967,   usuario:'Biblioteca Central', so:'Edición Especial',    ssl:true, servicio:'Realismo Mágico'),
    ServidorSSH(id:'3', nombre:'El Principito',  ip:'Antoine de Saint-Exupéry',   puerto:1943, usuario:'Sección Infantil',   so:'Bolsillo', ssl:false, servicio:'Fábula'),
    ServidorSSH(id:'4', nombre:'Ficciones',  ip:'Jorge Luis Borges', puerto:1944,   usuario:'Hemeroteca',  so:'Rústica', ssl:false, servicio:'Cuentos'),
  ];

  bool _modoGrid = false;   // false = lista, true = cuadrícula

  void _toggleFavorito(int i) =>
      setState(() => _servidores[i].favorito = !_servidores[i].favorito);

  void _eliminar(int i) => setState(() => _servidores.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Libros (${_servidores.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          // Toggle lista / cuadrícula
          IconButton(
            icon:    Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemCount:   _servidores.length,
              itemBuilder: (ctx, i) => TarjetaServidorGrid(
                servidor:   _servidores[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount:        _servidores.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaServidor(
                servidor:   _servidores[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}