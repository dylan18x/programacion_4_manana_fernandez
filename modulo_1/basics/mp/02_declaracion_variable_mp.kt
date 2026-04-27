fun main() {
    //No mutable
	val libro="Don Quijote de la Mancha"
    val copias: Int =11
    val pi= 15.45
	
    //Mutable
    var contadorCopias = 0
    contadorCopias = contadorCopias + 1
    println(contadorCopias)
    contadorCopias = contadorCopias - 1
    println(contadorCopias)
    
    println("El libro $libro tiene $copias copias")
}