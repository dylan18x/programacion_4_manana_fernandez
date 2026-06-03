class TarjetaBiblioteca(socio: String, depositoInicial: Double) {

    val socio: String = socio

    private var saldo: Double = depositoInicial

    internal val numeroTarjeta: String =
        "BIB${(100000..999999).random()}"

    protected open fun calcularMulta(): Double = saldo * 0.02

    fun recargar(monto: Double) {
        require(monto > 0) { "El monto debe ser positivo" }
        saldo += monto
        println("Recargado: $${"%.2f".format(monto)} | Nuevo saldo: ${consultarSaldo()}")
    }

    fun descontar(monto: Double): Boolean {
        require(monto > 0) { "El monto debe ser positivo" }
        if (monto > saldo) {
            println("Saldo insuficiente")
            return false
        }
        saldo -= monto
        println("Descontado: $${"%.2f".format(monto)} | Nuevo saldo: ${consultarSaldo()}")
        return true
    }

    fun consultarSaldo(): String = "$${"%.2f".format(saldo)}"
}

fun main() {
    val tarjeta = TarjetaBiblioteca("Ana García", 1000.0)

    tarjeta.recargar(500.0)
    tarjeta.descontar(200.0)
    tarjeta.descontar(2000.0)

    println(tarjeta.socio)
    println(tarjeta.consultarSaldo())
}