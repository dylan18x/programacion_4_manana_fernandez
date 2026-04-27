fun main() {
    println("Controles de Flujo")
    println("Condicional If")
    println("Ingrese la cantidad de libros disponibles: ")
    val cantidadLibros = readLine()?.toDoubleOrNull() ?: 10.0

    if(cantidadLibros <= 5.0){
        println("Pocos libros disponibles: realizar reposición")
    }
    if(cantidadLibros == 0.0){
        println("Sin libros disponibles: préstamo no permitido")
    }

    println("Cantidad registrada: $cantidadLibros libros")
}