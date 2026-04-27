fun main() {
    println("Controles de Flujo")
    println("Condicional If")
    println("Tiene carnet de biblioteca s/n: ")
    val tieneCarnet = readLine()?.trim()?.lowercase() == "s"
    println("Costo de multa: ")
    val costoBase = readLine()?.toDoubleOrNull() ?: 0.0

    if(tieneCarnet){
        val descuento = costoBase * 0.80
        println("Descuento aplicado: $${"%.2f".format(descuento)}")
    } else {
        println("Pago completo: $${"%.2f".format(costoBase)}")
    }
}