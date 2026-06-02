data class Libro(
    val id:        Int,
    val titulo:    String,
    val precio:    Double,
    val categoria: String,
    val activo:    Boolean = true
)

fun main() {
    val l1 = Libro(1, "Cien años de soledad", 89.99, "Novela")
    val l2 = Libro(1, "Cien años de soledad", 89.99, "Novela")
    val l3 = Libro(2, "El Principito",         19.99, "Infantil")

    println(l1) 

    println(l1 == l2)   
    println(l1 == l3)  

    val barato   = l1.copy(precio = 59.99)
    val inactivo = l1.copy(activo = false)

    val (id, titulo, precio) = l1
    println("$id: $titulo — $$precio")

    listOf(l1, l3).forEach { (id2, titulo2, precio2) ->
        println("[$id2] $titulo2: $$precio2")
    }
}