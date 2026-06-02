class TarjetaBiblioteca {
  final String socio;
  double _saldo;

  TarjetaBiblioteca(this.socio, double saldoInicial)
      : _saldo = saldoInicial;

  double get saldo => _saldo;

  void recargar(double monto) {
    if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
    _saldo += monto;
    print('Recarga de \$$monto. Nuevo saldo: \$$_saldo');
  }

  void descontar(double monto) {
    if (monto <= 0)     throw ArgumentError('El monto debe ser positivo');
    if (monto > _saldo) throw StateError('Saldo insuficiente');
    _saldo -= monto;
    print('Descuento de \$$monto. Nuevo saldo: \$$_saldo');
  }
}

void main() {
  final tarjeta = TarjetaBiblioteca('Ana López', 500.0);

  tarjeta.recargar(200.0);
  tarjeta.descontar(150.0);
  print(tarjeta.saldo);
}