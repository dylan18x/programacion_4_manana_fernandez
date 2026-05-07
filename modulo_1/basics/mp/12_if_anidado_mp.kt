fun main() {
    println("Controles de Flujo")
    println("Condicional If-Multiples condiciones")
    println("¿Tiene multas pendientes? (s/n)")
    val tieneMultas = readLine()?.trim()?.lowercase() == "s"
    println("Cantidad de libros prestados")
    val cantidadLibros = readLine()?.toIntOrNull() ?: 0
    
    if(tieneMultas){
        print("Usuario con multas pendientes ")
        if(cantidadLibros > 5){
            println("Límite de préstamo excedido")
        } else if(cantidadLibros == 0){
            println("Sin libros prestados")
        } else{
            println("Préstamo controlado")
        }
    } else{
        print("Usuario sin multas pendientes ")
        if(cantidadLibros > 5 || cantidadLibros == 0){
            println("Cantidad fuera del rango normal")
        } else{
            println("Cantidad de préstamo normal")
        }
    }
}