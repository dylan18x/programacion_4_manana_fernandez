
fun main() {
    val pacientes = 5
    var pacientesNormales = 0
    println("Sistema de Glucosa")
    repeat(pacientes){i->
        println("Ingrese su Glucosa paciente ${i+1}: ")
        val glucosa = readLine()?.toIntOrNull()?:0
        if(glucosa < 70){
            println("Tiene glucosa Baja")
        } else if(glucosa >= 70 && glucosa <= 99){
            println("Tiene glucosa Normal")
            pacientesNormales += 1;
        } else if(glucosa >= 100 && glucosa <= 125){
            println("Tiene Prediabetes")
        } else if(glucosa >= 126){
            println("Tiene Diabetes")
        }
    }
    println("Total pacientes normales: $pacientesNormales")
}
