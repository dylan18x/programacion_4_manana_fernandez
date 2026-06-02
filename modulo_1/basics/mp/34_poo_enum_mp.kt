enum class EstadoPrestamo(val descripcion: String, val esTerminal: Boolean) {
    SOLICITADO ("Esperando aprobación",    false),
    EN_PRESTAMO("Libro entregado al socio",false),
    DEVUELTO   ("Devuelto con éxito",      true),
    VENCIDO    ("Plazo superado sin devolución", true),
    CANCELADO  ("Cancelado por el socio",  true);

    fun puedeTransicionarA(siguiente: EstadoPrestamo): Boolean = when (this) {
        SOLICITADO  -> siguiente == EN_PRESTAMO || siguiente == CANCELADO
        EN_PRESTAMO -> siguiente == DEVUELTO || siguiente == VENCIDO
        else        -> false
    }
}

fun main() {
    val estado = EstadoPrestamo.EN_PRESTAMO
    println(estado.descripcion) 
    println(estado.esTerminal) 

    val icono = when (estado) {
        EstadoPrestamo.SOLICITADO  -> "⏰"
        EstadoPrestamo.EN_PRESTAMO -> "⏳"
        EstadoPrestamo.DEVUELTO    -> "✅"
        EstadoPrestamo.VENCIDO     -> "❌"
        EstadoPrestamo.CANCELADO   -> "🚫"
    }
    println(icono) 

    println(estado.puedeTransicionarA(EstadoPrestamo.DEVUELTO))  
}