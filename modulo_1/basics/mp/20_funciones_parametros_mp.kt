fun main() {
    println("Funcinoes-Parametros por defecto")
    println(crearUsuario("Cien Años de Soledad",25,"Novela",true))
    println(crearUsuario("Don Quijote"))
    println(crearUsuario("Hamlet",30))
    println(crearUsuario("El Principito",30,"Literatura"))
    
    //argumentos nombrados
    println(crearUsuario(edad=30,nombre="Matemáticas Básicas",activo=false))
    
}

fun crearUsuario(
    nombre: String,
    edad: Int = 18,
    rol: String = "General",
    activo: Boolean = true
    ): String{
        return "Libro[$nombre, paginas=$edad, categoria=$rol, disponible=$activo]"
}