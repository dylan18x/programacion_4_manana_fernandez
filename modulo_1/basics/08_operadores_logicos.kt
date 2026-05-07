fun main() {
    println("Operadores Logicos")
    val esMayor = true
    val tienePermiso = false
    val estaActivo = true

    println("&& - And Logico")
    println("$esMayor && $tienePermiso = ${esMayor && tienePermiso}")
    println("$esMayor && $estaActivo = ${esMayor && estaActivo}")

    println("----------------------")
    println("|| - Or Logico")
    println("$esMayor || $tienePermiso = ${esMayor || tienePermiso}")
    println("$esMayor || $estaActivo = ${esMayor || estaActivo}")

    println("----------------------")
    println("! - Not")
    println("! $esMayor = ${!esMayor}")
    println("! $estaActivo = ${!estaActivo}")

}