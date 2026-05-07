fun main() {
    //Tipos de Datos
    //Numeros Enteros
    val numero1: Byte=127
    println("Numero Byte $numero1")
    val numero2: Short=32_765
    println("Numero Short $numero2")
    val numero3: Int=12
    println("Numero Int $numero3")
    val numero4: Long=2_122_122_122_123_123_987L
    println("Numero Long $numero4")
    
    println("Numeros Decimales")
    val numero5: Float= 3.14f
    println("Numero Float $numero5")
    val numero6: Double= 3.1444738748
    println("Numero Double $numero6")
    
    //Inferido
    val nombre="Juana"
    val edad=56
    
    println("Nombre $nombre")
    val nombreTipo=nombre::class.simpleName
    println("Tipo Inferido nombre: $nombreTipo")
    println("Tipo Inferido nombre: ${nombre::class.simpleName}")
    println("Edad: $edad")
    val edadTipo=edad::class.simpleName
    println("Tipo Inferido edad: $edadTipo")
    println("Tipo Inferido edad: ${edad::class.simpleName}")
    
    
}