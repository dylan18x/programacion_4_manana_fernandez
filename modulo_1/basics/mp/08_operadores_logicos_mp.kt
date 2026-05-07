fun main() {
    println("Operadores Logicos")
    val libroDisponible = true
    val tieneMulta = false
    val usuarioActivo = true

    println("&& - And Logico")
    println("$libroDisponible && $tieneMulta = ${libroDisponible && tieneMulta}")
    println("$libroDisponible && $usuarioActivo = ${libroDisponible && usuarioActivo}")

    println("----------------------")
    println("|| - Or Logico")
    println("$libroDisponible || $tieneMulta = ${libroDisponible || tieneMulta}")
    println("$libroDisponible || $usuarioActivo = ${libroDisponible || usuarioActivo}")

    println("----------------------")
    println("! - Not")
    println("! $libroDisponible = ${!libroDisponible}")
    println("! $usuarioActivo = ${!usuarioActivo}")

}