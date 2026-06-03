void main() {
  int librosProcesados = 0;
  int librosPendientes = 1024;

  while (librosPendientes > 0) {
    final lote = librosPendientes > 256 ? 256 : librosPendientes;
    librosProcesados++;
    librosPendientes -= lote;
    print('Lote $librosProcesados: $lote libros (pendientes: $librosPendientes)');
  }

  int reintentos = 0;
  bool registroExitoso = false;

  do {
    reintentos++;
    print('Intento de registro #$reintentos...');
    if (reintentos == 3) registroExitoso = true;
  } while (!registroExitoso && reintentos < 5);

  print(registroExitoso
      ? 'Registro exitoso tras $reintentos intentos'
      : 'No se pudo registrar');
}