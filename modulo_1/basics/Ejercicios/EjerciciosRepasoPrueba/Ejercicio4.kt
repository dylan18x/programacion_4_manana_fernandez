fun main(){
    var compra = 0.0
    var contadorCompra = 0
    var totalCompra = 0.0
    var valor = 0
    do{
        println("Ingrese el valor de su compra ${valor + 1}: ")
        compra = readLine()!!.toDouble()
        if (compra > 500) contadorCompra +=1
        totalCompra += compra
        valor ++;
    } while (compra!=0.0)
    println("Total general comprado: $totalCompra")
    println("Cantidad de ordenes mayores a 500: $contadorCompra")
    if(totalCompra > 2000) println("Presupuesto excedido") else
     "Presupuesto disponible"
}