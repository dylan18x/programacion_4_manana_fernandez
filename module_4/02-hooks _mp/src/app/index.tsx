// app/index.tsx
import { Text, View } from 'react-native'
import { Paso1 } from './components/Paso1'

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  useState — contador de solicitudes de préstamo       │
// │  2  Paso 2  useEffect — verificación periódica de disponibilidad     │
// │  3  Paso 3  useRef — búsqueda de ISBN y registro sin re-render     │
// │  4  Paso 4  Hooks nativos de RN — dimensiones, modo lectura       │
// │  5  Paso 5  Custom hook — useCatalogoBiblioteca                  │
// │  6  Paso 6  Ejemplo combinado — gestión integral de biblioteca   │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 1

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />
    default:
      return (
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
          <Text>Paso {PASO}: crea la pantalla primero</Text>
        </View>
      )
  }
}
