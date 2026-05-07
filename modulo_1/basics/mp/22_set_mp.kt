fun main() {
  println("Set")

  val numeros = setOf(1,2,3,4,8,4,1,3)
  println("nuemros set: ${numeros}")

  println("Operaciones de conjuntos")
  val pares = setOf(2,4,6,8,10)
  val multiplos3 = setOf(3,6,9,12)

  println("Pares set: $pares")
  println("Multiplos3 set: ${multiplos3}")

  println("Union: ${pares union multiplos3}")
  println("Interseccion: ${pares intersect multiplos3}")
  println("Substraccion: ${pares subtract multiplos3}")

  println("Pares set: ${pares}")
  println("Multiplos3 set: ${multiplos3}")
  
  println("Set Mutable")
  val tags = mutableSetOf("Novela","Ciencia","Tecnologia")

  println(tags)

  tags.add("Novela")
  println(tags)

  tags.add("Historia")
  println(tags)

  tags.remove("Ciencia")
  println(tags)

  println("Verificar si elemento existe ${"Novela" in tags}")
  println("Verificar si elemento existe ${"Ciencia" in tags}")
}