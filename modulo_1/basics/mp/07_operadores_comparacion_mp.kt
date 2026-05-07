fun main() {
    println("Operadores de Comparacion")
    val librosDisponibles = 15
    val librosPrestados = 10
    println("$librosDisponibles == $librosPrestados = ${librosDisponibles==librosPrestados}")
    println("$librosDisponibles .equals $librosPrestados = ${librosDisponibles.equals(librosPrestados)}")
    println("$librosDisponibles != $librosPrestados = ${librosDisponibles!=librosPrestados}")
    println("$librosDisponibles > $librosPrestados = ${librosDisponibles>librosPrestados}")
    println("$librosDisponibles >= $librosPrestados = ${librosDisponibles>=librosPrestados}")
    println("$librosDisponibles < $librosPrestados = ${librosDisponibles<librosPrestados}")
    println("$librosDisponibles <= $librosPrestados = ${librosDisponibles<=librosPrestados}")
}