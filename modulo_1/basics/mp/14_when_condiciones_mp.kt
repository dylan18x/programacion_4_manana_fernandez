fun main() {
    println("Controles de flujo When con condiciones arbitrarias")
    println("Escribir codigo")
    println("Edad del usuario: ")
    val edadUsuario = readLine()?.toIntOrNull() ?: 0

    println("Tiene carnet de biblioteca?: ")
    val tieneCarnet = readLine()?.trim()?.lowercase() == "s"

    val nivelCarnet = if(tieneCarnet){
        println("Nivel del carnet (BASICO/INTERMEDIO/PREMIUM)")
        readLine()?.trim()?.uppercase() ?: ""
    } else ""

    val multa = when {
        !tieneCarnet && edadUsuario < 18 -> 0.0
        !tieneCarnet && edadUsuario >= 65 -> 15.0
        !tieneCarnet -> 45.0
        nivelCarnet == "BASICO" -> 20.0
        nivelCarnet == "INTERMEDIO" -> 10.0
        nivelCarnet == "PREMIUM" -> 0.0
        else -> 30.0
    }

    println("Multa: $${"%.2f".format(multa)}")
}