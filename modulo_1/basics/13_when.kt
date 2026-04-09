fun main() {
    println("Controles de Flujo When")
    println("Escribir codigo")
    val codigo =readLine()?.toIntOrNull()?:0
    val especialidad = when(codigo){
        1->"Mediciona General"
        2->"Pediatria"
        3->"Cardiologica"
        4->"Ginecologica"
        5->"Neurologia"
        6->"Dermatologia"
        else->"Especialidad no registrada en el sistema"
    }
    println("Especialidad: $especialidad")
    
}