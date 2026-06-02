void main() {
  final socio = 'Ana';
  final diasPrestamo = 15;

  print('Hola, $socio');

  print('${socio.toUpperCase()} tiene ${diasPrestamo + 1} días restantes');

  final ficha = '''
Socio:   $socio
Días:    $diasPrestamo
Vigente: ${diasPrestamo >= 1 ? 'Sí' : 'No'}
  ''';
  print(ficha);

  final ruta = r'C:\Biblioteca\Catalogos\libros';
  print(ruta);

  final saludo = 'Bienvenido, ' + socio + '!';

  print('biblioteca'.toUpperCase());
  print('  Biblioteca Central  '.trim());
  print('Biblioteca'.contains('teca'));
  print('Biblioteca'.replaceAll('a', 'A'));
  print('Novela,Ciencia,Historia'.split(','));
  print('Biblioteca'.substring(0, 4));
  print('Biblioteca'.startsWith('Bib'));
  print('001'.padLeft(5, '0'));
}