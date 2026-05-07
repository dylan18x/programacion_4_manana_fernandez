fun main(){
    var contadorUrgentes = 0
    for(i in 1..4) {
        println("Ingrese nombre del producto $i: ")
        var producto = readLine()!!
        println("Ingrese stock actual del producto $i: ")
        var stock = readLine()!!.toInt()
        when{
            stock < 5 -> {
                println("$producto: Reposicion urgente")
                contadorUrgentes ++;
            }
            stock < 10 -> println("$producto: Reposicion pronto")
            else -> println("$producto: Stock suficiente")
        }
    }
    println("Total de productos con Reposicion urgente: $contadorUrgentes")
}