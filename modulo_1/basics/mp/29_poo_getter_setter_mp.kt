class AntiguedadLibro(anios: Double) {
    var anios: Double = anios
        set(value) {
            require(value >= 0.0) { "Los años no pueden ser negativos" }
            field = value 
        }

    val decadas: Double
        get() = anios / 10.0

    val siglos: Double
        get() = anios / 100.0

    val descripcion: String
        get() = when {
            anios < 1   -> "Nuevo"
            anios < 10  -> "Reciente"
            anios < 50  -> "Moderno"
            anios < 100 -> "Antiguo"
            else        -> "Muy antiguo"
        }
}

fun main() {
    val libro = AntiguedadLibro(20.0)
    println("${libro.anios} años = ${libro.decadas} décadas = ${libro.siglos} siglos")
    println(libro.descripcion)  

    libro.anios = 5.0
    println("${libro.anios} años → ${libro.descripcion}")  

}