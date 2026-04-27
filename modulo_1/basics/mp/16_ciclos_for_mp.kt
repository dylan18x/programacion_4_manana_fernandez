fun main() {
  println("Controles de flujo iteraciones - ciclos repetitivos ciclos for")
  println("For con rango")
  for( i in 1..5 ){
      println(i)
    }
      
  println("For con rango")
  for( i in 1 until 5 ){
      println(i)
  }
  
  println("For con pasos")
  for(i in 1..10 step 3){
      println(i)
  }
  
  println("For descendente")
  for(i in 10 downTo 1){
      println(i)
  }
  
  println("For con listas")
  val nombres = listOf("Don Quijote", "Cien Años", "Hamlet")
  for(nombre in nombres){
      println(nombre)
  }
  
  println("For con listas index valor")
  
  for((index, valor) in nombres.withIndex()){
      println("$index->$valor")
  }
  
  println("For con break")
  for(i in 1..10){
      if(i==5){
      break;
      }
  }
  
  println("For con continue")
  for(i in 1..10){
      if(i==3){
        continue;
      }
      println("item $i")
  }
  
  println("For con continue")
  for(i in 1..10){
      if(i==3)continue;
      if(i==7)break;
      println("item $i")
  }
  
  val pacientes = listOf(
    Triple("Cien Años de Soledad", 5.0, 98),
    Triple("Don Quijote", 2.0, 94),
    Triple("Hamlet", 0.0, 91),
  )
  
  for((posicion, paciente) in pacientes.withIndex()){
      val (nombre, cantidad, estado) = paciente
      val alertaCantidad = if(cantidad <= 2.0) "Pocos ejemplares" else "Disponible"
      val alertaEstado = if(estado <95.0) "Revisión" else "Buen estado"
      println("Estante $posicion - $nombre - Cantidad: $cantidad $alertaCantidad - Estado: $estado $alertaEstado")
  }
}