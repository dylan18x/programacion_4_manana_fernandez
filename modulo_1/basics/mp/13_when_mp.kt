fun main() {
    println("Controles de Flujo When")
    println("Escribir codigo")
    val codigo = readLine()?.toIntOrNull() ?: 0

    val especialidad = when(codigo){
        1 -> "Novela"
        2 -> "Ciencia"
        3 -> "Historia"
        4 -> "Matematicas"
        5 -> "Tecnologia"
        6 -> "Literatura"
        else -> "Categoría no registrada en el sistema"
    }

    println("Especialidad: $especialidad")
}