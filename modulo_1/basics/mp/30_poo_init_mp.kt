class Socio(val nombre: String, val email: String) {
    val nombreNormalizado: String
    val dominioEmail: String

    init {
        require(nombre.isNotBlank()) { "El nombre no puede estar vacío" }
        require(email.contains("@")) { "Email inválido: $email" }

        nombreNormalizado = nombre.trim().lowercase()
        dominioEmail      = email.substringAfter("@")
    }
}

fun main() {
    val s = Socio("  Ana García  ", "ana@biblioteca.dev")
    println(s.nombreNormalizado)  
    println(s.dominioEmail)       

}