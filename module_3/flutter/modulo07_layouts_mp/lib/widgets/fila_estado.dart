import 'package:flutter/material.dart';

class FilaEstado extends StatelessWidget {
  final String nombre;
  final String detalle;
  final bool activo;
  final String message;

  const FilaEstado({
    super.key,
    required this.nombre,
    required this.detalle,
    required this.activo,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Ícono de estado
          Icon(
            activo ? Icons.circle : Icons.cancel,
            color: activo ? Colors.green : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 12),

          // Expanded — el Column ocupa todo el espacio restante
          // Sin Expanded, un nombre largo desbordaría la Row
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.end, // <- este es el cambio
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  nombre,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  detalle,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                Text(
                  message,
                  style: TextStyle(fontSize: 11, color: const Color.fromARGB(255, 106, 169, 194)),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Chip de estado — queda pegado al borde derecho gracias a Expanded
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: (activo ? Colors.green : Colors.red).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              activo ? 'Disponible' : 'Agotado',
              style: TextStyle(
                fontSize: 11,
                color: activo ? Colors.green.shade700 : Colors.red.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
