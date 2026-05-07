fun main() {
    val mediciones =6
    var totalTemperatura = 0.0
    var contadorFiebre = 0
    repeat(mediciones){i->
        println("Ingrese temperatura ${i+1}")
        val temperatura = readLine()?.toDoubleOrNull()?:0.0
        if(temperatura > 38.5){
            contadorFiebre ++;
        }
        totalTemperatura += temperatura
    }
    val promedio = totalTemperatura / mediciones
    println("El promedio es de $promedio")
    if(contadorFiebre >= 2){
        println("El paciente tuvo fiebre sostenida")
    }
}