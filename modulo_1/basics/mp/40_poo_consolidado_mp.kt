sealed class NotificacionBiblioteca(val titulo: String, val mensaje: String) {
    abstract fun formatear(): String  

    data class Email(
        val destinatario: String,
        val asunto:       String,
        val cuerpo:       String
    ) : NotificacionBiblioteca(asunto, cuerpo) {
        override fun formatear() =
            "📧 Email → $destinatario\n   Asunto: $titulo\n   ${mensaje.take(50)}..."
    }

    data class Push(val dispositivo: String, val icono: String = "🔔")
        : NotificacionBiblioteca("Push", "") {
        override fun formatear() = "$icono Push → $dispositivo: $titulo"
    }

    data class Sms(val telefono: String, val texto: String)
        : NotificacionBiblioteca("SMS", texto) {
        override fun formatear() = "📱 SMS → $telefono: ${texto.take(160)}"
    }

    object Silenciosa : NotificacionBiblioteca("", "") {
        override fun formatear() = "🔕 Notificación silenciosa"
    }
}

interface EnviadorNotificacion {
    val nombre: String
    fun enviar(notificacion: NotificacionBiblioteca): Boolean
}

class ServicioEmail : EnviadorNotificacion {
    override val nombre = "Email"
    override fun enviar(n: NotificacionBiblioteca): Boolean {
        if (n !is NotificacionBiblioteca.Email) return false
        println("  [EMAIL] → ${n.destinatario}")
        return true
    }
}

class ServicioPush : EnviadorNotificacion {
    override val nombre = "Push"
    override fun enviar(n: NotificacionBiblioteca): Boolean {
        if (n !is NotificacionBiblioteca.Push) return false
        println("  [PUSH] → ${n.dispositivo}")
        return true
    }
}

class Dispatcher(private val servicios: List<EnviadorNotificacion>) {

    fun enviar(notificacion: NotificacionBiblioteca) {
        println(notificacion.formatear()) 
        val exito = servicios.any { it.enviar(notificacion) }
        if (!exito) println("  ⚠️ Sin servicio disponible")
        println()
    }
}

fun main() {
    val dispatcher = Dispatcher(listOf(ServicioEmail(), ServicioPush()))

    listOf(
        NotificacionBiblioteca.Email("socio@biblioteca.com", "Devolución pendiente", "Tu libro está por vencer."),
        NotificacionBiblioteca.Push("iPhone-Ana"),
        NotificacionBiblioteca.Sms("+593900000000", "Tu reserva está lista"),
        NotificacionBiblioteca.Silenciosa
    ).forEach { dispatcher.enviar(it) }
}