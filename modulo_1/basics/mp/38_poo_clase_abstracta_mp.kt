abstract class SeccionBiblioteca(val nombre: String) {
    abstract val capacidadLibros: Double
    abstract val metrosCuadrados: Double
    abstract fun descripcion(): String

    fun comparar(otra: SeccionBiblioteca): String = when {
        capacidadLibros > otra.capacidadLibros -> "$nombre tiene más capacidad que ${otra.nombre}"
        capacidadLibros < otra.capacidadLibros -> "$nombre tiene menos capacidad que ${otra.nombre}"
        else                                   -> "$nombre y ${otra.nombre} tienen la misma capacidad"
    }

    override fun toString() = "${descripcion()} | Capacidad: ${"%.2f".format(capacidadLibros)} libros"
}

class SalaLectura(val puestos: Double) : SeccionBiblioteca("Sala de lectura") {
    override val capacidadLibros:  Double get() = puestos * 2
    override val metrosCuadrados:  Double get() = puestos * 1.5
    override fun descripcion() = "Sala de lectura con $puestos puestos"
}

class Estanteria(val ancho: Double, val alto: Double) : SeccionBiblioteca("Estantería") {
    override val capacidadLibros:  Double get() = ancho * alto
    override val metrosCuadrados:  Double get() = ancho * alto
    override fun descripcion() = "Estantería de ${ancho}x${alto}"
}

class DepositoArchivo(val lado: Double) : SeccionBiblioteca("Depósito") {
    override val capacidadLibros:  Double get() = (Math.sqrt(3.0) / 4) * lado * lado
    override val metrosCuadrados:  Double get() = lado * lado
    override fun descripcion() = "Depósito de archivo de lado $lado"
}

fun main() {
    val secciones: List<SeccionBiblioteca> = listOf(
        SalaLectura(5.0),
        Estanteria(4.0, 6.0),
        DepositoArchivo(8.0)
    )

    secciones.forEach { println(it) }  

    val mayor = secciones.maxByOrNull { it.capacidadLibros }
    println("\nSección con mayor capacidad: ${mayor?.nombre}")

    println(secciones[0].comparar(secciones[1]))
}