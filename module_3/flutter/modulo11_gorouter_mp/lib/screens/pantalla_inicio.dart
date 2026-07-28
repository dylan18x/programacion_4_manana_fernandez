// lib/screens/pantalla_inicio.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Control de Biblioteca'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.menu_book, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            const Text('Sistema de Biblioteca',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Gestiona tus libros y préstamos',
                style: TextStyle(color: cs.onSurfaceVariant)),
            const SizedBox(height: 32),
            FilledButton.icon(
              // context.go() — navega SIN apilar (no hay botón "atrás")
              onPressed: () => context.go('/servidores'),
              icon:  const Icon(Icons.book),
              label: const Text('Ver libros'),
            ),
          ],
        ),
      ),
    );
  }
}