package com.ute.compose.ui.material3


import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun Paso01Suma() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text("Paso 1 · TextField y OutlinedTextField",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()
        SumaNumeros()
        HorizontalDivider()
    }
}

// ── Demo 1: campo de búsqueda con limpiar ────────────────────────────────────────────────────────────
@Composable
private fun SumaNumeros() {
    var numero1     by remember { mutableStateOf("") }
    var numero2    by remember { mutableStateOf("") }
    var resultado    by remember { mutableStateOf("") }


    // Validaciones derivadas del estado — se recalculan en cada recomposición

    val numero1Valido = numero1.isNotEmpty() && numero1.all { it.isDigit() }
    val numero2Valido = numero2.isNotEmpty() && numero2.all { it.isDigit() }
    val numerosValidos = numero1Valido && numero2Valido

    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text("Suma de Numeros",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary)

        // Numero 1
        OutlinedTextField(
            value           = numero1,
            onValueChange   = { numero1 = it },
            label           = { Text("Numero 1") },
            leadingIcon     = { Icon(Icons.Default.Person, contentDescription = null) },
            isError         = numero1.isNotEmpty() && !numero1Valido,
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )

        // Numero 2
        OutlinedTextField(
            value           = numero2,
            onValueChange   = { numero2 = it },
            label           = { Text("Numero 2") },
            leadingIcon     = { Icon(Icons.Default.Person, contentDescription = null) },
            isError         = numero2.isNotEmpty() && !numero2Valido,
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )
        Button(
            onClick  = {
                resultado = (numero1.toInt() + numero2.toInt()).toString()},
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(text="Sumar")
        }
        Text(text=resultado)
    }
}

@Preview(showBackground = true)
@Composable
fun Paso01SumaPreview() {
    MaterialTheme { Paso01Suma() }
}