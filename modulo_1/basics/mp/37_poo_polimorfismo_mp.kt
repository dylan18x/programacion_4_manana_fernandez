interface MetodoPrestamo {
    fun procesar(diasPrestamo: Int): Boolean
    val nombre: String
}

class PrestamoPresencial(val codigoSocio: String) : MetodoPrestamo {
    override val nombre = "Préstamo presencial"
    override fun procesar(diasPrestamo: Int): Boolean {
        println("🏛️ Registrando préstamo de $diasPrestamo días para socio $codigoSocio")
        return true
    }
}

class PrestamoDigital(val email: String) : MetodoPrestamo {
    override val nombre = "Préstamo digital"
    override fun procesar(diasPrestamo: Int): Boolean {
        println("💻 Enviando acceso digital por $diasPrestamo días a $email")
        return true
    }
}

class PrestamoExterno : MetodoPrestamo {
    override val nombre = "Préstamo externo"
    override fun procesar(diasPrestamo: Int): Boolean {
        println("📦 Gestionando envío externo por $diasPrestamo días")
        return true
    }
}

// Esta función no sabe ni le importa qué tipo de préstamo es
// Solo sabe que recibe algo que implementa MetodoPrestamo — POLIMORFISMO
fun registrarPrestamo(diasPrestamo: Int, metodo: MetodoPrestamo) {
    println("Procesando préstamo con ${metodo.nombre}...")
    val exito = metodo.procesar(diasPrestamo)
    println(if (exito) "✅ Préstamo registrado" else "❌ Préstamo fallido")
}

fun main() {
    val metodos: List<MetodoPrestamo> = listOf(
        PrestamoPresencial("SOC-1234"),
        PrestamoDigital("ana@biblioteca.com"),
        PrestamoExterno()
    )

    // Misma función — comportamiento distinto según el tipo
    metodos.forEach { registrarPrestamo(15, it) }
}