class Publicacion(val titulo: String)

open class Publicacion(val titulo: String, val editorial: String) {
    open fun mostrarInfo() = println("$titulo publicado por: $editorial")
    open fun descripcion() = "Soy $titulo"

    fun registrar() = println("$titulo registrado en el sistema")
}

class Libro(titulo: String, editorial: String) : Publicacion(titulo, editorial) {
    override fun mostrarInfo() {
        super.mostrarInfo()                    
        println("(disponible para préstamo)")
    }
    override fun descripcion() = "${super.descripcion()}, un libro"
}

class Revista(titulo: String, editorial: String, val mensual: Boolean) : Publicacion(titulo, editorial) {
    override fun descripcion() =
        "${super.descripcion()}, una revista ${if (mensual) "mensual" else "semanal"}"
}

fun main() {
    val libro = Libro("Kotlin en acción", "Manning")
    libro.mostrarInfo()

    val revista = Revista("National Geographic", "Disney", true)
    println(revista.descripcion())  

    libro.registrar()  
}