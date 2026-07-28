import 'dart:async';
import 'package:flutter/material.dart';

class Reloj extends StatefulWidget {
  const Reloj({super.key});

  @override
  State<Reloj> createState() => _RelojState();
}

class _RelojState extends State<Reloj> {
  Timer? _timer;
  int _segundos = 0;
  bool _pausado = false;

  int vueltas = 0;
  final List<int> _tiemposVuelta = [];

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!mounted) return;

      setState(() {
        _segundos++;
      });
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;

      if (_pausado) {
        _timer?.cancel();
      } else {
        _iniciarTimer();
      }
    });
  }

  void _guardarVuelta() {
    setState(() {
      vueltas++;
      _tiemposVuelta.add(_segundos);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    // Comenta la línea de arriba para observar
    // el warning de fuga de memoria en debug.

    super.dispose();
  }

  String get _formato {
    final h = _segundos ~/ 3600;
    final m = (_segundos % 3600) ~/ 60;
    final s = _segundos % 60;

    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  Color get _colorTiempo {
    Color colorTiempo;

    if (_segundos > 60) {
      colorTiempo = Colors.red;
    } else if (_segundos > 30) {
      colorTiempo = Colors.orange;
    } else {
      colorTiempo = Colors.green;
    }

    return _segundos > 120 ? Colors.deepPurple : colorTiempo;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formato,
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color: _colorTiempo,
          ),
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: _togglePausa,
              icon: Icon(_pausado ? Icons.play_arrow : Icons.pause),
              label: Text(_pausado ? 'Reanudar' : 'Pausar'),
            ),

            const SizedBox(width: 8),

            FilledButton.icon(
              onPressed: _guardarVuelta,
              icon: const Icon(Icons.flag),
              label: Text('Vuelta: $vueltas'),
            ),

            const SizedBox(width: 8),

            TextButton(
              onPressed: () {
                setState(() {
                  _timer?.cancel();
                  _segundos = 0;
                  _pausado = false;
                  vueltas = 0;
                  _tiemposVuelta.clear();
                  _iniciarTimer();
                });
              },
              child: const Text('Reiniciar'),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Text(
          _pausado ? 'Pausado' : 'Corriendo',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),

        const SizedBox(height: 12),

        if (_tiemposVuelta.isNotEmpty)
          Text(
            'Última vuelta: ${_tiemposVuelta.last} segundos',
            style: const TextStyle(fontSize: 16),
          ),
      ],
    );
  }
}
