// lib/providers/metricas_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_servidor.dart';

class MetricasNotifier extends AsyncNotifier<List<MetricaServidor>> {
  // build() puede ser async — es la carga inicial
  @override
  Future<List<MetricaServidor>> build() => _fetch();

  Future<List<MetricaServidor>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      MetricaServidor(servidor:'Don Quijote de la Mancha', cpu:45.2, ram:62.1, conexiones:230, ssd:100),
      MetricaServidor(servidor:'Cien Años de Soledad',  cpu:88.1, ram:91.2, conexiones:80, ssd:200),
      MetricaServidor(servidor:'El Principito', cpu:22.4, ram:41.0, conexiones:50, ssd:150),
      MetricaServidor(servidor:'Ficciones',  cpu:19.7, ram:28.5, conexiones:20, ssd:120),
      MetricaServidor(servidor:'La Ciudad y los Perros',  cpu:12.3, ram:31.2, conexiones:10, ssd:180),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final metricasProvider =
    AsyncNotifierProvider<MetricasNotifier, List<MetricaServidor>>(
  MetricasNotifier.new,
);