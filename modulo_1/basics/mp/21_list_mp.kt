fun main() {
  println("Listas")
  val frutas = listOf("Don Quijote","Hamlet","Cien Años","Hamlet","El Principito")

  println("Size: ${frutas[0]}")
  println("Mostrar el elemento indice 0: ${frutas[0]}")
  println("Mostrar el primer elemento: ${frutas.first()}")
  println("Mostrar el ultimo elemento: ${frutas.last()}")

  println("Mostrar el elemento indice 2: ${frutas.get(2)}")
  println("Mostrar indice contenido elemento: ${frutas.indexOf("Hamlet")}")
  println("Verificar existencia de elemento: ${frutas.contains("Cien Años")}")
  println("Verificar existencia de un elemento: ${"Hamlet" in frutas}")

  //sublista
  println("Sublista: ${frutas.subList(1,3)}")
  println("Tomar primeros 2 elementos: ${frutas.take(2)}")
  println("Suprimir tres primeros elementos: ${frutas.drop(3)}")
  println("Tomar los ultimos dos elementos: ${frutas.takeLast(2)}")

  for(fruta in frutas){
      println(fruta)
  }

  println("Listas-Mutable")
  val colores = mutableListOf("Novela","Ciencia","Historia","Matemáticas")
  println(colores)

  colores.add("Tecnología")
  println(colores)

  colores.add(0,"Literatura")
  println(colores)

  colores.remove("Tecnología")
  println(colores)

  colores[1] = "Filosofía"
  println(colores)

  println("Array deque")
  val deque = ArrayDeque<Int>()
  println(deque)

  deque.addFirst(1)
  println(deque)

  deque.addLast(2)
  println(deque)

  deque.addLast(0)
  println(deque)

  deque.removeFirst()
  println(deque)

  deque.removeLast()
  println(deque)
}