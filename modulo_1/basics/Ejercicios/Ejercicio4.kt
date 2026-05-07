fun main() {
    println("Registro de muestra de laboratorio")
    println("1. Sangre venosa")
    println("2. Orina")
    println("3. Heces")
    println("4. Hisopado nasofaringeo")
    println("5. Biopsia")
    println("Escoga una opcion: ")
    val codigo =readLine()?.toIntOrNull()?:0
    val muestra = when(codigo){
        1->"Sangre venosa"
        2->"Orina"
        3->"Heces"
        4->"Hisopado nasofaringeo"
        5->"Biopsia"
        else->"Especialidad no registrada en el sistema"
    }
    if(codigo == 1){
        println("Especialidad: $muestra")
        println("Tiempo estimado: 4h ")
    } else if (codigo == 2){
        println("Especialidad: $muestra")
        println("Tiempo estimado: 2h ")
    } else if (codigo == 3){
        println("Especialidad: $muestra")
        println("Tiempo estimado: 24h ")
    } else if (codigo == 4){
        println("Especialidad: $muestra")
        println("Tiempo estimado: 6h ")
    } else if (codigo == 5){
        println("Especialidad: $muestra")
        println("Tiempo estimado: 72h")
    }
    
}