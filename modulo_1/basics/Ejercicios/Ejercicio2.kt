fun main() {
    println("Ayunas")
    println("Tipo de examen")
    println("1.Laboratorio")
    println("2.Imagen")
    println("Escoga 1 o 2: ")
    val examen = readLine()?.toInt()
    if(examen == 1){
        println("Examen Laboratorio: Ayuno 8-12h, sin grasas")
    }
    if(examen == 2){
        println("Examen Imagen: No es necesario ayunas")
    }
}