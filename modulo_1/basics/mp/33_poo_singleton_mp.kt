object Biblioteca {
    val nombre:    String = "Biblioteca Central"
    val direccion: String = "Av. Principal 123"
    private val codigoAcceso: String = "bib-secreto-123"  

    fun info() = "$nombre — $direccion"
    fun headers() = mapOf("Authorization" to "Bearer $codigoAcceso")
}

class Socio private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorId = 0

        fun crear(nombre: String, email: String): Socio? {
            if (nombre.isBlank() || !email.contains("@")) return null
            return Socio(++contadorId, nombre.trim())
        }

        const val ROL_DEFECTO = "lector"
    }
}

fun main() {
    println(Biblioteca.info()) 

    val s = Socio.crear("Ana", "ana@biblioteca.com")
    println(s) 
}