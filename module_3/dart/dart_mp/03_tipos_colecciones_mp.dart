void main() {
  List<String> libros   = ['Kotlin', 'Clean Code', 'El Principito'];
  var          codigos  = [1001, 1002, 1003, 1004, 1005];

  print(libros[0]);
  print(libros.length);
  libros.add('Sapiens');
  libros.remove('Kotlin');

  Map<String, int> prestamos = {
    'Ana':   3,
    'Luis':  1,
    'María': 5,
  };

  print(prestamos['Ana']);
  print(prestamos['Pedro']);
  prestamos['Carlos'] = 2;

  Set<String> categorias = {'Novela', 'Ciencia', 'Historia'};
  categorias.add('Novela');
  print(categorias.length);

  var estante1 = [1001, 1002, 1003];
  var estante2 = [1004, 1005, 1006];
  var catalogo = [...estante1, ...estante2];
  print(catalogo);

  bool mostrarReservados = true;
  var disponibles = [
    'El Principito',
    'Sapiens',
    if (mostrarReservados) 'Kotlin en acción',
  ];

  var codigosGenerados = [for (var i = 1; i <= 5; i++) i * i];
  print(codigosGenerados);
}