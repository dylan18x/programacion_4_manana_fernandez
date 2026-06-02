void main() {
  final precios = [29.99, 49.50, 15.00, 99.99];

  final preciosConIva = precios.map((p) => p * 1.15);
  print(preciosConIva.toList());

  final titulos = ['Sapiens', 'Kotlin', 'El Principito'];
  final fichas = titulos.map((t) => 'biblioteca/catalogo/$t');
  print(fichas.toList());

  final diasRetraso = [0.0, 3.5, 12.0, 1.0, 8.5, 0.0];

  final conMulta = diasRetraso.where((d) => d > 7.0);
  print(conMulta.toList());

  final sinMulta = diasRetraso.where((d) => d >= 0.0 && d <= 7.0);
  print(sinMulta.toList());

  final multas = [15.0, 23.0, 9.80, 31.0, 7.50];

  final totalMultas = multas.reduce((acum, multa) => acum + multa);
  print('Total multas: \$${totalMultas.toStringAsFixed(2)}');

  final totalFold = multas.fold(0.0, (acum, multa) => acum + multa);
  print('Total (fold): \$${totalFold.toStringAsFixed(2)}');

  final multaMayor = multas.reduce((a, b) => a > b ? a : b);
  print('Mayor multa: \$$multaMayor');
}