class Libro(
    val id:       Int,
    val titulo:   String,
    val precio:   Double,
    private val ejemplares: Int      
) {
    val precioConIva: Double   
        get() = precio * 1.19

    val disponible: Boolean
        get() = ejemplares > 0

    override fun toString() = "$titulo ($${"%.2f".format(precio)})"
}

fun main() {
    val libro = Libro(1, "Cien años de soledad", 89.99, 15)

    println(libro.disponible)  
    println(libro.precioConIva)
}