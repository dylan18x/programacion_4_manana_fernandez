fun main(){
    var subtotal = 0.0
    for(i in 1..3){
        println("PRODUCTO NRO.${i}")
        println("Ingrese el nombre del producto: ")
        val nombre = readLine()!!
        println("Ingrese el precio del producto: ")
        val precio = readLine()!!.toDouble()
        println("Ingrese la cantidad del producto: ")
        val cantidad = readLine()!!.toInt()
        subtotal += (precio * cantidad)
    }
    val descuento = if (subtotal > 100) subtotal * 0.10 else 0.0
    val total = subtotal - descuento
    println("Subtotal: $subtotal ")
    println("Descuento: $descuento")
    println("Total: $total")
}