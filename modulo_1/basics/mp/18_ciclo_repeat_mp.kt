fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos-Cilo Repeat")
    println("Cuantos libros desea registrar")
    val mediciones = readLine()?.toIntOrNull() ?: 0

    var totalLibros = 0

    repeat(mediciones){ i ->
        println("Registro ${i+1} (cantidad de libros)")
        val libros = readLine()?.toIntOrNull() ?: 0
        totalLibros += libros
    }

    val promedio = totalLibros / mediciones

    println("Promedio de libros registrados $promedio")
    println("Clasificacion: ${
        when{
            promedio < 5 -> "Stock Bajo"
            promedio <= 20 -> "Normal"
            else -> "Stock Alto"
        }
    }")
}