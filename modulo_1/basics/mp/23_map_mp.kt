fun main() {
    println("Map Inmutable")

    val capitales = mapOf(
        "Novela" to "Don Quijote",
        "Drama" to "Hamlet",
        "Realismo Magico" to "Cien Años de Soledad",
        "Infantil" to "El Principito"
    )

    println(capitales["Novela"])
    println(capitales["Historia"])
    println(capitales.getOrDefault("Novela","Desconocido"))
    println(capitales.getOrDefault("Historia","Desconocido"))
    println(capitales)
    println(capitales.keys)
    println(capitales.values)
    println(capitales.entries)

    for((pais, capital) in capitales){
        println("$pais - $capital")
    }

    println("Map mutable")

    val inventario = mutableMapOf(
        "Novelas" to 10,
        "Enciclopedias" to 4,
        "Diccionarios" to 12,
        "Revistas" to 8
    )

    inventario["Cuentos"] = 5
    println(inventario)

    inventario["Novelas"] = 20
    println(inventario)

    inventario.remove("Revistas")
    println(inventario)

    inventario.getOrPut("Tesis"){15}
    println(inventario)

    inventario.getOrPut("Diccionarios"){15}
    println(inventario)
}