fun main() {
    println("Controles de Flujo")
    println("Condicional If-Multiples condiciones")
    println("Cantidad de libros disponibles: ")
    val cantidadLibros = readLine()?.toIntOrNull() ?: 0
    
    val clasificacion = if(cantidadLibros <= 5){
        "Stock Bajo"
    } else if(cantidadLibros <= 20){
        "Stock Normal"
    } else if(cantidadLibros <= 50){
        "Stock Bueno"
    } else if(cantidadLibros <= 100){
        "Stock Alto"
    } else if(cantidadLibros <= 200){
        "Stock Muy Alto"
    } else{
        "Exceso de Inventario"
    }

    println("Clasificacion: $clasificacion")
}