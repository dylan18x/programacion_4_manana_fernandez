// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/catalogo_basicos.dart';
import 'widgets/etiqueta.dart';
import 'widgets/servicio_estado.dart';
import 'widgets/contador_limitado.dart';
import 'widgets/reloj.dart';
import 'screens/pantalla_contexto.dart';
// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1   StatelessWidget mínimo                             │
// │  2  Paso 1b  Widgets básicos — catálogo                        │
// │  3  Paso 2   StatelessWidget con parámetros                     │
// │  4  Paso 3   StatefulWidget / setState / cambio de estatus      │
// │  5  Paso 3b  Parámetros en StatefulWidget                       │
// │  6  Paso 4   Ciclo de vida con Timer                            │
// │  7  Paso 5   BuildContext                                        │
// │  8  Paso 6   Composición de widgets                             │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 2;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing:    12,
          runSpacing: 8,
          children: [
            Etiqueta(texto: 'Disponible', color: Colors.green),
            Etiqueta(texto: 'Atrasado',   color: Colors.red,    relleno: true),
            Etiqueta(texto: 'En Reserva', color: Colors.orange),
            Etiqueta(texto: 'Dañado',     color: Colors.red,    fontSize: 16, relleno: true),
            Etiqueta(texto: 'Catálogo',   color: Colors.blue,   fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: ServicioEstado(nombre: 'Biblioteca Central'),
      ),
    ),
    5 => Scaffold(                               // Paso 3b
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorLimitado(
              etiqueta: 'Préstamos de libros',
              limite:   3,
              color:    Colors.red,
              onLimite: () => debugPrint('¡Límite de préstamos alcanzado!'),
            ),
            const SizedBox(height: 40),
            ContadorLimitado(
              etiqueta: 'Libros prestados',
              limite:   10,
              color:    Colors.indigo,
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(                              // Paso 4
      appBar: AppBar(title: const Text('Tiempo de Lectura')),
      body: const Center(child: Reloj()),
    ),
    7 => const PantallaContexto(),    // Paso 5 — ya tiene su propio Scaffold
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {   // describe cómo se ve
    return const SelectableText(
      'La Biblioteca Central es un centro de recursos de información y lectura abierto a toda la comunidad estudiantil, donde los usuarios pueden consultar un amplio catálogo de libros, revistas y publicaciones científicas. Sus diversas secciones permiten explorar infinitas posibilidades de aprendizaje.', 
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: Colors.deepPurple,
        shadows: [
          Shadow(color: Colors.black26,blurRadius: 4,offset: Offset(4, 1),),
          ],
        ),
        textAlign: TextAlign.left,
        //overflow: TextOverflow.ellipsis,
        maxLines: 10,
    );
  }
}