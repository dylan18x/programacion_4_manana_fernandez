fun main() {
    println("Ingrese num1: ")
    val num1 = readLine()!!.toInt()
    println("Ingrese num2: ")
    val num2 = readLine()!!.toInt()
    
    println("Suma")
    println("$num1 + $num2 = ${num1+num2}")
    println("Resta")
    println("$num1 - $num2 = ${num1-num2}")
    println("Multiplicacion")
    println("$num1 * $num2 = ${num1*num2}")
    println("Division")
    println("$num1 / $num2 = ${num1/num2}")
}