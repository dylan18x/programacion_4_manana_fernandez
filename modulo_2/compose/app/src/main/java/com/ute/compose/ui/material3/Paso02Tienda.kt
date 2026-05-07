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
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun Paso02Tienda() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text("Compra Tienda",
            style = MaterialTheme.typography.titleMedium)
        HorizontalDivider()
        CompraTienda()
        HorizontalDivider()
    }
}

// ── Demo 1: campo de búsqueda con limpiar ────────────────────────────────────────────────────────────
@Composable
private fun CompraTienda() {
    var nombreProducto     by remember { mutableStateOf("") }
    var cantidad    by remember { mutableStateOf("") }
    var precio    by remember { mutableStateOf("") }
    var subtotal   by remember { mutableStateOf("") }
    var descuento   by remember { mutableStateOf("") }
    var totalAPagar   by remember { mutableStateOf("") }


    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text("Tienda",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary)

        // Nombre
        OutlinedTextField(
            value           = nombreProducto,
            onValueChange   = { nombreProducto = it },
            label           = { Text("Ingrese nombre del producto") },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )

        // Cantidad
        OutlinedTextField(
            value           = cantidad,
            onValueChange   = { cantidad = it },
            label           = { Text("Ingrese cantidad del producto") },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )

        // Cantidad
        OutlinedTextField(
            value           = precio,
            onValueChange   = { precio = it },
            label           = { Text("Ingrese precio unitario del producto") },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
            singleLine      = true,
            modifier        = Modifier.fillMaxWidth()
        )
        Button(
            onClick  = {
            val precioDouble = precio.toDoubleOrNull()?:0.0
            val cantidadDouble = cantidad.toDoubleOrNull()?:0.0
            val subtotalDouble = (precioDouble*cantidadDouble)
            var porcentaje = 0.0
            if(subtotalDouble>50){
                porcentaje = 0.1;
            }else if (subtotalDouble>20){
                porcentaje = 0.05
            }
            var descuentoDouble = subtotalDouble*porcentaje
            var totalAPagarDouble = subtotalDouble - descuentoDouble
            subtotal = subtotalDouble.toString()
            descuento = descuentoDouble.toString()
            totalAPagar = totalAPagarDouble.toString()
                       },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(text =  "Calcular")
        }
            Text(text = "Nombre del producto: $nombreProducto")
            Text(text = "Subtotal: $subtotal")
            Text(text = "Descuento: $descuento")
            Text(text = "Total a pagar: $totalAPagar")
    }
}

@Preview(showBackground = true)
@Composable
fun Paso02CompraTienda() {
    MaterialTheme { Paso02Tienda() }
}