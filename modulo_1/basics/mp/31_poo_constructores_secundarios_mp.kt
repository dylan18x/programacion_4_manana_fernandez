class Estante(val ancho: Double, val alto: Double) {
    val area:      Double get() = ancho * alto
    val perimetro: Double get() = 2 * (ancho + alto)

    constructor(lado: Double) : this(lado, lado)
    constructor(ancho: Int, alto: Int) : this(ancho.toDouble(), alto.toDouble())

    override fun toString() = "Estante(${ancho}x${alto}) | área=${area}"
}

fun main() {
    val e1 = Estante(5.0, 3.0)
    val e2 = Estante(4.0)       
    val e3 = Estante(6, 2)      
    println(e1)  
    println(e2) 
}