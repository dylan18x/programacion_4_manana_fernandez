data class Categoria(val id: Int, val nombre: String)

data class Libro(
    val id:        Int,
    val titulo:    String,
    val precio:    Double,
    val ejemplares: Int,
    val categoria: Categoria,
    val activo:    Boolean = true
) {
    val disponible: Boolean get() = activo && ejemplares > 0
    val precioConIva: Double get() = precio * 1.19

    fun aplicarDescuento(porcentaje: Double): Libro {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precio = precio * (1 - porcentaje / 100))
    }
}

object CatalogoLibros {
    private val categorias = mutableListOf(
        Categoria(1, "Novela"),
        Categoria(2, "Ciencia"),
        Categoria(3, "Historia")
    )
    private val libros      = mutableListOf<Libro>()
    private var siguienteId = 1

    fun agregarLibro(titulo: String, precio: Double, ejemplares: Int, categoriaId: Int): Libro? {
        val categoria = categorias.find { it.id == categoriaId } ?: return null
        val libro     = Libro(siguienteId++, titulo, precio, ejemplares, categoria)
        libros.add(libro)
        return libro
    }

    fun listar(): List<Libro>              = libros.toList()
    fun disponibles(): List<Libro>         = libros.filter { it.disponible }
    fun porCategoria(id: Int): List<Libro> = libros.filter { it.categoria.id == id }
    fun buscar(query: String): List<Libro> =
        libros.filter { it.titulo.contains(query, ignoreCase = true) }
}

fun main() {
    CatalogoLibros.agregarLibro("Cien años de soledad", 89.99, 15, 1)
    CatalogoLibros.agregarLibro("El Principito",         29.99,  0, 1)
    CatalogoLibros.agregarLibro("Breve historia del tiempo", 349.99, 5, 2)
    CatalogoLibros.agregarLibro("Sapiens",              149.99,  8, 3)

    println("=== Todos los libros ===")
    CatalogoLibros.listar().forEach { l ->
        val estado = if (l.disponible) "✅" else "❌"
        println("$estado ${l.titulo} — ${"%.2f".format(l.precioConIva)} (con IVA)")
    }

    println("\n=== Disponibles con 10% descuento ===")
    CatalogoLibros.disponibles()
        .map { it.aplicarDescuento(10.0) }
        .forEach { println("  ${it.titulo}: ${"%.2f".format(it.precio)}") }
}