fun main() {
    println("Consultas")
    println("Tipos de consultas")
    println("1. Agendada")
    println("2. En curso")
    println("3. Finalizada")
    println("Escoga una opcion: ")
    val op =readLine()?.toInt()
    if(op == 2){
    println("Ingrese minutos transcurridos: ")
        val tiempo = readLine()?.toDouble()?:0.0
        if(tiempo > 30){
            println("Consulta Extendida")
        } else {
            println("Consulta no Extendida")
        }
    }
}