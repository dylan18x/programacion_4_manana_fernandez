class Publicacion {
  final String titulo;
  final int    anioPublicacion;

  Publicacion(this.titulo, this.anioPublicacion);

  String describir() => '...';

  void presentarse() {
    print('Soy "$titulo", publicado en $anioPublicacion: ${describir()}');
  }
}

class Libro extends Publicacion {
  Libro(super.titulo, super.anioPublicacion);

  @override
  String describir() => 'libro disponible para préstamo';

  void reservar() => print('"$titulo" reservado 📖');
}

class Revista extends Publicacion {
  Revista(super.titulo, super.anioPublicacion);

  @override
  String describir() => 'revista de consulta en sala';

  void archivar() => print('"$titulo" archivada 🗂️');
}

void main() {
  final libro   = Libro('Sapiens', 2011);
  final revista = Revista('National Geographic', 2024);

  libro.presentarse();
  revista.presentarse();

  libro.reservar();
  revista.archivar();
}