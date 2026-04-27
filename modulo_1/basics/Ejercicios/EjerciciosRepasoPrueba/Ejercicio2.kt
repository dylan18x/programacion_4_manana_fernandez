fun calcularBono(sueldo: Double, anios: Int): Double {
    var bono = 0.0
    if(anios <= 0){
        bono = sueldo * 0.0
    } else if (anios <=3){
        bono = sueldo * 0.05
    } else if (anios <=7){
        bono = sueldo * 0.10
    } else {
        bono = sueldo * 0.15
    }
    return bono;
}

fun main(){
    println("Calculo de Bono ")
    println("Ingrese su sueldo: ")
    val sueldo = readLine()!!.toDouble()
    println("Ingrese sus anios en la empresa: ")
    val anios = readLine()!!.toInt()
    val bono = calcularBono(sueldo,anios)
    println("Sueldo: $sueldo")
    println("Bono: $bono")
    println("Total a pagar: ${sueldo +bono}")
}
