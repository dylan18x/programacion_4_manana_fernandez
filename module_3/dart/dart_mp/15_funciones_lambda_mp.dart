void main() {
  final calcularMulta = (int n) => n * n;
  print(calcularMulta(7));

  final calcularDescuento = (double precio, double pct) {
    final descuento = precio * (pct / 100);
    return precio - descuento;
  };
  print(calcularDescuento(100.0, 15.0));

  final codigosLibros = [3, 1, 4, 1, 5, 9, 2, 6];
  codigosLibros.sort((a, b) => b.compareTo(a));
  print(codigosLibros);
}