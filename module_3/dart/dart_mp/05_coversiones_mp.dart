void main() {
  int    codigoLibro = 1042;
  double precio      = codigoLibro.toDouble();
  String texto       = codigoLibro.toString();

  int    num1 = int.parse('1001');
  double num2 = double.parse('29.99');

  int?    num3 = int.tryParse('abc');
  double? num4 = double.tryParse('99');

  Object valor = 'Biblioteca Central';
  if (valor is String) {
    print(valor.length);
  }

  Object obj = 'Cien años de soledad';
  String titulo = obj as String;

  String? seccion = null;
  int longitud = seccion?.length ?? 0;
  print(longitud);

  print(double.infinity);
  print(double.nan);
  print(double.maxFinite);
}