// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/catalogo_basicos.dart';

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
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {   // describe cómo se ve
    return const SelectableText(
      'Minecraft es un juego de aventuras en 3D de mundo abierto desarrollado por Mojang Studios, donde los jugadores pueden interactuar con un mundo tridimensional totalmente personalizable, compuesto de bloques y entidades. Sus diversas opciones de juego permiten a los jugadores elegir su estilo de juego, creando un sinfín de posibilidades.', 
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