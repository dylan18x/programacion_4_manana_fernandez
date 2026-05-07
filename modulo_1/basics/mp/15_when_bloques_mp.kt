fun main() {
    println("Controles de Flujo When con bloques de codigos")
    println("Nombre del libro: ")
    val nombreLibro = readLine()?.trim()?.lowercase() ?: "Sin registro"

    println("Tiene Nivel de prioridad (ALTA/MEDIA/BAJA/MINIMA)")
    val nivel = readLine()?.trim()?.uppercase() ?: ""

    when (nivel) {
        "ALTA" -> {
            println("PRIORIDAD ALTA: Libro: $nombreLibro")
            println("Registrar préstamo inmediato")
            println("Actualizar inventario urgente")
        }
        "MEDIA" -> {
            println("PRIORIDAD MEDIA: Libro: $nombreLibro")
            println("Revisar disponibilidad en estantería")
            println("Actualizar en 15 minutos")
        }
        "BAJA" -> {
            println("PRIORIDAD BAJA: Libro: $nombreLibro")
        }
        "MINIMA" -> {
            println("PRIORIDAD MINIMA: Libro: $nombreLibro continuar en espera normal")
        }
        else -> println("nivel no reconocido")
    }
}