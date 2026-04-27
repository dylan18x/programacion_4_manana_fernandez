fun main() {
    //Tipos de Datos
    //Numeros Enteros
    val sucursales: Byte=3
    println("Sucursales: $sucursales")
    val cantidad: Short=32
    println("Cantidad del libro $cantidad")
    val libro_id: Int=12
    println(" El id del libro es: $libro_id")
    val ISB: Long=9780306406157L
    println("ISB del libro: $ISB")
    
    println("Numeros Decimales")
    val precioLibro: Float= 16.89f
    println("Precio del libro: $precioLibro")
    val multaPorDia: Double= 0.50
    println("Multa por dia: $multaPorDia")
    
    //Inferido
    val nombre="Juana"
    val edad=56
    
    //Inferido
    val nombreLibro = "Cien Años de Soledad"
    val cantidadPaginas = 350

    println("Nombre del libro: $nombreLibro")
    val nombreTipo = nombreLibro::class.simpleName
    println("Tipo Inferido nombreLibro: $nombreTipo")
    println("Tipo Inferido nombreLibro: ${nombreLibro::class.simpleName}")

    println("Cantidad de páginas: $cantidadPaginas")
    val paginasTipo = cantidadPaginas::class.simpleName
    println("Tipo Inferido cantidadPaginas: $paginasTipo")
    println("Tipo Inferido cantidadPaginas: ${cantidadPaginas::class.simpleName}")
        
}