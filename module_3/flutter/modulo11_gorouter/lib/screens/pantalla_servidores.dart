// lib/screens/pantalla_servidores.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter/models/servidor_ssh.dart';

class PantallaServidores extends StatelessWidget {
  const PantallaServidores({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final servidores = servidoresSimulados;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Servidores'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: Column(
        children: [
          Expanded(
            child: 
            ListView.builder(
              itemCount: servidores.length,
              itemBuilder: (context, i) => ListTile(
                leading: const Icon(Icons.dns),
                title: Text(servidores[i].nombre),
                onTap: () {
                  // context.push() — apila la pantalla (aparece botón "atrás")
                  context.push('/servidores/${servidores[i].id}',extra: servidores[i]);
                  
                },
              ),
            ),
            
          ),
          FilledButton.icon(
              onPressed: () => context.go('/'),
              icon:  const Icon(Icons.dns),
              label: const Text('Regresar'),
            ),
        ],
      ),
      
    );
  }
}
