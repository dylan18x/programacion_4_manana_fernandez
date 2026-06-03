interface Serializable {
    val id: String                    
    fun serializar(): String       
    val version: Int get() = 1       
}

interface Validable {
    val errores: List<String>
    val esValido: Boolean get() = errores.isEmpty()

    fun validar(): Boolean
    fun imprimirErrores() {              
        if (errores.isEmpty()) println("Sin errores")
        else errores.forEach { println("  ❌ $it") }
    }
}

data class Prestamo(
    override val id: String,
    val socio:       String,
    val libros:      List<String>,
    val total:       Double
) : Serializable, Validable {

    override fun serializar() =
        "$id|$socio|${libros.joinToString(",")}|$total"

    override val errores: List<String> get() = buildList {
        if (socio.isBlank())   add("El socio no puede estar vacío")
        if (libros.isEmpty())  add("El préstamo debe tener al menos un libro")
        if (total <= 0)        add("El total debe ser mayor que cero")
    }

    override fun validar() = esValido
}

fun main() {
    val prestamo1 = Prestamo("PR001", "Ana", listOf("Kotlin", "Clean Code"), 119.98)
    val prestamo2 = Prestamo("PR002", "",    emptyList(),                    -5.0)

    fun procesarSerializable(s: Serializable) = println("→ ${s.serializar()}")
    fun procesarValidable(v: Validable) {
        println("Válido: ${v.esValido}")
        v.imprimirErrores()
    }

    procesarSerializable(prestamo1)   
    procesarValidable(prestamo1)    
    procesarValidable(prestamo2)    
}