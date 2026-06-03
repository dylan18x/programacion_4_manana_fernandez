class LibroInmutable(val isbn: String, val titulo: String)

class ContadorPrestamos(var valor: Int = 0) {
    fun incrementar() { valor++ }
    fun resetear()    { valor = 0 }
}

class RegistroTemporal(titulo: String) {
    val tituloUpper = titulo.uppercase()
}