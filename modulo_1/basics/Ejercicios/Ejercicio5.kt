fun main() {
    var codigo: String
    while(true){
        println("Menu")
        println("1. Saludar")
        println("2. Sumar")
        println("3. Tabla")
        println("4. Salir")
        val codigo =readLine()?.toIntOrNull()?:0
        var menuOp = when(codigo){
            1->"Saludar"
            2->"Sumar"
            3->"Tabla"
            4->"Salir"
            else->"Opcion invalida, escoga del 1 al 4"
        }
        println("Opcion $codigo")
        if(codigo == 1){
            println("Ingresa tu nombre: ")
            var nombre = readLine()?.trim()?.lowercase()?:""
            println("Hola como estas $nombre ")
        } else if(codigo == 2){
            println("Ingrese numero 1: ")
            var num1 = readLine()?.toIntOrNull()?:0
            println("Ingrese numero 2: ")
            var num2 = readLine()?.toIntOrNull()?:0
            println("La suma $num1 + $num2 es ${num1+num2}")
        } else if(codigo == 3){
            println("Ingrese numero para ver su tabla de multiplciar")
            var numTabla = readLine()?.toIntOrNull()?:0
            for(i in 1..11){
                println("$i x $numTabla = ${i*numTabla}")
            }
        } else if(codigo == 4){
            println("Gracias por usar el programa :D")
            break
        }
    }
}