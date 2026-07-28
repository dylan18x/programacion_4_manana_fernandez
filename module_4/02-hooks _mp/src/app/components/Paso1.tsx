// app/index.tsx — reemplaza la función Paso1 (Control de Biblioteca)
import { useState } from 'react'
import { Pressable, StyleSheet, Text, View } from 'react-native'

export function Paso1() {
  const [intentosPrestamo, setIntentosPrestamo] = useState<number>(0)
  const [prestamoAprobado, setPrestamoAprobado] = useState<boolean>(false)

  function manejarSolicitudPrestamo() {
    if (prestamoAprobado) return
    setIntentosPrestamo(intentosPrestamo + 1)
    // Simula disponibilidad del libro al tercer intento
    if (intentosPrestamo >= 3) {
      setPrestamoAprobado(true)
    }
  }

  function reiniciarSimulacion() {
    setIntentosPrestamo(0)
    setPrestamoAprobado(false)
  }

  const estadoPrestamoTexto = prestamoAprobado
    ? '✓ Préstamo Autorizado: Cien Años de Soledad'
    : `Intento de solicitud ${intentosPrestamo} de 3 - Buscando ejemplar`

  const colorEstadoBiblioteca = prestamoAprobado ? '#1b5e20' : '#b71c1c'

  return (
    <View style={styles.contenedor}>
      <Text style={styles.titulo}>Control de Préstamo de Libros</Text>

      <View style={[styles.tarjeta, { borderColor: colorEstadoBiblioteca }]}>
        <Text style={[styles.estado, { color: colorEstadoBiblioteca }]}>
          {estadoPrestamoTexto}
        </Text>
        <Text style={styles.detalle}>Biblioteca Central · Sala 01 · Estante B-4</Text>
      </View>

      <Pressable
        style={({ pressed }) => [
          styles.boton,
          prestamoAprobado ? styles.botonDeshabilitado : styles.botonActivo,
          pressed && !prestamoAprobado && { opacity: 0.75 },
        ]}
        onPress={manejarSolicitudPrestamo}
        disabled={prestamoAprobado}
      >
        <Text style={styles.textoBoton}>
          {prestamoAprobado ? 'Préstamo Activo' : 'Solicitar Préstamo de Libro'}
        </Text>
      </Pressable>

      <Pressable style={styles.botonSecundario} onPress={reiniciarSimulacion}>
        <Text style={styles.textoSecundario}>Reiniciar solicitud de biblioteca</Text>
      </Pressable>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    backgroundColor: '#f4f1ea',
    gap: 16,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#2c1d11',
  },
  tarjeta: {
    width: '100%',
    padding: 16,
    borderRadius: 10,
    borderWidth: 2,
    backgroundColor: '#fff',
    gap: 6,
  },
  estado: {
    fontSize: 15,
    fontWeight: '600',
  },
  detalle: {
    fontSize: 13,
    color: '#5d4037',
  },
  boton: {
    width: '100%',
    paddingVertical: 14,
    borderRadius: 8,
    alignItems: 'center',
  },
  botonActivo: {
    backgroundColor: '#4a148c',
  },
  botonDeshabilitado: {
    backgroundColor: '#a5d6a7',
  },
  textoBoton: {
    color: '#fff',
    fontWeight: '600',
    fontSize: 15,
  },
  botonSecundario: {
    paddingVertical: 10,
  },
  textoSecundario: {
    color: '#4a148c',
    fontSize: 14,
  },
})